-- ============================================================================
-- Experimental: hard "prefer grouped x265 over x264" fork of 1080p Efficient
--
-- Clones "1080p Efficient" into "1080p Efficient x265" and rescores it so that
-- ANY x265 release *that carries a (non-banned) release group* outranks EVERY
-- x264 release, while x265 with no release group stays rejected.
--
-- Why the scores look large: in "1080p Efficient" a premium x264 Bluray already
-- stacks to ~1.58M ("1080p Balanced Tier 1" 881000, group-based + codec-agnostic,
-- plus "1080p Bluray (x264)" 700000). To make grouped x265 beat that we score the
-- x265 source CFs above that ceiling (1.90M / 1.85M).
--
-- Why the "release group present" condition is required: "Banned Groups" only
-- scores -999999, so an unconditional x265 reward above the x264 ceiling would
-- leave a no-group x265 at >580k and it would survive. Gating the reward on a
-- present release group keeps no-group x265 at -999999 (rejected) while grouped
-- x265 wins. Banned re-encoders (MeGusta, PSA, NiCEHEVC, NaNi, NIMA4K, nikt0,
-- pmHD, RARBG, ...) are inherited from the clone and stay rejected.
--
-- x264 is NOT banned here -- it keeps its normal score (>=200000 minimum) so it
-- remains an acceptable fallback, just always below grouped x265.
--
-- This op is numbered below 99999999 so the German-variants migration then
-- auto-creates "1080p Efficient x265 german" from it. Fully idempotent.
-- ============================================================================

-- ---------------------------------------------------------------------------
-- Part A: clone "1080p Efficient" -> "1080p Efficient x265"
-- ---------------------------------------------------------------------------

-- A1) the quality_profiles row
INSERT INTO quality_profiles (
  name, description, upgrades_allowed, minimum_custom_format_score,
  upgrade_until_score, upgrade_score_increment
)
SELECT
  '1080p Efficient x265',
  src.description, src.upgrades_allowed, src.minimum_custom_format_score,
  src.upgrade_until_score, src.upgrade_score_increment
FROM quality_profiles src
WHERE src.name = '1080p Efficient'
  AND NOT EXISTS (SELECT 1 FROM quality_profiles WHERE name = '1080p Efficient x265');

-- A2) marker tag + copy the source profile's tags, then tag the clone 'x265'
INSERT INTO tags (name)
SELECT 'x265' WHERE NOT EXISTS (SELECT 1 FROM tags WHERE name = 'x265');

INSERT INTO quality_profile_tags (quality_profile_name, tag_name)
SELECT '1080p Efficient x265', src.tag_name
FROM quality_profile_tags src
WHERE src.quality_profile_name = '1080p Efficient'
  AND NOT EXISTS (
    SELECT 1 FROM quality_profile_tags
    WHERE quality_profile_name = '1080p Efficient x265' AND tag_name = src.tag_name
  );

INSERT INTO quality_profile_tags (quality_profile_name, tag_name)
SELECT '1080p Efficient x265', 'x265'
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_tags
  WHERE quality_profile_name = '1080p Efficient x265' AND tag_name = 'x265'
);

-- A3) quality groups + memberships
INSERT INTO quality_groups (quality_profile_name, name)
SELECT '1080p Efficient x265', src.name
FROM quality_groups src
WHERE src.quality_profile_name = '1080p Efficient'
  AND NOT EXISTS (
    SELECT 1 FROM quality_groups
    WHERE quality_profile_name = '1080p Efficient x265' AND name = src.name
  );

INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position)
SELECT '1080p Efficient x265', src.quality_group_name, src.quality_name, src.position
FROM quality_group_members src
WHERE src.quality_profile_name = '1080p Efficient'
  AND NOT EXISTS (
    SELECT 1 FROM quality_group_members
    WHERE quality_profile_name = '1080p Efficient x265'
      AND quality_group_name = src.quality_group_name
      AND quality_name = src.quality_name
  );

-- A4) the quality ladder
INSERT INTO quality_profile_qualities (
  quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until
)
SELECT '1080p Efficient x265', src.quality_name, src.quality_group_name, src.position, src.enabled, src.upgrade_until
FROM quality_profile_qualities src
WHERE src.quality_profile_name = '1080p Efficient'
  AND NOT EXISTS (
    SELECT 1 FROM quality_profile_qualities
    WHERE quality_profile_name = '1080p Efficient x265' AND position = src.position
  );

-- A5) languages (verbatim -- the German sibling gets its own via 99999999)
INSERT INTO quality_profile_languages (quality_profile_name, language_name, type)
SELECT '1080p Efficient x265', src.language_name, src.type
FROM quality_profile_languages src
WHERE src.quality_profile_name = '1080p Efficient'
  AND NOT EXISTS (
    SELECT 1 FROM quality_profile_languages
    WHERE quality_profile_name = '1080p Efficient x265'
      AND language_name = src.language_name AND type = src.type
  );

-- A6) all custom-format scores, verbatim (x265 overrides applied in Part C)
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Efficient x265', src.custom_format_name, src.arr_type, src.score
FROM quality_profile_custom_formats src
WHERE src.quality_profile_name = '1080p Efficient'
  AND NOT EXISTS (
    SELECT 1 FROM quality_profile_custom_formats
    WHERE quality_profile_name = '1080p Efficient x265'
      AND custom_format_name = src.custom_format_name
      AND arr_type = src.arr_type
  );

-- ---------------------------------------------------------------------------
-- Part B: create the two group-gated x265 source custom formats
-- ---------------------------------------------------------------------------

-- "Has Release Group": matches when the release_group field is non-empty
INSERT INTO regular_expressions (name, pattern, description)
SELECT 'Has Release Group', '.', 'Matches when a release group is present.'
WHERE NOT EXISTS (SELECT 1 FROM regular_expressions WHERE name = 'Has Release Group');

-- helper: build a "1080p <source> x265, group present" CF
-- (resolution 1080p) AND (source) AND (release_title x265) AND (release_group present)

-- B1) 1080p Bluray (x265)
INSERT INTO custom_formats (name, description)
SELECT '1080p Bluray (x265)', 'Matches 1080p x265 Blurays that carry a release group.'
WHERE NOT EXISTS (SELECT 1 FROM custom_formats WHERE name = '1080p Bluray (x265)');

INSERT INTO tags (name) SELECT 'Source' WHERE NOT EXISTS (SELECT 1 FROM tags WHERE name = 'Source');
INSERT INTO custom_format_tags (custom_format_name, tag_name)
SELECT '1080p Bluray (x265)', 'Source'
WHERE NOT EXISTS (SELECT 1 FROM custom_format_tags WHERE custom_format_name = '1080p Bluray (x265)' AND tag_name = 'Source');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
SELECT '1080p Bluray (x265)', '1080p', 'resolution', 'all', 0, 1
WHERE NOT EXISTS (SELECT 1 FROM custom_format_conditions WHERE custom_format_name = '1080p Bluray (x265)' AND name = '1080p');
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution)
SELECT '1080p Bluray (x265)', '1080p', '1080p'
WHERE NOT EXISTS (SELECT 1 FROM condition_resolutions WHERE custom_format_name = '1080p Bluray (x265)' AND condition_name = '1080p');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
SELECT '1080p Bluray (x265)', 'Bluray', 'source', 'all', 0, 1
WHERE NOT EXISTS (SELECT 1 FROM custom_format_conditions WHERE custom_format_name = '1080p Bluray (x265)' AND name = 'Bluray');
INSERT INTO condition_sources (custom_format_name, condition_name, source)
SELECT '1080p Bluray (x265)', 'Bluray', 'bluray'
WHERE NOT EXISTS (SELECT 1 FROM condition_sources WHERE custom_format_name = '1080p Bluray (x265)' AND condition_name = 'Bluray');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
SELECT '1080p Bluray (x265)', 'x265', 'release_title', 'all', 0, 1
WHERE NOT EXISTS (SELECT 1 FROM custom_format_conditions WHERE custom_format_name = '1080p Bluray (x265)' AND name = 'x265');
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name)
SELECT '1080p Bluray (x265)', 'x265', 'x265'
WHERE NOT EXISTS (SELECT 1 FROM condition_patterns WHERE custom_format_name = '1080p Bluray (x265)' AND condition_name = 'x265');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
SELECT '1080p Bluray (x265)', 'Has Release Group', 'release_group', 'all', 0, 1
WHERE NOT EXISTS (SELECT 1 FROM custom_format_conditions WHERE custom_format_name = '1080p Bluray (x265)' AND name = 'Has Release Group');
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name)
SELECT '1080p Bluray (x265)', 'Has Release Group', 'Has Release Group'
WHERE NOT EXISTS (SELECT 1 FROM condition_patterns WHERE custom_format_name = '1080p Bluray (x265)' AND condition_name = 'Has Release Group');

-- B2) 1080p WEB-DL (x265)
INSERT INTO custom_formats (name, description)
SELECT '1080p WEB-DL (x265)', 'Matches 1080p x265 WEB-DLs that carry a release group.'
WHERE NOT EXISTS (SELECT 1 FROM custom_formats WHERE name = '1080p WEB-DL (x265)');

INSERT INTO custom_format_tags (custom_format_name, tag_name)
SELECT '1080p WEB-DL (x265)', 'Source'
WHERE NOT EXISTS (SELECT 1 FROM custom_format_tags WHERE custom_format_name = '1080p WEB-DL (x265)' AND tag_name = 'Source');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
SELECT '1080p WEB-DL (x265)', '1080p', 'resolution', 'all', 0, 1
WHERE NOT EXISTS (SELECT 1 FROM custom_format_conditions WHERE custom_format_name = '1080p WEB-DL (x265)' AND name = '1080p');
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution)
SELECT '1080p WEB-DL (x265)', '1080p', '1080p'
WHERE NOT EXISTS (SELECT 1 FROM condition_resolutions WHERE custom_format_name = '1080p WEB-DL (x265)' AND condition_name = '1080p');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
SELECT '1080p WEB-DL (x265)', 'WEB-DL', 'source', 'all', 0, 1
WHERE NOT EXISTS (SELECT 1 FROM custom_format_conditions WHERE custom_format_name = '1080p WEB-DL (x265)' AND name = 'WEB-DL');
INSERT INTO condition_sources (custom_format_name, condition_name, source)
SELECT '1080p WEB-DL (x265)', 'WEB-DL', 'web_dl'
WHERE NOT EXISTS (SELECT 1 FROM condition_sources WHERE custom_format_name = '1080p WEB-DL (x265)' AND condition_name = 'WEB-DL');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
SELECT '1080p WEB-DL (x265)', 'x265', 'release_title', 'all', 0, 1
WHERE NOT EXISTS (SELECT 1 FROM custom_format_conditions WHERE custom_format_name = '1080p WEB-DL (x265)' AND name = 'x265');
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name)
SELECT '1080p WEB-DL (x265)', 'x265', 'x265'
WHERE NOT EXISTS (SELECT 1 FROM condition_patterns WHERE custom_format_name = '1080p WEB-DL (x265)' AND condition_name = 'x265');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
SELECT '1080p WEB-DL (x265)', 'Has Release Group', 'release_group', 'all', 0, 1
WHERE NOT EXISTS (SELECT 1 FROM custom_format_conditions WHERE custom_format_name = '1080p WEB-DL (x265)' AND name = 'Has Release Group');
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name)
SELECT '1080p WEB-DL (x265)', 'Has Release Group', 'Has Release Group'
WHERE NOT EXISTS (SELECT 1 FROM condition_patterns WHERE custom_format_name = '1080p WEB-DL (x265)' AND condition_name = 'Has Release Group');

-- ---------------------------------------------------------------------------
-- Part C: score the x265 profile (radarr + sonarr)
-- ---------------------------------------------------------------------------

-- C1) grouped x265 sources, scored above the ~1.58M x264 ceiling
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Efficient x265', '1080p Bluray (x265)', a.arr_type, 1900000
FROM (SELECT 'radarr' AS arr_type UNION ALL SELECT 'sonarr') a
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Efficient x265'
    AND custom_format_name = '1080p Bluray (x265)' AND arr_type = a.arr_type
);

INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Efficient x265', '1080p WEB-DL (x265)', a.arr_type, 1850000
FROM (SELECT 'radarr' AS arr_type UNION ALL SELECT 'sonarr') a
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Efficient x265'
    AND custom_format_name = '1080p WEB-DL (x265)' AND arr_type = a.arr_type
);

-- C2) drop the inherited blanket x265 penalties so generic grouped x265 isn't
--     dragged negative (the group gate + Banned Groups still reject no-group x265)
UPDATE quality_profile_custom_formats
SET score = 0
WHERE quality_profile_name = '1080p Efficient x265'
  AND custom_format_name IN ('x265 (Efficient)', 'x265 (Bluray)')
  AND score < 0;
