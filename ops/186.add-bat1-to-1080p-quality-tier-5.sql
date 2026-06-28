-- @operation: export
-- @entity: batch
-- @name: Add BAT1 to 1080p Quality Tier 5
-- @exportedAt: 2026-06-27T23:36:41.300Z
-- @opIds: 11418, 11419, 11420, 11421

-- --- BEGIN op 11418 ( create regular_expression "BAT1" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('BAT1', '(?<=^|[\s.-])4KDVS\b', NULL, NULL);

insert into "tags" ("name") values ('Bluray') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('BAT1', 'Bluray');

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('BAT1', 'Release Group');
-- --- END op 11418

-- --- BEGIN op 11419 ( update regular_expression "BAT1" )
update "regular_expressions" set "pattern" = '(?<=^|[\s.-])BAT1\b' where "name" = 'BAT1' and "pattern" = '(?<=^|[\s.-])4KDVS\b';
-- --- END op 11419

-- --- BEGIN op 11420 ( update custom_format "1080p Quality Tier 5" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('1080p Quality Tier 5', 'BAT1', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('1080p Quality Tier 5', 'BAT1', 'BAT1');
-- --- END op 11420

-- --- BEGIN op 11421 ( update custom_format "1080p Quality Tier 5 (Efficient)" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('1080p Quality Tier 5 (Efficient)', 'BAT1', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('1080p Quality Tier 5 (Efficient)', 'BAT1', 'BAT1');
-- --- END op 11421
