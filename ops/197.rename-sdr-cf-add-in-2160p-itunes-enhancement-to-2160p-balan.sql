-- @operation: export
-- @entity: batch
-- @name: Rename SDR CF & Add in 2160p iTunes Enhancement to 2160p Balanced for Testing
-- @exportedAt: 2026-07-03T21:38:44.687Z
-- @opIds: 11674, 11675, 11676, 11677, 11678, 11679, 11680, 11681, 11682, 11683

-- --- BEGIN op 11674 ( update custom_format "2160p SDR" )
update "custom_formats" set "name" = '2160p SDR' where "name" = 'SDR';
-- --- END op 11674

-- --- BEGIN op 11675 ( create custom_format "2160p iTunes Enhancement" )
insert into "custom_formats" ("name", "description") values ('2160p iTunes Enhancement', '');
-- --- END op 11675

-- --- BEGIN op 11676 ( update custom_format "2160p iTunes Enhancement" )
update "custom_formats" set "description" = 'Augments the Streaming Service Score for 1080p Releases and below for 2160p Profiles' where "name" = '2160p iTunes Enhancement' and "description" = '';
-- --- END op 11676

-- --- BEGIN op 11677 ( update custom_format "2160p iTunes Enhancement" )
insert into "tags" ("name") values ('Enhancement') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('2160p iTunes Enhancement', 'Enhancement');
-- --- END op 11677

-- --- BEGIN op 11678 ( update custom_format "2160p iTunes Enhancement" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('2160p iTunes Enhancement', 'Not 2160p', 'resolution', 'all', 1, 1);

INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('2160p iTunes Enhancement', 'Not 2160p', '2160p');
-- --- END op 11678

-- --- BEGIN op 11679 ( update custom_format "2160p iTunes Enhancement" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('2160p iTunes Enhancement', 'iT', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('2160p iTunes Enhancement', 'iT', 'iTunes');
-- --- END op 11679

-- --- BEGIN op 11680 ( update custom_format "2160p iTunes Enhancement" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = '2160p iTunes Enhancement'
	  AND name = 'Not 2160p'
	  AND type = 'resolution'
	  AND arr_type = 'all'
	  AND negate = 1
	  AND required = 1;
-- --- END op 11680

-- --- BEGIN op 11681 ( update custom_format "2160p iTunes Enhancement" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('2160p iTunes Enhancement', '2160p', 'resolution', 'all', 0, 1);

INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('2160p iTunes Enhancement', '2160p', '2160p');
-- --- END op 11681

-- --- BEGIN op 11682 ( update custom_format "2160p iTunes Enhancement" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('2160p iTunes Enhancement', 'DV HDR', 'release_title', 'all', 1, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('2160p iTunes Enhancement', 'DV HDR', 'Basic HDR Formats');
-- --- END op 11682

-- --- BEGIN op 11683 ( update quality_profile "2160p Balanced" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '2160p Balanced', '2160p iTunes Enhancement', 'radarr', 0
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '2160p Balanced'
    AND custom_format_name = '2160p iTunes Enhancement'
    AND arr_type = 'radarr'
);
-- --- END op 11683
