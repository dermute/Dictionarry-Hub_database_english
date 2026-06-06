-- @operation: export
-- @entity: batch
-- @name: Add faBR to 2160p Quality Tier 4
-- @exportedAt: 2026-06-06T00:15:50.940Z
-- @opIds: 10922

-- --- BEGIN op 10922 ( update custom_format "2160p Quality Tier 4" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('2160p Quality Tier 4', 'faBR', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('2160p Quality Tier 4', 'faBR', 'faBR');
-- --- END op 10922
