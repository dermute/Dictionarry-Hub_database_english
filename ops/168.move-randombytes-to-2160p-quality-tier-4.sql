-- @operation: export
-- @entity: batch
-- @name: Move RandomBytes to 2160p Quality Tier 4
-- @exportedAt: 2026-06-01T23:45:14.158Z
-- @opIds: 10854, 10855

-- --- BEGIN op 10854 ( update custom_format "2160p Quality Tier 5" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = '2160p Quality Tier 5'
	  AND name = 'RandomBytes'
	  AND type = 'release_group'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 0;
-- --- END op 10854

-- --- BEGIN op 10855 ( update custom_format "2160p Quality Tier 4" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('2160p Quality Tier 4', 'RandomBytes', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('2160p Quality Tier 4', 'RandomBytes', 'RandomBytes');
-- --- END op 10855
