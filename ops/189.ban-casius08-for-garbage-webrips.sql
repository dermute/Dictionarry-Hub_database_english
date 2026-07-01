-- @operation: export
-- @entity: batch
-- @name: Ban Casius08 for Garbage WEBRips
-- @exportedAt: 2026-06-30T19:08:43.644Z
-- @opIds: 11461, 11462, 11463, 11464, 11465, 11466

-- --- BEGIN op 11461 ( create regular_expression "Casius08" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Casius08', '(?<=^|[\s.-])126811\b', 'Matches the release group `126811` only if it is:

- Preceded by the start of the string (`^`), a whitespace character (`\s`), a period (`.`), or a hyphen (`-`).
- Followed by a word boundary (`\b`), ensuring it ends cleanly without being part of a longer word.', NULL);

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Casius08', 'Release Group');

insert into "tags" ("name") values ('WEB-DL') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Casius08', 'WEB-DL');
-- --- END op 11461

-- --- BEGIN op 11462 ( update regular_expression "Casius08" )
update "regular_expressions" set "description" = 'Banned for Garbage Releases' where "name" = 'Casius08' and "description" = 'Matches the release group `126811` only if it is:

- Preceded by the start of the string (`^`), a whitespace character (`\s`), a period (`.`), or a hyphen (`-`).
- Followed by a word boundary (`\b`), ensuring it ends cleanly without being part of a longer word.';
-- --- END op 11462

-- --- BEGIN op 11463 ( update regular_expression "Casius08" )
update "regular_expressions" set "pattern" = '(?<=^|[\s.-])Casius08\b' where "name" = 'Casius08' and "pattern" = '(?<=^|[\s.-])126811\b';
-- --- END op 11463

-- --- BEGIN op 11464 ( update custom_format "Banned Groups" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Groups', 'Casius08', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Groups', 'Casius08', 'Casius08');
-- --- END op 11464

-- --- BEGIN op 11465 ( update custom_format "Banned Groups (Compact)" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Groups (Compact)', 'Casius08', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Groups (Compact)', 'Casius08', 'Casius08');
-- --- END op 11465

-- --- BEGIN op 11466 ( update custom_format "Banned Groups (Efficient)" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Groups (Efficient)', 'Casius08', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Groups (Efficient)', 'Casius08', 'Casius08');
-- --- END op 11466
