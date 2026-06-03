-- @operation: export
-- @entity: batch
-- @name: Remove Banned Groups (Release Title)
-- @exportedAt: 2026-06-03T03:48:27.267Z
-- @opIds: 10909, 10910

-- --- BEGIN op 10909 ( update quality_profile "2160p Balanced" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '2160p Balanced'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'radarr'
  AND score = -999999;
-- --- END op 10909

-- --- BEGIN op 10910 ( update quality_profile "2160p Balanced" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '2160p Balanced'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'sonarr'
  AND score = -999999;
-- --- END op 10910
