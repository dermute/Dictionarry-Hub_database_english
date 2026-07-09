-- @operation: export
-- @entity: batch
-- @name: Add 0BSiDiAN to 1080p Quality Tier 5
-- @exportedAt: 2026-07-08T22:51:38.422Z
-- @opIds: 12321, 12322, 12323, 12324

-- --- BEGIN op 12321 ( create regular_expression "0BSiDiAN" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('0BSiDiAN', '(?<=^|[\s.-])ADE\b', NULL, NULL);

insert into "tags" ("name") values ('Bluray') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('0BSiDiAN', 'Bluray');

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('0BSiDiAN', 'Release Group');
-- --- END op 12321

-- --- BEGIN op 12322 ( update regular_expression "0BSiDiAN" )
update "regular_expressions" set "pattern" = '(?<=^|[\s.-])0BSiDiAN\b' where "name" = '0BSiDiAN' and "pattern" = '(?<=^|[\s.-])ADE\b';
-- --- END op 12322

-- --- BEGIN op 12323 ( update custom_format "1080p Quality Tier 5" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('1080p Quality Tier 5', '0BSiDiAN', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('1080p Quality Tier 5', '0BSiDiAN', '0BSiDiAN');
-- --- END op 12323

-- --- BEGIN op 12324 ( update custom_format "1080p Quality Tier 5 (Efficient)" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('1080p Quality Tier 5 (Efficient)', '0BSiDiAN', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('1080p Quality Tier 5 (Efficient)', '0BSiDiAN', '0BSiDiAN');
-- --- END op 12324
