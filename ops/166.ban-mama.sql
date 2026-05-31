-- @operation: export
-- @entity: batch
-- @name: Ban MAMA
-- @exportedAt: 2026-05-30T18:15:42.182Z
-- @opIds: 10840, 10841, 10842, 10843, 10844

-- --- BEGIN op 10840 ( create regular_expression "MAMA" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('MAMA', '(?<=^|[\s.-])pmHD\b', NULL, NULL);

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('MAMA', 'Release Group');

insert into "tags" ("name") values ('Remux') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('MAMA', 'Remux');
-- --- END op 10840

-- --- BEGIN op 10841 ( update regular_expression "MAMA" )
update "regular_expressions" set "pattern" = '(?<=^|[\s.-])MAMA\b' where "name" = 'MAMA' and "pattern" = '(?<=^|[\s.-])pmHD\b';
-- --- END op 10841

-- --- BEGIN op 10842 ( update custom_format "Banned Groups" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Groups', 'MAMA', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Groups', 'MAMA', 'MAMA');
-- --- END op 10842

-- --- BEGIN op 10843 ( update custom_format "Banned Groups (Compact)" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Groups (Compact)', 'MAMA', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Groups (Compact)', 'MAMA', 'MAMA');
-- --- END op 10843

-- --- BEGIN op 10844 ( update custom_format "Banned Groups (Efficient)" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Groups (Efficient)', 'MAMA', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Groups (Efficient)', 'MAMA', 'MAMA');
-- --- END op 10844
