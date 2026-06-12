-- @operation: export
-- @entity: batch
-- @name: Add Softboat to 2160p Quality Tier 4
-- @exportedAt: 2026-06-12T01:08:34.475Z
-- @opIds: 10924

-- --- BEGIN op 10924 ( update custom_format "2160p Quality Tier 4" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('2160p Quality Tier 4', 'Softboat', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('2160p Quality Tier 4', 'Softboat', 'Softboat');
-- --- END op 10924
