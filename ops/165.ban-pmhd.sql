-- @operation: export
-- @entity: batch
-- @name: Ban pmHD
-- @exportedAt: 2026-05-29T19:23:25.149Z
-- @opIds: 10834, 10835, 10836, 10837, 10838

-- --- BEGIN op 10834 ( create regular_expression "pmHD" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('pmHD', '(?<=^|[\s.-])3L\b', NULL, NULL);

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('pmHD', 'Release Group');

insert into "tags" ("name") values ('Remux') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('pmHD', 'Remux');
-- --- END op 10834

-- --- BEGIN op 10835 ( update regular_expression "pmHD" )
update "regular_expressions" set "pattern" = '(?<=^|[\s.-])pmHD\b' where "name" = 'pmHD' and "pattern" = '(?<=^|[\s.-])3L\b';
-- --- END op 10835

-- --- BEGIN op 10836 ( update custom_format "Banned Groups" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Groups', 'pmHD', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Groups', 'pmHD', 'pmHD');
-- --- END op 10836

-- --- BEGIN op 10837 ( update custom_format "Banned Groups (Compact)" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Groups (Compact)', 'pmHD', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Groups (Compact)', 'pmHD', 'pmHD');
-- --- END op 10837

-- --- BEGIN op 10838 ( update custom_format "Banned Groups (Efficient)" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Groups (Efficient)', 'pmHD', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Groups (Efficient)', 'pmHD', 'pmHD');
-- --- END op 10838
