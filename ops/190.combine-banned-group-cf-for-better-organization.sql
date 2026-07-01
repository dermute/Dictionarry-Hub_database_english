-- @operation: export
-- @entity: batch
-- @name: Combine Banned Group CF for Better Organization
-- @exportedAt: 2026-06-30T19:24:41.658Z
-- @opIds: 11468, 11469, 11470, 11471, 11472, 11473, 11474, 11475, 11476, 11477, 11478, 11479, 11480, 11481, 11482, 11483, 11484, 11485, 11486, 11487, 11488, 11489, 11490, 11491, 11492, 11493, 11494, 11495, 11496, 11497, 11498, 11499, 11500, 11501, 11502, 11503, 11504, 11505, 11506, 11507, 11508, 11509, 11510, 11511, 11512, 11513, 11514, 11515, 11516, 11517, 11518, 11519, 11520, 11521, 11522, 11523, 11524, 11525, 11526, 11527, 11528, 11529, 11530, 11531, 11532, 11533, 11534, 11535, 11536, 11537, 11538, 11539, 11540, 11541, 11542, 11543, 11544, 11545, 11546, 11547, 11548, 11549, 11550, 11551, 11552, 11553, 11554, 11555, 11556, 11557, 11558, 11559, 11560, 11561, 11562, 11563, 11564, 11565, 11566, 11567, 11568, 11569, 11570, 11571, 11572, 11573, 11574, 11575, 11576, 11577, 11578, 11579, 11580, 11581, 11582, 11583, 11584, 11585

-- --- BEGIN op 11468 ( update custom_format "Banned Groups" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups'
	  AND name = 'iVy'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11468

-- --- BEGIN op 11469 ( update custom_format "Banned Groups" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups'
	  AND name = 'MeGusta'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11469

-- --- BEGIN op 11470 ( update custom_format "Banned Groups" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups'
	  AND name = 'PSA'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11470

-- --- BEGIN op 11471 ( update quality_profile "1080p Compact" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Compact', 'Banned Groups', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Compact'
    AND custom_format_name = 'Banned Groups'
    AND arr_type = 'radarr'
);
-- --- END op 11471

-- --- BEGIN op 11472 ( update quality_profile "1080p Compact" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Compact', 'Banned Groups', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Compact'
    AND custom_format_name = 'Banned Groups'
    AND arr_type = 'sonarr'
);
-- --- END op 11472

-- --- BEGIN op 11473 ( update quality_profile "1080p Compact" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '1080p Compact'
  AND custom_format_name = 'Banned Groups (Compact)'
  AND arr_type = 'radarr'
  AND score = -999999;
-- --- END op 11473

-- --- BEGIN op 11474 ( update quality_profile "1080p Compact" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '1080p Compact'
  AND custom_format_name = 'Banned Groups (Compact)'
  AND arr_type = 'sonarr'
  AND score = -999999;
-- --- END op 11474

-- --- BEGIN op 11475 ( update quality_profile "1080p Efficient" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Efficient', 'Banned Groups (Efficient)', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Efficient'
    AND custom_format_name = 'Banned Groups (Efficient)'
    AND arr_type = 'radarr'
);
-- --- END op 11475

-- --- BEGIN op 11476 ( update quality_profile "1080p Efficient" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Efficient', 'Banned Groups (Efficient)', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Efficient'
    AND custom_format_name = 'Banned Groups (Efficient)'
    AND arr_type = 'sonarr'
);
-- --- END op 11476

-- --- BEGIN op 11477 ( update quality_profile "1080p Efficient" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '1080p Efficient'
  AND custom_format_name = 'Banned Groups (Efficient)'
  AND arr_type = 'all'
  AND score = -999999;
-- --- END op 11477

-- --- BEGIN op 11478 ( update quality_profile "1080p Efficient" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Efficient', 'Banned Groups', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Efficient'
    AND custom_format_name = 'Banned Groups'
    AND arr_type = 'radarr'
);
-- --- END op 11478

-- --- BEGIN op 11479 ( update quality_profile "1080p Efficient" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p Efficient', 'Banned Groups', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p Efficient'
    AND custom_format_name = 'Banned Groups'
    AND arr_type = 'sonarr'
);
-- --- END op 11479

-- --- BEGIN op 11480 ( update quality_profile "1080p Efficient" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '1080p Efficient'
  AND custom_format_name = 'Banned Groups (Efficient)'
  AND arr_type = 'radarr'
  AND score = -999999;
-- --- END op 11480

-- --- BEGIN op 11481 ( update quality_profile "1080p Efficient" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '1080p Efficient'
  AND custom_format_name = 'Banned Groups (Efficient)'
  AND arr_type = 'sonarr'
  AND score = -999999;
-- --- END op 11481

-- --- BEGIN op 11482 ( update quality_profile "2160p Efficient" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Efficient', 'Banned Groups (Efficient)', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Efficient'
    AND custom_format_name = 'Banned Groups (Efficient)'
    AND arr_type = 'radarr'
);
-- --- END op 11482

-- --- BEGIN op 11483 ( update quality_profile "2160p Efficient" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Efficient', 'Banned Groups (Efficient)', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Efficient'
    AND custom_format_name = 'Banned Groups (Efficient)'
    AND arr_type = 'sonarr'
);
-- --- END op 11483

-- --- BEGIN op 11484 ( update quality_profile "2160p Efficient" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '2160p Efficient'
  AND custom_format_name = 'Banned Groups (Efficient)'
  AND arr_type = 'all'
  AND score = -999999;
-- --- END op 11484

-- --- BEGIN op 11485 ( update quality_profile "2160p Efficient" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Efficient', 'Banned Groups', 'radarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Efficient'
    AND custom_format_name = 'Banned Groups'
    AND arr_type = 'radarr'
);
-- --- END op 11485

-- --- BEGIN op 11486 ( update quality_profile "2160p Efficient" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Efficient', 'Banned Groups', 'sonarr', -999999
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Efficient'
    AND custom_format_name = 'Banned Groups'
    AND arr_type = 'sonarr'
);
-- --- END op 11486

-- --- BEGIN op 11487 ( update quality_profile "2160p Efficient" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '2160p Efficient'
  AND custom_format_name = 'Banned Groups (Efficient)'
  AND arr_type = 'radarr'
  AND score = -999999;
-- --- END op 11487

-- --- BEGIN op 11488 ( update quality_profile "2160p Efficient" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '2160p Efficient'
  AND custom_format_name = 'Banned Groups (Efficient)'
  AND arr_type = 'sonarr'
  AND score = -999999;
-- --- END op 11488

-- --- BEGIN op 11489 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = '4K4U'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11489

-- --- BEGIN op 11490 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'AOC'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11490

-- --- BEGIN op 11491 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'AROMA'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11491

-- --- BEGIN op 11492 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'BLASPHEMY'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11492

-- --- BEGIN op 11493 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'BOLS'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11493

-- --- BEGIN op 11494 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'BTM'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11494

-- --- BEGIN op 11495 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'BeyondHD'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11495

-- --- BEGIN op 11496 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'BiTOR'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11496

-- --- BEGIN op 11497 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'CLASSiCALHD'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11497

-- --- BEGIN op 11498 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'CREATiVE24'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11498

-- --- BEGIN op 11499 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'Casius08'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11499

-- --- BEGIN op 11500 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'DRX'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11500

-- --- BEGIN op 11501 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'DeViSiVE'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11501

-- --- BEGIN op 11502 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'DepraveD'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11502

-- --- BEGIN op 11503 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'E'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11503

-- --- BEGIN op 11504 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'FGT'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11504

-- --- BEGIN op 11505 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'Flights'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11505

-- --- BEGIN op 11506 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'HDS'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11506

-- --- BEGIN op 11507 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'KC'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11507

-- --- BEGIN op 11508 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'LAMA'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11508

-- --- BEGIN op 11509 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'MAMA'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11509

-- --- BEGIN op 11510 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'MgB'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11510

-- --- BEGIN op 11511 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'NAHOM'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11511

-- --- BEGIN op 11512 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'NhaNc3'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11512

-- --- BEGIN op 11513 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'OEPlus'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11513

-- --- BEGIN op 11514 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'OFT'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11514

-- --- BEGIN op 11515 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'SHD'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11515

-- --- BEGIN op 11516 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'SM737'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11516

-- --- BEGIN op 11517 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'STUTTERSHIT'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11517

-- --- BEGIN op 11518 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'SasukeducK'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11518

-- --- BEGIN op 11519 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'ShieldBearer'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11519

-- --- BEGIN op 11520 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'SumVision'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11520

-- --- BEGIN op 11521 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'TEKNO3D'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11521

-- --- BEGIN op 11522 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'Telly'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11522

-- --- BEGIN op 11523 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'UnKn0wn'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11523

-- --- BEGIN op 11524 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'VD0N'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11524

-- --- BEGIN op 11525 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'VECTOR'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11525

-- --- BEGIN op 11526 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'VisionXpert'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11526

-- --- BEGIN op 11527 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'YIFY'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11527

-- --- BEGIN op 11528 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'YTS'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11528

-- --- BEGIN op 11529 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'd3g'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11529

-- --- BEGIN op 11530 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'jennaortegaUHD'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11530

-- --- BEGIN op 11531 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'jff'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11531

-- --- BEGIN op 11532 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'nikt0'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11532

-- --- BEGIN op 11533 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'rbb'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11533

-- --- BEGIN op 11534 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'tarunk9c'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11534

-- --- BEGIN op 11535 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Compact)'
	  AND name = 'x0r'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11535

-- --- BEGIN op 11536 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = '4K4U'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11536

-- --- BEGIN op 11537 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'AOC'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11537

-- --- BEGIN op 11538 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'AROMA'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11538

-- --- BEGIN op 11539 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'BLASPHEMY'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11539

-- --- BEGIN op 11540 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'BOLS'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11540

-- --- BEGIN op 11541 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'BTM'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11541

-- --- BEGIN op 11542 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'BeyondHD'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11542

-- --- BEGIN op 11543 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'BiTOR'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11543

-- --- BEGIN op 11544 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'CLASSiCALHD'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11544

-- --- BEGIN op 11545 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'CREATiVE24'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11545

-- --- BEGIN op 11546 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'Casius08'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11546

-- --- BEGIN op 11547 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'DRX'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11547

-- --- BEGIN op 11548 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'DeViSiVE'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11548

-- --- BEGIN op 11549 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'DepraveD'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11549

-- --- BEGIN op 11550 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'E'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11550

-- --- BEGIN op 11551 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'FGT'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11551

-- --- BEGIN op 11552 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'Flights'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11552

-- --- BEGIN op 11553 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'HDS'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11553

-- --- BEGIN op 11554 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'KC'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11554

-- --- BEGIN op 11555 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'LAMA'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11555

-- --- BEGIN op 11556 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'MAMA'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11556

-- --- BEGIN op 11557 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'MeGusta'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11557

-- --- BEGIN op 11558 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'MgB'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11558

-- --- BEGIN op 11559 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'NAHOM'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11559

-- --- BEGIN op 11560 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'NhaNc3'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11560

-- --- BEGIN op 11561 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'OEPlus'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11561

-- --- BEGIN op 11562 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'OFT'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11562

-- --- BEGIN op 11563 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'PSA'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11563

-- --- BEGIN op 11564 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'RARBG'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11564

-- --- BEGIN op 11565 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'SHD'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11565

-- --- BEGIN op 11566 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'SM737'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11566

-- --- BEGIN op 11567 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'STUTTERSHIT'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11567

-- --- BEGIN op 11568 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'SasukeducK'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11568

-- --- BEGIN op 11569 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'ShieldBearer'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11569

-- --- BEGIN op 11570 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'SumVision'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11570

-- --- BEGIN op 11571 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'TEKNO3D'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11571

-- --- BEGIN op 11572 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'Telly'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11572

-- --- BEGIN op 11573 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'UnKn0wn'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11573

-- --- BEGIN op 11574 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'VD0N'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11574

-- --- BEGIN op 11575 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'VECTOR'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11575

-- --- BEGIN op 11576 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'VisionXpert'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11576

-- --- BEGIN op 11577 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'YIFY'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11577

-- --- BEGIN op 11578 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'YTS'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11578

-- --- BEGIN op 11579 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'd3g'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11579

-- --- BEGIN op 11580 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'jennaortegaUHD'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11580

-- --- BEGIN op 11581 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'jff'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11581

-- --- BEGIN op 11582 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'nikt0'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11582

-- --- BEGIN op 11583 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'rbb'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11583

-- --- BEGIN op 11584 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'tarunk9c'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11584

-- --- BEGIN op 11585 ( update custom_format "Banned Groups (Efficient)" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Banned Groups (Efficient)'
	  AND name = 'x0r'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 11585
