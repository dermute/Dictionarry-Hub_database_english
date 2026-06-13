-- @operation: export
-- @entity: batch
-- @name: Add BTN to 1080p Quality Tier 6
-- @exportedAt: 2026-06-13T01:32:10.575Z
-- @opIds: 10926, 10927, 10928

-- --- BEGIN op 10926 ( update custom_format "1080p Quality Tier 6" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('1080p Quality Tier 6', 'BTN', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('1080p Quality Tier 6', 'BTN', 'BTN');
-- --- END op 10926

-- --- BEGIN op 10927 ( update custom_format "1080p Quality Tier 6 (Efficient)" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('1080p Quality Tier 6 (Efficient)', 'BTN', 'release_title', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('1080p Quality Tier 6 (Efficient)', 'BTN', 'BTN');
-- --- END op 10927

-- --- BEGIN op 10928 ( update custom_format "1080p Quality Tier 6 (Efficient)" )
UPDATE custom_format_conditions
SET type = 'release_group'
WHERE custom_format_name = '1080p Quality Tier 6 (Efficient)'
  AND name = 'BTN'
  AND type = 'release_title'
  AND arr_type = 'all'
  AND negate = 0
  AND required = 0;

DELETE FROM condition_patterns WHERE custom_format_name = '1080p Quality Tier 6 (Efficient)' AND condition_name = 'BTN' AND regular_expression_name = 'BTN';

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('1080p Quality Tier 6 (Efficient)', 'BTN', 'BTN');
-- --- END op 10928
