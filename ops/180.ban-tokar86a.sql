-- @operation: export
-- @entity: batch
-- @name: Ban tokar86a
-- @exportedAt: 2026-06-13T01:38:56.721Z
-- @opIds: 10932, 10933, 10934

-- --- BEGIN op 10932 ( create regular_expression "tokar86a" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('tokar86a', '(?<=^|[\s.-])AJP69\b', NULL, NULL);

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('tokar86a', 'Release Group');

insert into "tags" ("name") values ('WEB-DL') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('tokar86a', 'WEB-DL');
-- --- END op 10932

-- --- BEGIN op 10933 ( update regular_expression "tokar86a" )
update "regular_expressions" set "pattern" = '(?<=^|[\s.-])tokar86a\b' where "name" = 'tokar86a' and "pattern" = '(?<=^|[\s.-])AJP69\b';
-- --- END op 10933

-- --- BEGIN op 10934 ( update custom_format "Banned Language Groups" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Language Groups', 'tokar86a', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Language Groups', 'tokar86a', 'tokar86a');
-- --- END op 10934
