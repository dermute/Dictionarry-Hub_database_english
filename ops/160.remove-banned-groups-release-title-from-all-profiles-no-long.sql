-- @operation: export
-- @entity: batch
-- @name: Remove Banned Groups (Release Title) from All Profiles No Longer Needed
-- @exportedAt: 2026-05-21T15:59:22.239Z
-- @opIds: 10585, 10586, 10587, 10588, 10589, 10590, 10591, 10592, 10593, 10594, 10595, 10596, 10597, 10598, 10599, 10600, 10601, 10602, 10603, 10604, 10605, 10606, 10607

-- --- BEGIN op 10585 ( update quality_profile "1080p Balanced" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '1080p Balanced'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'radarr'
  AND score = -999999;
-- --- END op 10585

-- --- BEGIN op 10586 ( update quality_profile "1080p Balanced" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '1080p Balanced'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'sonarr'
  AND score = -999999;
-- --- END op 10586

-- --- BEGIN op 10587 ( update quality_profile "1080p Compact" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '1080p Compact'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'radarr'
  AND score = -999999;
-- --- END op 10587

-- --- BEGIN op 10588 ( update quality_profile "1080p Compact" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '1080p Compact'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'sonarr'
  AND score = -999999;
-- --- END op 10588

-- --- BEGIN op 10589 ( update quality_profile "1080p Efficient" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '1080p Efficient'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'radarr'
  AND score = -999999;
-- --- END op 10589

-- --- BEGIN op 10590 ( update quality_profile "1080p Efficient" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '1080p Efficient'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'sonarr'
  AND score = -999999;
-- --- END op 10590

-- --- BEGIN op 10591 ( update quality_profile "1080p Quality" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '1080p Quality'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'radarr'
  AND score = -999999;
-- --- END op 10591

-- --- BEGIN op 10592 ( update quality_profile "1080p Quality" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '1080p Quality'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'sonarr'
  AND score = -999999;
-- --- END op 10592

-- --- BEGIN op 10593 ( update quality_profile "1080p Quality HDR" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '1080p Quality HDR'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'radarr'
  AND score = -999999;
-- --- END op 10593

-- --- BEGIN op 10594 ( update quality_profile "1080p Quality HDR" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '1080p Quality HDR'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'sonarr'
  AND score = -999999;
-- --- END op 10594

-- --- BEGIN op 10595 ( update quality_profile "1080p Remux" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '1080p Remux'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'radarr'
  AND score = -999999;
-- --- END op 10595

-- --- BEGIN op 10596 ( update quality_profile "1080p Remux" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '1080p Remux'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'sonarr'
  AND score = -999999;
-- --- END op 10596

-- --- BEGIN op 10597 ( update quality_profile "2160p Balanced" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '2160p Balanced'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'radarr'
  AND score = -999999;
-- --- END op 10597

-- --- BEGIN op 10598 ( update quality_profile "2160p Balanced" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '2160p Balanced'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'sonarr'
  AND score = -999999;
-- --- END op 10598

-- --- BEGIN op 10599 ( update quality_profile "2160p Efficient" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '2160p Efficient'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'radarr'
  AND score = -999999;
-- --- END op 10599

-- --- BEGIN op 10600 ( update quality_profile "2160p Efficient" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '2160p Efficient'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'sonarr'
  AND score = -999999;
-- --- END op 10600

-- --- BEGIN op 10601 ( update quality_profile "2160p Quality" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '2160p Quality'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'radarr'
  AND score = -999999;
-- --- END op 10601

-- --- BEGIN op 10602 ( update quality_profile "2160p Quality" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '2160p Quality'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'sonarr'
  AND score = -999999;
-- --- END op 10602

-- --- BEGIN op 10603 ( update quality_profile "2160p Remux" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '2160p Remux'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'radarr'
  AND score = -999999;
-- --- END op 10603

-- --- BEGIN op 10604 ( update quality_profile "2160p Remux" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '2160p Remux'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'sonarr'
  AND score = -999999;
-- --- END op 10604

-- --- BEGIN op 10605 ( update quality_profile "720p Quality" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '720p Quality'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'radarr'
  AND score = -999999;
-- --- END op 10605

-- --- BEGIN op 10606 ( update quality_profile "720p Quality" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '720p Quality'
  AND custom_format_name = 'Banned Groups (Release Title)'
  AND arr_type = 'sonarr'
  AND score = -999999;
-- --- END op 10606

-- --- BEGIN op 10607 ( update custom_format "Banned Groups (Release Title)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Release Title)'
	  AND name = 'DepraveD'
	  AND type = 'release_title'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 10607
