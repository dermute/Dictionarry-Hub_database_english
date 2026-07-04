-- @operation: export
-- @entity: batch
-- @name: Ban NiCEHEVC
-- @exportedAt: 2026-07-03T21:51:50.326Z
-- @opIds: 11685, 11686, 11687

-- --- BEGIN op 11685 ( create regular_expression "NiCEHEVC" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('NiCEHEVC', '(?<=^|[\s.-])SM737\b', 'Banned for Fake DV/HDR Layer', NULL);

insert into "tags" ("name") values ('Banned') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('NiCEHEVC', 'Banned');

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('NiCEHEVC', 'Release Group');
-- --- END op 11685

-- --- BEGIN op 11686 ( update regular_expression "NiCEHEVC" )
update "regular_expressions" set "pattern" = '(?<=^|[\s.-])NiCEHEVC\b' where "name" = 'NiCEHEVC' and "pattern" = '(?<=^|[\s.-])SM737\b';
-- --- END op 11686

-- --- BEGIN op 11687 ( update custom_format "Banned Groups" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Banned Groups', 'NiCEHEVC', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Banned Groups', 'NiCEHEVC', 'NiCEHEVC');
-- --- END op 11687
