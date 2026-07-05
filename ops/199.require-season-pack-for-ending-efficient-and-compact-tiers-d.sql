-- @operation: export
-- @entity: batch
-- @name: Require Season Pack for Ending Efficient and Compact Tiers due to inconsistent Uploads
-- @exportedAt: 2026-07-04T17:42:31.698Z
-- @opIds: 11753, 11754, 11755

-- --- BEGIN op 11753 ( update custom_format "1080p Compact TV Trash Tier 1" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('1080p Compact TV Trash Tier 1', 'Season Pack', 'release_type', 'sonarr', 0, 1);

INSERT INTO condition_release_types (custom_format_name, condition_name, release_type) VALUES ('1080p Compact TV Trash Tier 1', 'Season Pack', 'season_pack');
-- --- END op 11753

-- --- BEGIN op 11754 ( update custom_format "1080p Compact TV Trash Tier 2" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('1080p Compact TV Trash Tier 2', 'Season Pack', 'release_type', 'sonarr', 0, 1);

INSERT INTO condition_release_types (custom_format_name, condition_name, release_type) VALUES ('1080p Compact TV Trash Tier 2', 'Season Pack', 'season_pack');
-- --- END op 11754

-- --- BEGIN op 11755 ( update custom_format "1080p Efficient TV WEB Tier 5" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('1080p Efficient TV WEB Tier 5', 'Season Pack', 'release_type', 'sonarr', 0, 1);

INSERT INTO condition_release_types (custom_format_name, condition_name, release_type) VALUES ('1080p Efficient TV WEB Tier 5', 'Season Pack', 'season_pack');
-- --- END op 11755
