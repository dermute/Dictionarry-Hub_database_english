-- @operation: export
-- @entity: batch
-- @name: Add SDR CF to 2160p Profiles to Highlight NON MA SDR Releases
-- @exportedAt: 2026-07-11T00:11:48.526Z
-- @opIds: 12326, 12327, 12333, 12334, 12335, 12336

-- --- BEGIN op 12326 ( update quality_profile "2160p Balanced" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '2160p Balanced'
  AND custom_format_name = '2160p iTunes Enhancement'
  AND arr_type = 'radarr'
  AND score = 0;
-- --- END op 12326

-- --- BEGIN op 12327 ( update quality_profile "2160p Balanced" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Balanced', '2160p SDR', 'radarr', 0
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Balanced'
    AND custom_format_name = '2160p SDR'
    AND arr_type = 'radarr'
);
-- --- END op 12327

-- --- BEGIN op 12333 ( update custom_format "SDR" )
update "custom_formats" set "name" = 'SDR' where "name" = '2160p SDR';
-- --- END op 12333

-- --- BEGIN op 12334 ( update quality_profile "2160p Balanced" )
update "quality_profile_custom_formats" set "custom_format_name" = 'SDR' where "quality_profile_name" = '2160p Balanced' and "custom_format_name" = '2160p SDR' and "arr_type" = 'radarr' and "score" = 0;
-- --- END op 12334

-- --- BEGIN op 12335 ( update quality_profile "2160p Remux" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Remux', 'SDR', 'radarr', 0
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Remux'
    AND custom_format_name = 'SDR'
    AND arr_type = 'radarr'
);
-- --- END op 12335

-- --- BEGIN op 12336 ( update quality_profile "2160p Efficient" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Efficient', 'SDR', 'radarr', 0
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Efficient'
    AND custom_format_name = 'SDR'
    AND arr_type = 'radarr'
);
-- --- END op 12336
