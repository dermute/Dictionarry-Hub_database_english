-- @operation: export
-- @entity: batch
-- @name: Ban KiNGSMAN
-- @exportedAt: 2026-06-14T14:51:18.288Z
-- @opIds: 10936, 10937, 10938

-- --- BEGIN op 10936 ( create regular_expression "KiNGSMAN" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('KiNGSMAN', '(?<=^|[\s.-])3L\b', NULL, NULL);

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('KiNGSMAN', 'Release Group');

insert into "tags" ("name") values ('Remux') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('KiNGSMAN', 'Remux');
-- --- END op 10936

-- --- BEGIN op 10937 ( update regular_expression "KiNGSMAN" )
update "regular_expressions" set "pattern" = '(?<=^|[\s.-])KiNGSMAN\b' where "name" = 'KiNGSMAN' and "pattern" = '(?<=^|[\s.-])3L\b';
-- --- END op 10937

-- --- BEGIN op 10938 ( update custom_format "Banned Language Groups" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Language Groups', 'KiNGSMAN', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Language Groups', 'KiNGSMAN', 'KiNGSMAN');
-- --- END op 10938
