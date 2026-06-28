-- @operation: export
-- @entity: batch
-- @name: Add BAT1 to 720p Quality Tier 5
-- @exportedAt: 2026-06-27T23:37:38.842Z
-- @opIds: 11423

-- --- BEGIN op 11423 ( update custom_format "720p Quality Tier 5" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('720p Quality Tier 5', 'BAT1', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('720p Quality Tier 5', 'BAT1', 'BAT1');
-- --- END op 11423
