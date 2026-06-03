-- @operation: export
-- @entity: batch
-- @name: Shift some Release Groups to Banned Language Groups
-- @exportedAt: 2026-06-03T00:10:28.823Z
-- @opIds: 10860, 10861, 10862, 10863, 10864, 10865, 10866, 10867, 10868, 10869, 10870, 10871, 10872, 10873, 10874, 10875, 10876, 10877, 10878, 10879, 10880, 10881, 10882, 10883, 10884, 10885, 10886, 10887, 10888, 10889, 10890, 10891, 10892, 10893, 10894, 10895, 10896, 10897, 10898, 10899, 10900, 10901, 10902, 10903, 10904, 10905, 10906, 10907

-- --- BEGIN op 10860 ( create custom_format "Banned Language Groups" )
insert into "custom_formats" ("name", "description") values ('Banned Language Groups', '');
-- --- END op 10860

-- --- BEGIN op 10861 ( update custom_format "Banned Language Groups" )
update "custom_formats" set "description" = 'Match Releases that contain Dual Audio Regex' where "name" = 'Banned Language Groups' and "description" = '';
-- --- END op 10861

-- --- BEGIN op 10862 ( update custom_format "Banned Language Groups" )
insert into "tags" ("name") values ('Banned') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('Banned Language Groups', 'Banned');
-- --- END op 10862

-- --- BEGIN op 10863 ( update custom_format "Banned Language Groups" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Language Groups', 'CYPHER', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Language Groups', 'CYPHER', 'CYPHER');
-- --- END op 10863

-- --- BEGIN op 10864 ( update custom_format "Banned Language Groups" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Language Groups', 'Dual Audio', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Language Groups', 'Dual Audio', 'Dual Audio');
-- --- END op 10864

-- --- BEGIN op 10865 ( update custom_format "Banned Language Groups" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Language Groups', 'SiGLA', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Language Groups', 'SiGLA', 'SiGLA');
-- --- END op 10865

-- --- BEGIN op 10866 ( update custom_format "Banned Language Groups" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Language Groups', 'TURG', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Language Groups', 'TURG', 'TURG');
-- --- END op 10866

-- --- BEGIN op 10867 ( update custom_format "Banned Language Groups" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Language Groups', 'alfahd', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Language Groups', 'alfahd', 'alfaHD');
-- --- END op 10867

-- --- BEGIN op 10868 ( update custom_format "Banned Language Groups" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Language Groups'
	  AND name = 'Dual Audio'
	  AND type = 'release_title'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 1;
-- --- END op 10868

-- --- BEGIN op 10869 ( update custom_format "Banned Language Groups" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Language Groups'
	  AND name = 'SiGLA'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 10869

-- --- BEGIN op 10870 ( update custom_format "Banned Language Groups" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Language Groups'
	  AND name = 'alfahd'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 10870

-- --- BEGIN op 10871 ( update custom_format "Banned Dual Audio Groups" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Dual Audio Groups'
	  AND name = 'CYPHER'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 10871

-- --- BEGIN op 10872 ( update custom_format "Banned Dual Audio Groups" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Dual Audio Groups'
	  AND name = 'TURG'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 10872

-- --- BEGIN op 10873 ( update custom_format "Banned Groups" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups'
	  AND name = 'NIMA4K'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 10873

-- --- BEGIN op 10874 ( update custom_format "Banned Language Groups" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Language Groups', 'NIMA4K', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Language Groups', 'NIMA4K', 'NIMA4K');
-- --- END op 10874

-- --- BEGIN op 10875 ( update custom_format "Banned Groups" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups'
	  AND name = 'pmHD'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 10875

-- --- BEGIN op 10876 ( update custom_format "Banned Language Groups" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Language Groups', 'pmHD', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Language Groups', 'pmHD', 'pmHD');
-- --- END op 10876

-- --- BEGIN op 10877 ( update custom_format "Banned Groups" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups'
	  AND name = 'TvR'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 10877

-- --- BEGIN op 10878 ( update custom_format "Banned Language Groups" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Language Groups', 'TvR', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Language Groups', 'TvR', 'TvR');
-- --- END op 10878

-- --- BEGIN op 10879 ( update custom_format "Banned Language Groups" )
update "custom_formats" set "description" = 'Match Releases that contain a Non Original Audio Default' where "name" = 'Banned Language Groups' and "description" = 'Match Releases that contain Dual Audio Regex';
-- --- END op 10879

-- --- BEGIN op 10880 ( update quality_profile "1080p Balanced" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Balanced', 'Banned Language Groups', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Balanced'
    AND custom_format_name = 'Banned Language Groups'
    AND arr_type = 'radarr'
);
-- --- END op 10880

-- --- BEGIN op 10881 ( update quality_profile "1080p Balanced" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Balanced', 'Banned Language Groups', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Balanced'
    AND custom_format_name = 'Banned Language Groups'
    AND arr_type = 'sonarr'
);
-- --- END op 10881

-- --- BEGIN op 10882 ( update quality_profile "1080p Compact" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Compact', 'Banned Language Groups', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Compact'
    AND custom_format_name = 'Banned Language Groups'
    AND arr_type = 'radarr'
);
-- --- END op 10882

-- --- BEGIN op 10883 ( update quality_profile "1080p Compact" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Compact', 'Banned Language Groups', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Compact'
    AND custom_format_name = 'Banned Language Groups'
    AND arr_type = 'sonarr'
);
-- --- END op 10883

-- --- BEGIN op 10884 ( update quality_profile "1080p Efficient" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Efficient', 'Banned Language Groups', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Efficient'
    AND custom_format_name = 'Banned Language Groups'
    AND arr_type = 'radarr'
);
-- --- END op 10884

-- --- BEGIN op 10885 ( update quality_profile "1080p Efficient" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Efficient', 'Banned Language Groups', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Efficient'
    AND custom_format_name = 'Banned Language Groups'
    AND arr_type = 'sonarr'
);
-- --- END op 10885

-- --- BEGIN op 10886 ( update quality_profile "1080p Quality" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Quality', 'Banned Language Groups', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Quality'
    AND custom_format_name = 'Banned Language Groups'
    AND arr_type = 'radarr'
);
-- --- END op 10886

-- --- BEGIN op 10887 ( update quality_profile "1080p Quality" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Quality', 'Banned Language Groups', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Quality'
    AND custom_format_name = 'Banned Language Groups'
    AND arr_type = 'sonarr'
);
-- --- END op 10887

-- --- BEGIN op 10888 ( update quality_profile "1080p Quality HDR" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Quality HDR', 'Banned Language Groups', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Quality HDR'
    AND custom_format_name = 'Banned Language Groups'
    AND arr_type = 'radarr'
);
-- --- END op 10888

-- --- BEGIN op 10889 ( update quality_profile "1080p Quality HDR" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Quality HDR', 'Banned Language Groups', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Quality HDR'
    AND custom_format_name = 'Banned Language Groups'
    AND arr_type = 'sonarr'
);
-- --- END op 10889

-- --- BEGIN op 10890 ( update quality_profile "1080p Remux" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Remux', 'Banned Language Groups', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Remux'
    AND custom_format_name = 'Banned Language Groups'
    AND arr_type = 'radarr'
);
-- --- END op 10890

-- --- BEGIN op 10891 ( update quality_profile "1080p Remux" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Remux', 'Banned Language Groups', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Remux'
    AND custom_format_name = 'Banned Language Groups'
    AND arr_type = 'sonarr'
);
-- --- END op 10891

-- --- BEGIN op 10892 ( update quality_profile "2160p Balanced" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Balanced', 'Banned Groups (Release Title)', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Balanced'
    AND custom_format_name = 'Banned Groups (Release Title)'
    AND arr_type = 'radarr'
);
-- --- END op 10892

-- --- BEGIN op 10893 ( update quality_profile "2160p Balanced" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Balanced', 'Banned Groups (Release Title)', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Balanced'
    AND custom_format_name = 'Banned Groups (Release Title)'
    AND arr_type = 'sonarr'
);
-- --- END op 10893

-- --- BEGIN op 10894 ( update quality_profile "2160p Efficient" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Efficient', 'Banned Language Groups', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Efficient'
    AND custom_format_name = 'Banned Language Groups'
    AND arr_type = 'radarr'
);
-- --- END op 10894

-- --- BEGIN op 10895 ( update quality_profile "2160p Efficient" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Efficient', 'Banned Language Groups', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Efficient'
    AND custom_format_name = 'Banned Language Groups'
    AND arr_type = 'sonarr'
);
-- --- END op 10895

-- --- BEGIN op 10896 ( update quality_profile "2160p Quality" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Quality', 'Banned Language Groups', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Quality'
    AND custom_format_name = 'Banned Language Groups'
    AND arr_type = 'radarr'
);
-- --- END op 10896

-- --- BEGIN op 10897 ( update quality_profile "2160p Quality" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Quality', 'Banned Language Groups', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Quality'
    AND custom_format_name = 'Banned Language Groups'
    AND arr_type = 'sonarr'
);
-- --- END op 10897

-- --- BEGIN op 10898 ( update quality_profile "2160p Remux" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Remux', 'Banned Language Groups', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Remux'
    AND custom_format_name = 'Banned Language Groups'
    AND arr_type = 'radarr'
);
-- --- END op 10898

-- --- BEGIN op 10899 ( update quality_profile "2160p Remux" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Remux', 'Banned Language Groups', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Remux'
    AND custom_format_name = 'Banned Language Groups'
    AND arr_type = 'sonarr'
);
-- --- END op 10899

-- --- BEGIN op 10900 ( update quality_profile "720p Quality" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '720p Quality', 'Banned Language Groups', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '720p Quality'
    AND custom_format_name = 'Banned Language Groups'
    AND arr_type = 'radarr'
);
-- --- END op 10900

-- --- BEGIN op 10901 ( update quality_profile "720p Quality" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '720p Quality', 'Banned Language Groups', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '720p Quality'
    AND custom_format_name = 'Banned Language Groups'
    AND arr_type = 'sonarr'
);
-- --- END op 10901

-- --- BEGIN op 10902 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'NIMA4K'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 10902

-- --- BEGIN op 10903 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'TvR'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 10903

-- --- BEGIN op 10904 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'pmHD'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 10904

-- --- BEGIN op 10905 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'NIMA4K'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 10905

-- --- BEGIN op 10906 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'TvR'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 10906

-- --- BEGIN op 10907 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'pmHD'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 10907
