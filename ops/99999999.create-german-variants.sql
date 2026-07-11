-- ============================================================================
-- Personal customization: German variants of all upstream quality profiles
--
-- For every upstream quality_profile this migration creates a sibling
-- profile whose name is the original name suffixed with " german", with:
--
--   * required release language set to German (type 'must')
--   * "German DL" custom format score reset from -999999 to 0
--   * a "german" tag for easy filtering in Profilarr/Sonarr/Radarr
--   * an additional 'german' tag for filtering
--   * everything else (qualities, tiers, scores, upgrade_until, ...) copied
--     unchanged from the source profile
--
-- The migration is fully idempotent (WHERE NOT EXISTS guards), so it is safe
-- to replay against a database that already has some or all variants.
-- ============================================================================

-- 1) Clone the quality_profiles row itself
INSERT INTO quality_profiles (
  name, description, upgrades_allowed, minimum_custom_format_score,
  upgrade_until_score, upgrade_score_increment
)
SELECT
  src.name || ' german',
  src.description,
  src.upgrades_allowed,
  src.minimum_custom_format_score,
  src.upgrade_until_score,
  src.upgrade_score_increment
FROM quality_profiles src
WHERE src.name NOT LIKE '% german'
  AND NOT EXISTS (
    SELECT 1 FROM quality_profiles
    WHERE name = src.name || ' german'
  );

-- 2) Make sure a "german" tag exists
INSERT INTO tags (name)
SELECT 'german'
WHERE NOT EXISTS (SELECT 1 FROM tags WHERE name = 'german');

-- 3) Copy existing tags onto the German variant
INSERT INTO quality_profile_tags (quality_profile_name, tag_name)
SELECT
  src.quality_profile_name || ' german',
  src.tag_name
FROM quality_profile_tags src
WHERE src.quality_profile_name NOT LIKE '% german'
  AND EXISTS (
    SELECT 1 FROM quality_profiles WHERE name = src.quality_profile_name || ' german'
  )
  AND NOT EXISTS (
    SELECT 1 FROM quality_profile_tags
    WHERE quality_profile_name = src.quality_profile_name || ' german'
      AND tag_name = src.tag_name
  );

-- 4) Add the 'german' marker tag to every variant
INSERT INTO quality_profile_tags (quality_profile_name, tag_name)
SELECT qp.name, 'german'
FROM quality_profiles qp
WHERE qp.name LIKE '% german'
  AND NOT EXISTS (
    SELECT 1 FROM quality_profile_tags
    WHERE quality_profile_name = qp.name AND tag_name = 'german'
  );

-- 5) Copy quality groups (the named sub-groups within a profile)
INSERT INTO quality_groups (quality_profile_name, name)
SELECT
  src.quality_profile_name || ' german',
  src.name
FROM quality_groups src
WHERE src.quality_profile_name NOT LIKE '% german'
  AND EXISTS (
    SELECT 1 FROM quality_profiles WHERE name = src.quality_profile_name || ' german'
  )
  AND NOT EXISTS (
    SELECT 1 FROM quality_groups
    WHERE quality_profile_name = src.quality_profile_name || ' german'
      AND name = src.name
  );

-- 6) Copy quality group memberships
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position)
SELECT
  src.quality_profile_name || ' german',
  src.quality_group_name,
  src.quality_name,
  src.position
FROM quality_group_members src
WHERE src.quality_profile_name NOT LIKE '% german'
  AND EXISTS (
    SELECT 1 FROM quality_profiles WHERE name = src.quality_profile_name || ' german'
  )
  AND NOT EXISTS (
    SELECT 1 FROM quality_group_members
    WHERE quality_profile_name = src.quality_profile_name || ' german'
      AND quality_group_name = src.quality_group_name
      AND quality_name = src.quality_name
  );

-- 7) Copy the full quality ladder for the profile
INSERT INTO quality_profile_qualities (
  quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until
)
SELECT
  src.quality_profile_name || ' german',
  src.quality_name,
  src.quality_group_name,
  src.position,
  src.enabled,
  src.upgrade_until
FROM quality_profile_qualities src
WHERE src.quality_profile_name NOT LIKE '% german'
  AND EXISTS (
    SELECT 1 FROM quality_profiles WHERE name = src.quality_profile_name || ' german'
  )
  AND NOT EXISTS (
    SELECT 1 FROM quality_profile_qualities
    WHERE quality_profile_name = src.quality_profile_name || ' german'
      AND position = src.position
  );

-- 8) Set required language to German for every variant
--    (matches upstream's "type='must', language_name='Original'" pattern)
INSERT INTO quality_profile_languages (quality_profile_name, language_name, type)
SELECT qp.name, 'German', 'must'
FROM quality_profiles qp
WHERE qp.name LIKE '% german'
  AND NOT EXISTS (
    SELECT 1 FROM quality_profile_languages
    WHERE quality_profile_name = qp.name
      AND language_name = 'German'
  );

-- 9) Copy custom-format scores: reward "German DL" (+5000), neutralise
--    "Not Original or English" and the dual-audio / foreign-language group
--    bans (0). Those upstream bans reject dual/foreign audio, which is
--    exactly what we WANT in a German profile.
INSERT INTO quality_profile_custom_formats (
  quality_profile_name, custom_format_name, arr_type, score
)
SELECT
  src.quality_profile_name || ' german',
  src.custom_format_name,
  src.arr_type,
  CASE
    WHEN src.custom_format_name = 'German DL' THEN 5000
    WHEN src.custom_format_name IN (
      'Not Original or English',
      'Banned Language Groups',
      'Banned Dual Audio Groups'
    ) THEN 0
    ELSE src.score
  END
FROM quality_profile_custom_formats src
WHERE src.quality_profile_name NOT LIKE '% german'
  AND EXISTS (
    SELECT 1 FROM quality_profiles WHERE name = src.quality_profile_name || ' german'
  )
  AND NOT EXISTS (
    SELECT 1 FROM quality_profile_custom_formats
    WHERE quality_profile_name = src.quality_profile_name || ' german'
      AND custom_format_name = src.custom_format_name
      AND arr_type = src.arr_type
  );

-- 9a) Retrofit existing variants: step 9's INSERT is a no-op once the row
--     already exists, so bump "German DL" from the old neutral 0 up to +5000
--     here. Idempotent: once a row is 5000 it no longer matches score = 0.
UPDATE quality_profile_custom_formats
SET score = 5000
WHERE quality_profile_name LIKE '% german'
  AND custom_format_name = 'German DL'
  AND score = 0;

-- 9b) Retrofit existing variants: un-ban the dual-audio / foreign-language
--     release-group CFs on the German side (-999999 -> 0). Covers both
--     radarr and sonarr rows. Idempotent: once 0 they no longer match
--     score = -999999. "Banned Groups (Release Title)" is deliberately left
--     enforcing -- it bans for quality/scene reasons, not foreign audio.
UPDATE quality_profile_custom_formats
SET score = 0
WHERE quality_profile_name LIKE '% german'
  AND custom_format_name IN ('Banned Language Groups', 'Banned Dual Audio Groups')
  AND score = -999999;
