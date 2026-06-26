-- @operation: export
-- @entity: batch
-- @name: BAN jff and rbb
-- @exportedAt: 2026-06-25T19:04:20.721Z
-- @opIds: 11336, 11337, 11338, 11339, 11340, 11341, 11342, 11343, 11344, 11345, 11346, 11347

-- --- BEGIN op 11336 ( create regular_expression "JFF" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('JFF', '(?<=^|[\s.-])AJP69\b', NULL, NULL);

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('JFF', 'Release Group');

insert into "tags" ("name") values ('WEB-DL') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('JFF', 'WEB-DL');
-- --- END op 11336

-- --- BEGIN op 11337 ( update regular_expression "JFF" )
update "regular_expressions" set "pattern" = '(?<=^|[\s.-])rbb\b' where "name" = 'JFF' and "pattern" = '(?<=^|[\s.-])AJP69\b';
-- --- END op 11337

-- --- BEGIN op 11338 ( update regular_expression "rbb" )
update "regular_expressions" set "name" = 'rbb' where "name" = 'JFF';
-- --- END op 11338

-- --- BEGIN op 11339 ( create regular_expression "jff" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('jff', '(?<=^|[\s.-])rbb\b', NULL, NULL);

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('jff', 'Release Group');

insert into "tags" ("name") values ('WEB-DL') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('jff', 'WEB-DL');
-- --- END op 11339

-- --- BEGIN op 11340 ( update regular_expression "jff" )
update "regular_expressions" set "pattern" = '(?<=^|[\s.-])jff\b' where "name" = 'jff' and "pattern" = '(?<=^|[\s.-])rbb\b';
-- --- END op 11340

-- --- BEGIN op 11341 ( update custom_format "Banned Groups" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Groups', 'jff', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Groups', 'jff', 'jff');
-- --- END op 11341

-- --- BEGIN op 11342 ( update custom_format "Banned Groups" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Groups', 'rbb', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Groups', 'rbb', 'rbb');
-- --- END op 11342

-- --- BEGIN op 11343 ( update custom_format "Banned Groups (Compact)" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Groups (Compact)', 'jff', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Groups (Compact)', 'jff', 'jff');
-- --- END op 11343

-- --- BEGIN op 11344 ( update custom_format "Banned Groups (Compact)" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Groups (Compact)', 'rbb', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Groups (Compact)', 'rbb', 'jff');
-- --- END op 11344

-- --- BEGIN op 11345 ( update custom_format "Banned Groups (Efficient)" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Groups (Efficient)', 'jff', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Groups (Efficient)', 'jff', 'jff');
-- --- END op 11345

-- --- BEGIN op 11346 ( update custom_format "Banned Groups (Efficient)" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Groups (Efficient)', 'rbb', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Groups (Efficient)', 'rbb', 'rbb');
-- --- END op 11346

-- --- BEGIN op 11347 ( update custom_format "Banned Groups (Compact)" )
DELETE FROM condition_patterns WHERE custom_format_name = 'Banned Groups (Compact)' AND condition_name = 'rbb' AND regular_expression_name = 'jff';

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Groups (Compact)', 'rbb', 'rbb');
-- --- END op 11347
