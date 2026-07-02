-- @operation: export
-- @entity: batch
-- @name: Tweak 2160p MA Score
-- @exportedAt: 2026-07-01T18:47:46.133Z
-- @opIds: 11624, 11625, 11626, 11627, 11628, 11629, 11630, 11631, 11632, 11633

-- --- BEGIN op 11624 ( update quality_profile "2160p Balanced" )
UPDATE quality_profile_custom_formats
SET score = 6000
WHERE quality_profile_name = '2160p Balanced'
  AND custom_format_name = 'MA'
  AND arr_type = 'radarr'
  AND score = 5000;
-- --- END op 11624

-- --- BEGIN op 11625 ( update quality_profile "2160p Balanced" )
UPDATE quality_profile_custom_formats
SET score = -3000
WHERE quality_profile_name = '2160p Balanced'
  AND custom_format_name = 'Movies Anywhere Enhancement'
  AND arr_type = 'radarr'
  AND score = -2000;
-- --- END op 11625

-- --- BEGIN op 11626 ( update quality_profile "2160p Efficient" )
UPDATE quality_profile_custom_formats
SET score = 6000
WHERE quality_profile_name = '2160p Efficient'
  AND custom_format_name = 'MA'
  AND arr_type = 'radarr'
  AND score = 5000;
-- --- END op 11626

-- --- BEGIN op 11627 ( update quality_profile "2160p Efficient" )
UPDATE quality_profile_custom_formats
SET score = -3000
WHERE quality_profile_name = '2160p Efficient'
  AND custom_format_name = 'Movies Anywhere Enhancement'
  AND arr_type = 'radarr'
  AND score = -2000;
-- --- END op 11627

-- --- BEGIN op 11628 ( update quality_profile "2160p Quality" )
UPDATE quality_profile_custom_formats
SET score = 7000
WHERE quality_profile_name = '2160p Quality'
  AND custom_format_name = 'BCORE'
  AND arr_type = 'radarr'
  AND score = 6000;
-- --- END op 11628

-- --- BEGIN op 11629 ( update quality_profile "2160p Quality" )
UPDATE quality_profile_custom_formats
SET score = 6000
WHERE quality_profile_name = '2160p Quality'
  AND custom_format_name = 'MA'
  AND arr_type = 'radarr'
  AND score = 5000;
-- --- END op 11629

-- --- BEGIN op 11630 ( update quality_profile "2160p Quality" )
UPDATE quality_profile_custom_formats
SET score = -3000
WHERE quality_profile_name = '2160p Quality'
  AND custom_format_name = 'Movies Anywhere Enhancement'
  AND arr_type = 'radarr'
  AND score = -2000;
-- --- END op 11630

-- --- BEGIN op 11631 ( update quality_profile "2160p Remux" )
UPDATE quality_profile_custom_formats
SET score = 7000
WHERE quality_profile_name = '2160p Remux'
  AND custom_format_name = 'BCORE'
  AND arr_type = 'radarr'
  AND score = 6000;
-- --- END op 11631

-- --- BEGIN op 11632 ( update quality_profile "2160p Remux" )
UPDATE quality_profile_custom_formats
SET score = 6000
WHERE quality_profile_name = '2160p Remux'
  AND custom_format_name = 'MA'
  AND arr_type = 'radarr'
  AND score = 5000;
-- --- END op 11632

-- --- BEGIN op 11633 ( update quality_profile "2160p Remux" )
UPDATE quality_profile_custom_formats
SET score = -3000
WHERE quality_profile_name = '2160p Remux'
  AND custom_format_name = 'Movies Anywhere Enhancement'
  AND arr_type = 'radarr'
  AND score = -2000;
-- --- END op 11633
