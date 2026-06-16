-- @operation: export
-- @entity: batch
-- @name: Add HDR/+ Negations to Dolby Vision (Without Fallback)
-- @exportedAt: 2026-06-15T20:27:13.107Z
-- @opIds: 11170, 11171

-- --- BEGIN op 11170 ( update custom_format "Dolby Vision (Without Fallback)" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Dolby Vision (Without Fallback)', 'HDR', 'release_title', 'all', 1, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Dolby Vision (Without Fallback)', 'HDR', 'HDR');
-- --- END op 11170

-- --- BEGIN op 11171 ( update custom_format "Dolby Vision (Without Fallback)" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Dolby Vision (Without Fallback)', 'HDR10+', 'release_title', 'all', 1, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Dolby Vision (Without Fallback)', 'HDR10+', 'HDR10+');
-- --- END op 11171
