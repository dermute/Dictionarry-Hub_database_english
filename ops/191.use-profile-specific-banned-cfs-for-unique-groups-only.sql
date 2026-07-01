-- @operation: export
-- @entity: batch
-- @name: Use Profile Specific Banned CFs for Unique Groups Only
-- @exportedAt: 2026-06-30T19:44:32.939Z
-- @opIds: 11587, 11588, 11589, 11590, 11591, 11592, 11593, 11594, 11595, 11596, 11597, 11598, 11599, 11600, 11601, 11602, 11603, 11604, 11605, 11606, 11607, 11608, 11609, 11610, 11611, 11612, 11613, 11614, 11615, 11616, 11617, 11618, 11619, 11620

-- --- BEGIN op 11587 ( create custom_format "Banned Groups (Regular)" )
insert into "custom_formats" ("name", "description") values ('Banned Groups (Regular)', '');
-- --- END op 11587

-- --- BEGIN op 11588 ( update custom_format "Banned Groups (Regular)" )
update "custom_formats" set "description" = 'Matches Release Groups that are Banned' where "name" = 'Banned Groups (Regular)' and "description" = '';
-- --- END op 11588

-- --- BEGIN op 11589 ( update custom_format "Banned Groups (Regular)" )
insert into "tags" ("name") values ('Banned') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('Banned Groups (Regular)', 'Banned');

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('Banned Groups (Regular)', 'Release Group');
-- --- END op 11589

-- --- BEGIN op 11590 ( update custom_format "Banned Groups" )
update "custom_formats" set "description" = 'Matches Banned Release Groups that apply to all profiles' where "name" = 'Banned Groups' and "description" = 'Matches Release Groups that are Banned';
-- --- END op 11590

-- --- BEGIN op 11591 ( update custom_format "Banned Groups (Compact)" )
update "custom_formats" set "description" = 'Matches Banned Release Groups that apply to the Compact profile' where "name" = 'Banned Groups (Compact)' and "description" = 'Matches Release Groups that are Banned';
-- --- END op 11591

-- --- BEGIN op 11592 ( update custom_format "Banned Groups (Efficient)" )
update "custom_formats" set "description" = 'Matches Banned Release Groups that apply to the Efficient profiles' where "name" = 'Banned Groups (Efficient)' and "description" = 'Matches Release Groups that are Banned';
-- --- END op 11592

-- --- BEGIN op 11593 ( update custom_format "Banned Groups (Efficient)" )
update "custom_formats" set "description" = 'Matches Banned Release Groups that apply to the Efficient profile' where "name" = 'Banned Groups (Efficient)' and "description" = 'Matches Banned Release Groups that apply to the Efficient profiles';
-- --- END op 11593

-- --- BEGIN op 11594 ( update custom_format "Banned Groups (Regular)" )
update "custom_formats" set "description" = 'Matches Banned Release Groups that apply to NON Compact and Efficient Profiles' where "name" = 'Banned Groups (Regular)' and "description" = 'Matches Release Groups that are Banned';
-- --- END op 11594

-- --- BEGIN op 11595 ( update custom_format "Banned Groups (Compact)" )
update "custom_formats" set "description" = 'Matches Banned Release Groups that apply to the Compact Profile' where "name" = 'Banned Groups (Compact)' and "description" = 'Matches Banned Release Groups that apply to the Compact profile';
-- --- END op 11595

-- --- BEGIN op 11596 ( update custom_format "Banned Groups (Efficient)" )
update "custom_formats" set "description" = 'Matches Banned Release Groups that apply to the Efficient Profile' where "name" = 'Banned Groups (Efficient)' and "description" = 'Matches Banned Release Groups that apply to the Efficient profile';
-- --- END op 11596

-- --- BEGIN op 11597 ( update custom_format "Banned Groups" )
update "custom_formats" set "description" = 'Matches Banned Release Groups that apply to all Profiles' where "name" = 'Banned Groups' and "description" = 'Matches Banned Release Groups that apply to all profiles';
-- --- END op 11597

-- --- BEGIN op 11598 ( update custom_format "Banned Groups" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups'
	  AND name = 'RARBG'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11598

-- --- BEGIN op 11599 ( update custom_format "Banned Groups (Efficient)" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Groups (Efficient)', 'RARBG', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Groups (Efficient)', 'RARBG', 'RARBG');
-- --- END op 11599

-- --- BEGIN op 11600 ( update custom_format "Banned Groups (Regular)" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Groups (Regular)', 'RARBG', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Groups (Regular)', 'RARBG', 'RARBG');
-- --- END op 11600

-- --- BEGIN op 11601 ( update quality_profile "1080p Balanced" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Balanced', 'Banned Groups (Regular)', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Balanced'
    AND custom_format_name = 'Banned Groups (Regular)'
    AND arr_type = 'radarr'
);
-- --- END op 11601

-- --- BEGIN op 11602 ( update quality_profile "1080p Balanced" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Balanced', 'Banned Groups (Regular)', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Balanced'
    AND custom_format_name = 'Banned Groups (Regular)'
    AND arr_type = 'sonarr'
);
-- --- END op 11602

-- --- BEGIN op 11603 ( update quality_profile "1080p Efficient" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Efficient', 'Banned Groups (Efficient)', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Efficient'
    AND custom_format_name = 'Banned Groups (Efficient)'
    AND arr_type = 'radarr'
);
-- --- END op 11603

-- --- BEGIN op 11604 ( update quality_profile "1080p Efficient" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Efficient', 'Banned Groups (Efficient)', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Efficient'
    AND custom_format_name = 'Banned Groups (Efficient)'
    AND arr_type = 'sonarr'
);
-- --- END op 11604

-- --- BEGIN op 11605 ( update quality_profile "1080p Quality" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Quality', 'Banned Groups (Regular)', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Quality'
    AND custom_format_name = 'Banned Groups (Regular)'
    AND arr_type = 'radarr'
);
-- --- END op 11605

-- --- BEGIN op 11606 ( update quality_profile "1080p Quality" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Quality', 'Banned Groups (Regular)', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Quality'
    AND custom_format_name = 'Banned Groups (Regular)'
    AND arr_type = 'sonarr'
);
-- --- END op 11606

-- --- BEGIN op 11607 ( update quality_profile "1080p Quality HDR" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Quality HDR', 'Banned Groups (Regular)', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Quality HDR'
    AND custom_format_name = 'Banned Groups (Regular)'
    AND arr_type = 'radarr'
);
-- --- END op 11607

-- --- BEGIN op 11608 ( update quality_profile "1080p Quality HDR" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Quality HDR', 'Banned Groups (Regular)', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Quality HDR'
    AND custom_format_name = 'Banned Groups (Regular)'
    AND arr_type = 'sonarr'
);
-- --- END op 11608

-- --- BEGIN op 11609 ( update quality_profile "1080p Remux" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Remux', 'Banned Groups (Regular)', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Remux'
    AND custom_format_name = 'Banned Groups (Regular)'
    AND arr_type = 'radarr'
);
-- --- END op 11609

-- --- BEGIN op 11610 ( update quality_profile "1080p Remux" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Remux', 'Banned Groups (Regular)', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Remux'
    AND custom_format_name = 'Banned Groups (Regular)'
    AND arr_type = 'sonarr'
);
-- --- END op 11610

-- --- BEGIN op 11611 ( update quality_profile "2160p Balanced" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Balanced', 'Banned Groups (Regular)', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Balanced'
    AND custom_format_name = 'Banned Groups (Regular)'
    AND arr_type = 'radarr'
);
-- --- END op 11611

-- --- BEGIN op 11612 ( update quality_profile "2160p Balanced" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Balanced', 'Banned Groups (Regular)', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Balanced'
    AND custom_format_name = 'Banned Groups (Regular)'
    AND arr_type = 'sonarr'
);
-- --- END op 11612

-- --- BEGIN op 11613 ( update quality_profile "2160p Efficient" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Efficient', 'Banned Groups (Efficient)', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Efficient'
    AND custom_format_name = 'Banned Groups (Efficient)'
    AND arr_type = 'radarr'
);
-- --- END op 11613

-- --- BEGIN op 11614 ( update quality_profile "2160p Efficient" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Efficient', 'Banned Groups (Efficient)', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Efficient'
    AND custom_format_name = 'Banned Groups (Efficient)'
    AND arr_type = 'sonarr'
);
-- --- END op 11614

-- --- BEGIN op 11615 ( update quality_profile "2160p Quality" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Quality', 'Banned Groups (Regular)', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Quality'
    AND custom_format_name = 'Banned Groups (Regular)'
    AND arr_type = 'radarr'
);
-- --- END op 11615

-- --- BEGIN op 11616 ( update quality_profile "2160p Quality" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Quality', 'Banned Groups (Regular)', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Quality'
    AND custom_format_name = 'Banned Groups (Regular)'
    AND arr_type = 'sonarr'
);
-- --- END op 11616

-- --- BEGIN op 11617 ( update quality_profile "2160p Remux" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Remux', 'Banned Groups (Regular)', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Remux'
    AND custom_format_name = 'Banned Groups (Regular)'
    AND arr_type = 'radarr'
);
-- --- END op 11617

-- --- BEGIN op 11618 ( update quality_profile "2160p Remux" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Remux', 'Banned Groups (Regular)', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Remux'
    AND custom_format_name = 'Banned Groups (Regular)'
    AND arr_type = 'sonarr'
);
-- --- END op 11618

-- --- BEGIN op 11619 ( update quality_profile "720p Quality" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '720p Quality', 'Banned Groups (Regular)', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '720p Quality'
    AND custom_format_name = 'Banned Groups (Regular)'
    AND arr_type = 'radarr'
);
-- --- END op 11619

-- --- BEGIN op 11620 ( update quality_profile "720p Quality" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '720p Quality', 'Banned Groups (Regular)', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '720p Quality'
    AND custom_format_name = 'Banned Groups (Regular)'
    AND arr_type = 'sonarr'
);
-- --- END op 11620
