-- @operation: export
-- @entity: batch
-- @name: Add Amazon Channel Enhancement to All Profiles
-- @exportedAt: 2026-05-23T17:04:12.738Z
-- @opIds: 10798, 10799, 10800, 10801, 10802, 10803, 10804, 10805, 10806, 10807, 10808, 10809, 10810, 10811, 10812, 10813, 10814, 10815, 10816, 10817, 10818

-- --- BEGIN op 10798 ( create custom_format "Amazon Channel Enhancement" )
insert into "custom_formats" ("name", "description") values ('Amazon Channel Enhancement', '');
-- --- END op 10798

-- --- BEGIN op 10799 ( update custom_format "Amazon Channel Enhancement" )
update "custom_formats" set "description" = 'Augments the Streaming Service Score for 1080p Releases and below for 2160p Profiles' where "name" = 'Amazon Channel Enhancement' and "description" = '';
-- --- END op 10799

-- --- BEGIN op 10800 ( update custom_format "Amazon Channel Enhancement" )
insert into "tags" ("name") values ('Enhancement') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('Amazon Channel Enhancement', 'Enhancement');
-- --- END op 10800

-- --- BEGIN op 10801 ( update custom_format "Amazon Channel Enhancement" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Amazon Channel Enhancement', 'AMZN', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Amazon Channel Enhancement', 'AMZN', 'Amazon Prime');
-- --- END op 10801

-- --- BEGIN op 10802 ( update custom_format "Amazon Channel Enhancement" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Amazon Channel Enhancement', 'Not 2160p', 'resolution', 'all', 1, 1);

INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('Amazon Channel Enhancement', 'Not 2160p', '2160p');
-- --- END op 10802

-- --- BEGIN op 10803 ( update custom_format "Amazon Channel Enhancement" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Amazon Channel Enhancement', 'Onlyweb', 'release_group', 'sonarr', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Amazon Channel Enhancement', 'Onlyweb', 'OnlyWeb');
-- --- END op 10803

-- --- BEGIN op 10804 ( update custom_format "Amazon Channel Enhancement" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Amazon Channel Enhancement', 'GRiMM', 'release_group', 'sonarr', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Amazon Channel Enhancement', 'GRiMM', 'GRiMM');
-- --- END op 10804

-- --- BEGIN op 10805 ( update custom_format "Amazon Channel Enhancement" )
UPDATE custom_format_conditions
SET arr_type = 'sonarr'
WHERE custom_format_name = 'Amazon Channel Enhancement'
  AND name = 'AMZN'
  AND type = 'release_title'
  AND arr_type = 'all'
  AND negate = 0
  AND required = 1;
-- --- END op 10805

-- --- BEGIN op 10806 ( update custom_format "Amazon Channel Enhancement" )
UPDATE custom_format_conditions
SET arr_type = 'sonarr'
WHERE custom_format_name = 'Amazon Channel Enhancement'
  AND name = 'Not 2160p'
  AND type = 'resolution'
  AND arr_type = 'all'
  AND negate = 1
  AND required = 1;
-- --- END op 10806

-- --- BEGIN op 10807 ( update custom_format "Amazon Channel Enhancement" )
update "custom_formats" set "description" = 'Augments the Streaming Service Score for 1080p Releases and below' where "name" = 'Amazon Channel Enhancement' and "description" = 'Augments the Streaming Service Score for 1080p Releases and below for 2160p Profiles';
-- --- END op 10807

-- --- BEGIN op 10808 ( update quality_profile "1080p Balanced" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Balanced', 'Amazon Channel Enhancement', 'sonarr', -3000
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Balanced'
    AND custom_format_name = 'Amazon Channel Enhancement'
    AND arr_type = 'sonarr'
);
-- --- END op 10808

-- --- BEGIN op 10809 ( update quality_profile "1080p Compact" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Compact', 'Amazon Channel Enhancement', 'sonarr', -3000
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Compact'
    AND custom_format_name = 'Amazon Channel Enhancement'
    AND arr_type = 'sonarr'
);
-- --- END op 10809

-- --- BEGIN op 10810 ( update quality_profile "1080p Efficient" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Efficient', 'Amazon Channel Enhancement', 'sonarr', -3000
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Efficient'
    AND custom_format_name = 'Amazon Channel Enhancement'
    AND arr_type = 'sonarr'
);
-- --- END op 10810

-- --- BEGIN op 10811 ( update quality_profile "1080p Quality" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Quality', 'Amazon Channel Enhancement', 'sonarr', -3000
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Quality'
    AND custom_format_name = 'Amazon Channel Enhancement'
    AND arr_type = 'sonarr'
);
-- --- END op 10811

-- --- BEGIN op 10812 ( update quality_profile "1080p Quality HDR" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Quality HDR', 'Amazon Channel Enhancement', 'sonarr', -3000
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Quality HDR'
    AND custom_format_name = 'Amazon Channel Enhancement'
    AND arr_type = 'sonarr'
);
-- --- END op 10812

-- --- BEGIN op 10813 ( update quality_profile "1080p Remux" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Remux', 'Amazon Channel Enhancement', 'sonarr', -3000
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Remux'
    AND custom_format_name = 'Amazon Channel Enhancement'
    AND arr_type = 'sonarr'
);
-- --- END op 10813

-- --- BEGIN op 10814 ( update quality_profile "2160p Balanced" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Balanced', 'Amazon Channel Enhancement', 'sonarr', -3000
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Balanced'
    AND custom_format_name = 'Amazon Channel Enhancement'
    AND arr_type = 'sonarr'
);
-- --- END op 10814

-- --- BEGIN op 10815 ( update quality_profile "2160p Efficient" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Efficient', 'Amazon Channel Enhancement', 'sonarr', -3000
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Efficient'
    AND custom_format_name = 'Amazon Channel Enhancement'
    AND arr_type = 'sonarr'
);
-- --- END op 10815

-- --- BEGIN op 10816 ( update quality_profile "2160p Quality" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Quality', 'Amazon Channel Enhancement', 'sonarr', -3000
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Quality'
    AND custom_format_name = 'Amazon Channel Enhancement'
    AND arr_type = 'sonarr'
);
-- --- END op 10816

-- --- BEGIN op 10817 ( update quality_profile "2160p Remux" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Remux', 'Amazon Channel Enhancement', 'sonarr', -3000
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Remux'
    AND custom_format_name = 'Amazon Channel Enhancement'
    AND arr_type = 'sonarr'
);
-- --- END op 10817

-- --- BEGIN op 10818 ( update quality_profile "720p Quality" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '720p Quality', 'Amazon Channel Enhancement', 'sonarr', -3000
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '720p Quality'
    AND custom_format_name = 'Amazon Channel Enhancement'
    AND arr_type = 'sonarr'
);
-- --- END op 10818
