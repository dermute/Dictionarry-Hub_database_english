-- @operation: export
-- @entity: batch
-- @name: Add faBR to Secondary CF
-- @exportedAt: 2026-06-13T01:34:20.559Z
-- @opIds: 10930

-- --- BEGIN op 10930 ( update custom_format "1080p Quality Tier 5 (Efficient)" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('1080p Quality Tier 5 (Efficient)', 'faBR', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('1080p Quality Tier 5 (Efficient)', 'faBR', 'faBR');
-- --- END op 10930
