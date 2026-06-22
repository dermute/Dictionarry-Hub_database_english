-- @operation: export
-- @entity: batch
-- @name: Ban CAM Releases
-- @exportedAt: 2026-06-21T18:57:34.918Z
-- @opIds: 11317, 11318, 11319, 11320, 11321, 11322, 11323, 11324, 11325, 11326, 11327, 11328, 11329, 11330, 11331, 11332, 11333, 11334

-- --- BEGIN op 11317 ( create regular_expression "CAM" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('CAM', '(?<=\b[12]\d{3}\b).*(\b(AI)\b)', 'Matches AI Upscales', NULL);

insert into "tags" ("name") values ('Banned') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('CAM', 'Banned');

insert into "tags" ("name") values ('Enhancement') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('CAM', 'Enhancement');
-- --- END op 11317

-- --- BEGIN op 11318 ( update regular_expression "CAM" )
update "regular_expressions" set "description" = 'Matches CAM Releases' where "name" = 'CAM' and "description" = 'Matches AI Upscales';
-- --- END op 11318

-- --- BEGIN op 11319 ( update regular_expression "CAM" )
update "regular_expressions" set "pattern" = '(?<=\b[12]\d{3}\b).*(\b(CAM|HDTS|TELESYNC)\b)' where "name" = 'CAM' and "pattern" = '(?<=\b[12]\d{3}\b).*(\b(AI)\b)';
-- --- END op 11319

-- --- BEGIN op 11320 ( create custom_format "CAM" )
insert into "custom_formats" ("name", "description") values ('CAM', '');
-- --- END op 11320

-- --- BEGIN op 11321 ( update custom_format "CAM" )
update "custom_formats" set "description" = 'Matches CAM Releases' where "name" = 'CAM' and "description" = '';
-- --- END op 11321

-- --- BEGIN op 11322 ( update custom_format "CAM" )
insert into "tags" ("name") values ('Banned') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('CAM', 'Banned');
-- --- END op 11322

-- --- BEGIN op 11323 ( update custom_format "CAM" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('CAM', 'CAM', 'release_title', 'radarr', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('CAM', 'CAM', 'CAM');
-- --- END op 11323

-- --- BEGIN op 11324 ( update quality_profile "1080p Balanced" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Balanced', 'CAM', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Balanced'
    AND custom_format_name = 'CAM'
    AND arr_type = 'radarr'
);
-- --- END op 11324

-- --- BEGIN op 11325 ( update quality_profile "1080p Compact" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Compact', 'CAM', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Compact'
    AND custom_format_name = 'CAM'
    AND arr_type = 'radarr'
);
-- --- END op 11325

-- --- BEGIN op 11326 ( update quality_profile "1080p Efficient" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Efficient', 'CAM', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Efficient'
    AND custom_format_name = 'CAM'
    AND arr_type = 'radarr'
);
-- --- END op 11326

-- --- BEGIN op 11327 ( update quality_profile "1080p Quality" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Quality', 'CAM', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Quality'
    AND custom_format_name = 'CAM'
    AND arr_type = 'radarr'
);
-- --- END op 11327

-- --- BEGIN op 11328 ( update quality_profile "1080p Quality HDR" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Quality HDR', 'CAM', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Quality HDR'
    AND custom_format_name = 'CAM'
    AND arr_type = 'radarr'
);
-- --- END op 11328

-- --- BEGIN op 11329 ( update quality_profile "1080p Remux" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Remux', 'CAM', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Remux'
    AND custom_format_name = 'CAM'
    AND arr_type = 'radarr'
);
-- --- END op 11329

-- --- BEGIN op 11330 ( update quality_profile "2160p Balanced" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Balanced', 'CAM', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Balanced'
    AND custom_format_name = 'CAM'
    AND arr_type = 'radarr'
);
-- --- END op 11330

-- --- BEGIN op 11331 ( update quality_profile "2160p Efficient" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Efficient', 'CAM', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Efficient'
    AND custom_format_name = 'CAM'
    AND arr_type = 'radarr'
);
-- --- END op 11331

-- --- BEGIN op 11332 ( update quality_profile "2160p Quality" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Quality', 'CAM', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Quality'
    AND custom_format_name = 'CAM'
    AND arr_type = 'radarr'
);
-- --- END op 11332

-- --- BEGIN op 11333 ( update quality_profile "2160p Remux" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Remux', 'CAM', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Remux'
    AND custom_format_name = 'CAM'
    AND arr_type = 'radarr'
);
-- --- END op 11333

-- --- BEGIN op 11334 ( update quality_profile "720p Quality" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '720p Quality', 'CAM', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '720p Quality'
    AND custom_format_name = 'CAM'
    AND arr_type = 'radarr'
);
-- --- END op 11334
