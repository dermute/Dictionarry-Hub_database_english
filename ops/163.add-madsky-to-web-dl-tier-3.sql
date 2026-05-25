-- @operation: export
-- @entity: batch
-- @name: Add MADSKY to WEB-DL Tier 3
-- @exportedAt: 2026-05-24T19:02:53.110Z
-- @opIds: 10821, 10822, 10823

-- --- BEGIN op 10821 ( create regular_expression "MADSKY" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('MADSKY', '(?<=^|[\s.-])ABM\b', NULL, NULL);

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('MADSKY', 'Release Group');

insert into "tags" ("name") values ('WEB-DL') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('MADSKY', 'WEB-DL');
-- --- END op 10821

-- --- BEGIN op 10822 ( update regular_expression "MADSKY" )
update "regular_expressions" set "pattern" = '(?<=^|[\s.-])MADSKY\b' where "name" = 'MADSKY' and "pattern" = '(?<=^|[\s.-])ABM\b';
-- --- END op 10822

-- --- BEGIN op 10823 ( update custom_format "WEB-DL Tier 3" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('WEB-DL Tier 3', 'MADSKY', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('WEB-DL Tier 3', 'MADSKY', 'MADSKY');
-- --- END op 10823
