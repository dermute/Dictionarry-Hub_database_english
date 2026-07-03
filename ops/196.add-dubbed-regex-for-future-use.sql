-- @operation: export
-- @entity: batch
-- @name: Add Dubbed Regex for Future Use
-- @exportedAt: 2026-07-03T00:56:01.352Z
-- @opIds: 11656, 11657, 11658, 11659, 11660, 11661, 11662, 11663, 11664, 11665, 11666, 11667, 11668, 11669, 11670, 11671, 11672

-- --- BEGIN op 11656 ( create regular_expression "Movie DUBBED" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Movie DUBBED', '(?i)(?<=\b[12]\d{3}\b).*(\b|\.)\b(Extras?|Bonus|Extended[ ._-]Clip|Special Feature[s]?)\b', 'Extras, Special Features, Featurettes, etc', NULL);

insert into "tags" ("name") values ('Banned') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Movie DUBBED', 'Banned');
-- --- END op 11656

-- --- BEGIN op 11657 ( create regular_expression "TV DUBBED" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('TV DUBBED', '(?<=\bS\d+\b).*\b(Extras|Bonus|Extended[ ._-]Clip)\b', 'Extras, Special Features, Featurettes, etc', NULL);

insert into "tags" ("name") values ('Banned') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('TV DUBBED', 'Banned');
-- --- END op 11657

-- --- BEGIN op 11658 ( update regular_expression "Movie DUBBED" )
update "regular_expressions" set "pattern" = '(?i)(?<=\b[12]\d{3}\b).*(\b|\.)\bDUB(BED)?\b' where "name" = 'Movie DUBBED' and "pattern" = '(?i)(?<=\b[12]\d{3}\b).*(\b|\.)\b(Extras?|Bonus|Extended[ ._-]Clip|Special Feature[s]?)\b';
-- --- END op 11658

-- --- BEGIN op 11659 ( update regular_expression "TV DUBBED" )
update "regular_expressions" set "pattern" = '(?<=\bS\d+\b).*\bDUB(BED)?\b' where "name" = 'TV DUBBED' and "pattern" = '(?<=\bS\d+\b).*\b(Extras|Bonus|Extended[ ._-]Clip)\b';
-- --- END op 11659

-- --- BEGIN op 11660 ( update regular_expression "Movie DUBBED" )
update "regular_expressions" set "pattern" = '(?<=\b[12]\d{3}\b).*(\b|\.)\bDUB(BED)?\b' where "name" = 'Movie DUBBED' and "pattern" = '(?i)(?<=\b[12]\d{3}\b).*(\b|\.)\bDUB(BED)?\b';
-- --- END op 11660

-- --- BEGIN op 11661 ( update regular_expression "Movie Extras" )
update "regular_expressions" set "pattern" = '(?<=\b[12]\d{3}\b).*(\b|\.)\b(Extras?|Bonus|Extended[ ._-]Clip|Special Feature[s]?)\b' where "name" = 'Movie Extras' and "pattern" = '(?i)(?<=\b[12]\d{3}\b).*(\b|\.)\b(Extras?|Bonus|Extended[ ._-]Clip|Special Feature[s]?)\b';
-- --- END op 11661

-- --- BEGIN op 11662 ( update regular_expression "TV DUBBED" )
update "regular_expressions" set "pattern" = '(?<=\bS\d+(E\d+)?\b).*\bDUB(BED)?\b' where "name" = 'TV DUBBED' and "pattern" = '(?<=\bS\d+\b).*\bDUB(BED)?\b';
-- --- END op 11662

-- --- BEGIN op 11663 ( create custom_format "DUBBED" )
insert into "custom_formats" ("name", "description") values ('DUBBED', '');
-- --- END op 11663

-- --- BEGIN op 11664 ( update custom_format "DUBBED" )
update "custom_formats" set "description" = 'Matches the ''Extras'' Regex Pattern' where "name" = 'DUBBED' and "description" = '';
-- --- END op 11664

-- --- BEGIN op 11665 ( update custom_format "DUBBED" )
insert into "tags" ("name") values ('Banned') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('DUBBED', 'Banned');

insert into "tags" ("name") values ('Enhancement') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('DUBBED', 'Enhancement');
-- --- END op 11665

-- --- BEGIN op 11666 ( update custom_format "DUBBED" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('DUBBED', 'Movie Extras', 'release_title', 'radarr', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DUBBED', 'Movie Extras', 'Movie Extras');
-- --- END op 11666

-- --- BEGIN op 11667 ( update custom_format "DUBBED" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('DUBBED', 'TV Extras', 'release_title', 'sonarr', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DUBBED', 'TV Extras', 'TV Extras');
-- --- END op 11667

-- --- BEGIN op 11668 ( update custom_format "DUBBED" )
update "custom_formats" set "description" = 'Matches the ''DUBBED'' Regex Pattern' where "name" = 'DUBBED' and "description" = 'Matches the ''Extras'' Regex Pattern';
-- --- END op 11668

-- --- BEGIN op 11669 ( update custom_format "DUBBED" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'DUBBED'
	  AND name = 'Movie Extras'
	  AND type = 'release_title'
	  AND arr_type = 'radarr'
	  AND negate = 0
	  AND required = 1;
-- --- END op 11669

-- --- BEGIN op 11670 ( update custom_format "DUBBED" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'DUBBED'
	  AND name = 'TV Extras'
	  AND type = 'release_title'
	  AND arr_type = 'sonarr'
	  AND negate = 0
	  AND required = 1;
-- --- END op 11670

-- --- BEGIN op 11671 ( update custom_format "DUBBED" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('DUBBED', 'Movie DUBBED', 'release_title', 'radarr', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DUBBED', 'Movie DUBBED', 'Movie DUBBED');
-- --- END op 11671

-- --- BEGIN op 11672 ( update custom_format "DUBBED" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('DUBBED', 'TV DUBBED', 'release_title', 'sonarr', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DUBBED', 'TV DUBBED', 'TV DUBBED');
-- --- END op 11672
