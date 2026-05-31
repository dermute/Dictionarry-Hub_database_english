-- @operation: export
-- @entity: batch
-- @name: Ban NIMA4K
-- @exportedAt: 2026-05-30T18:30:40.151Z
-- @opIds: 10846, 10847, 10848, 10849, 10850

-- --- BEGIN op 10846 ( create regular_expression "NIMA4K" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('NIMA4K', '(?<=^|[\s.-])MAMA\b', NULL, NULL);

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('NIMA4K', 'Release Group');

insert into "tags" ("name") values ('Remux') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('NIMA4K', 'Remux');
-- --- END op 10846

-- --- BEGIN op 10847 ( update regular_expression "NIMA4K" )
update "regular_expressions" set "pattern" = '(?<=^|[\s.-])NIMA4K\b' where "name" = 'NIMA4K' and "pattern" = '(?<=^|[\s.-])MAMA\b';
-- --- END op 10847

-- --- BEGIN op 10848 ( update custom_format "Banned Groups" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Groups', 'NIMA4K', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Groups', 'NIMA4K', 'NIMA4K');
-- --- END op 10848

-- --- BEGIN op 10849 ( update custom_format "Banned Groups (Compact)" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Groups (Compact)', 'NIMA4K', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Groups (Compact)', 'NIMA4K', 'NIMA4K');
-- --- END op 10849

-- --- BEGIN op 10850 ( update custom_format "Banned Groups (Efficient)" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Groups (Efficient)', 'NIMA4K', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Groups (Efficient)', 'NIMA4K', 'NIMA4K');
-- --- END op 10850
