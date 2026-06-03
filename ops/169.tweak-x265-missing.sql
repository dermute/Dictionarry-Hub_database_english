-- @operation: export
-- @entity: batch
-- @name: Tweak x265 (Missing)
-- @exportedAt: 2026-06-02T18:17:45.080Z
-- @opIds: 10857, 10858

-- --- BEGIN op 10857 ( update custom_format "x265 (Missing)" )
DELETE FROM condition_patterns WHERE custom_format_name = 'x265 (Missing)' AND condition_name = 'Not x264' AND regular_expression_name = 'x264';

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('x265 (Missing)', 'Not x264', 'AVC');
-- --- END op 10857

-- --- BEGIN op 10858 ( update custom_format "x265 (Missing)" )
DELETE FROM condition_patterns WHERE custom_format_name = 'x265 (Missing)' AND condition_name = 'Not x265' AND regular_expression_name = 'x265';

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('x265 (Missing)', 'Not x265', 'HEVC');
-- --- END op 10858
