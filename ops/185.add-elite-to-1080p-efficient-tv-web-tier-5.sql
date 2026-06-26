-- @operation: export
-- @entity: batch
-- @name: Add ELiTE to 1080p Efficient TV WEB Tier 5
-- @exportedAt: 2026-06-25T19:41:00.400Z
-- @opIds: 11349, 11350

-- --- BEGIN op 11349 ( update custom_format "1080p Efficient TV WEB Tier 5" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('1080p Efficient TV WEB Tier 5', 'HDTV', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('1080p Efficient TV WEB Tier 5', 'HDTV', 'television');
-- --- END op 11349

-- --- BEGIN op 11350 ( update custom_format "1080p Efficient TV WEB Tier 5" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('1080p Efficient TV WEB Tier 5', 'ELiTE', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('1080p Efficient TV WEB Tier 5', 'ELiTE', 'ELiTE');
-- --- END op 11350
