-- @operation: export
-- @entity: batch
-- @name: Ban NaNi
-- @exportedAt: 2026-07-02T18:08:46.001Z
-- @opIds: 11651, 11652, 11653, 11654

-- --- BEGIN op 11651 ( create regular_expression "NaNi" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('NaNi', '(?<=^|[\s.-])3L\b', NULL, NULL);

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('NaNi', 'Release Group');

insert into "tags" ("name") values ('Remux') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('NaNi', 'Remux');
-- --- END op 11651

-- --- BEGIN op 11652 ( update regular_expression "NaNi" )
update "regular_expressions" set "pattern" = '(?<=^|[\s.-])NaNi\b' where "name" = 'NaNi' and "pattern" = '(?<=^|[\s.-])3L\b';
-- --- END op 11652

-- --- BEGIN op 11653 ( update regular_expression "NaNi" )
update "regular_expressions" set "description" = 'Banned for DCP Remux. Compatibility Issues' where "name" = 'NaNi' and "description" is null;
-- --- END op 11653

-- --- BEGIN op 11654 ( update custom_format "Banned Groups" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Groups', 'NaNi', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Groups', 'NaNi', 'NaNi');
-- --- END op 11654
