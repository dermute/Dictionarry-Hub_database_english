-- @operation: export
-- @entity: batch
-- @name: Rename and Tweak ASL to Audio Description
-- @exportedAt: 2026-05-21T16:08:29.753Z
-- @opIds: 10609, 10610, 10611, 10612, 10613, 10614, 10615, 10616, 10617, 10618, 10619, 10620, 10621, 10622, 10623, 10624, 10625, 10626, 10627, 10628, 10629, 10630, 10631, 10632, 10633, 10634, 10635, 10636, 10637, 10638

-- --- BEGIN op 10609 ( update custom_format "Audio Description" )
update "custom_formats" set "description" = 'Audio Description / ASL / BASL / BSL' where "name" = 'ASL' and "description" = 'American Sign Language Releases';
-- --- END op 10609

-- --- BEGIN op 10610 ( update custom_format "Audio Description" )
update "custom_formats" set "name" = 'Audio Description' where "name" = 'ASL';
-- --- END op 10610

-- --- BEGIN op 10611 ( update quality_profile "1080p Balanced" )
update "quality_profile_custom_formats" set "custom_format_name" = 'Audio Description' where "quality_profile_name" = '1080p Balanced' and "custom_format_name" = 'ASL' and "arr_type" = 'all' and "score" = -999999;
-- --- END op 10611

-- --- BEGIN op 10612 ( update quality_profile "1080p Compact" )
update "quality_profile_custom_formats" set "custom_format_name" = 'Audio Description' where "quality_profile_name" = '1080p Compact' and "custom_format_name" = 'ASL' and "arr_type" = 'all' and "score" = -999999;
-- --- END op 10612

-- --- BEGIN op 10613 ( update quality_profile "1080p Efficient" )
update "quality_profile_custom_formats" set "custom_format_name" = 'Audio Description' where "quality_profile_name" = '1080p Efficient' and "custom_format_name" = 'ASL' and "arr_type" = 'all' and "score" = -999999;
-- --- END op 10613

-- --- BEGIN op 10614 ( update quality_profile "1080p Quality" )
update "quality_profile_custom_formats" set "custom_format_name" = 'Audio Description' where "quality_profile_name" = '1080p Quality' and "custom_format_name" = 'ASL' and "arr_type" = 'all' and "score" = -999999;
-- --- END op 10614

-- --- BEGIN op 10615 ( update quality_profile "1080p Quality HDR" )
update "quality_profile_custom_formats" set "custom_format_name" = 'Audio Description' where "quality_profile_name" = '1080p Quality HDR' and "custom_format_name" = 'ASL' and "arr_type" = 'all' and "score" = -999999;
-- --- END op 10615

-- --- BEGIN op 10616 ( update quality_profile "1080p Remux" )
update "quality_profile_custom_formats" set "custom_format_name" = 'Audio Description' where "quality_profile_name" = '1080p Remux' and "custom_format_name" = 'ASL' and "arr_type" = 'all' and "score" = -999999;
-- --- END op 10616

-- --- BEGIN op 10617 ( update quality_profile "2160p Balanced" )
update "quality_profile_custom_formats" set "custom_format_name" = 'Audio Description' where "quality_profile_name" = '2160p Balanced' and "custom_format_name" = 'ASL' and "arr_type" = 'all' and "score" = -999999;
-- --- END op 10617

-- --- BEGIN op 10618 ( update quality_profile "2160p Efficient" )
update "quality_profile_custom_formats" set "custom_format_name" = 'Audio Description' where "quality_profile_name" = '2160p Efficient' and "custom_format_name" = 'ASL' and "arr_type" = 'all' and "score" = -999999;
-- --- END op 10618

-- --- BEGIN op 10619 ( update quality_profile "2160p Quality" )
update "quality_profile_custom_formats" set "custom_format_name" = 'Audio Description' where "quality_profile_name" = '2160p Quality' and "custom_format_name" = 'ASL' and "arr_type" = 'all' and "score" = -999999;
-- --- END op 10619

-- --- BEGIN op 10620 ( update quality_profile "2160p Remux" )
update "quality_profile_custom_formats" set "custom_format_name" = 'Audio Description' where "quality_profile_name" = '2160p Remux' and "custom_format_name" = 'ASL' and "arr_type" = 'all' and "score" = -999999;
-- --- END op 10620

-- --- BEGIN op 10621 ( update quality_profile "720p Quality" )
update "quality_profile_custom_formats" set "custom_format_name" = 'Audio Description' where "quality_profile_name" = '720p Quality' and "custom_format_name" = 'ASL' and "arr_type" = 'all' and "score" = -999999;
-- --- END op 10621

-- --- BEGIN op 10622 ( update regular_expression "ASL" )
update "regular_expressions" set "pattern" = '\b(Audio[ ._-]Description)\b' where "name" = 'ASL' and "pattern" = '\b(ASL|BASL|BSL|Audio[ ._-]Description)\b';
-- --- END op 10622

-- --- BEGIN op 10623 ( update regular_expression "Audio Description" )
update "regular_expressions" set "name" = 'Audio Description' where "name" = 'ASL';
-- --- END op 10623

-- --- BEGIN op 10624 ( update custom_format "Audio Description" )
update "condition_patterns" set "regular_expression_name" = 'Audio Description' where "custom_format_name" = 'Audio Description' and "condition_name" = 'ASL' and "regular_expression_name" in ('ASL', 'Audio Description');
-- --- END op 10624

-- --- BEGIN op 10625 ( create regular_expression "ASL" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('ASL', '\b(Audio[ ._-]Description)\b', NULL, NULL);

insert into "tags" ("name") values ('Enhancements') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('ASL', 'Enhancements');
-- --- END op 10625

-- --- BEGIN op 10626 ( update regular_expression "ASL" )
update "regular_expressions" set "pattern" = '\b(ASL)\b' where "name" = 'ASL' and "pattern" = '\b(Audio[ ._-]Description)\b';
-- --- END op 10626

-- --- BEGIN op 10627 ( create regular_expression "BASL" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('BASL', '\b(ASL)\b', NULL, NULL);

insert into "tags" ("name") values ('Enhancements') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('BASL', 'Enhancements');
-- --- END op 10627

-- --- BEGIN op 10628 ( update regular_expression "BASL" )
update "regular_expressions" set "pattern" = '\b(BASL)\b' where "name" = 'BASL' and "pattern" = '\b(ASL)\b';
-- --- END op 10628

-- --- BEGIN op 10629 ( update regular_expression "Black American Sign Language" )
update "regular_expressions" set "name" = 'Black American Sign Language' where "name" = 'BASL';
-- --- END op 10629

-- --- BEGIN op 10630 ( update regular_expression "American Sign Language" )
update "regular_expressions" set "name" = 'American Sign Language' where "name" = 'ASL';
-- --- END op 10630

-- --- BEGIN op 10631 ( create regular_expression "British Sign Language" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('British Sign Language', '\b(BASL)\b', NULL, NULL);

insert into "tags" ("name") values ('Enhancements') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('British Sign Language', 'Enhancements');
-- --- END op 10631

-- --- BEGIN op 10632 ( update regular_expression "British Sign Language" )
update "regular_expressions" set "pattern" = '\b(BSL)\b' where "name" = 'British Sign Language' and "pattern" = '\b(BASL)\b';
-- --- END op 10632

-- --- BEGIN op 10633 ( update custom_format "Audio Description" )
update "custom_formats" set "description" = 'Sign Language Variations' where "name" = 'Audio Description' and "description" = 'Audio Description / ASL / BASL / BSL';
-- --- END op 10633

-- --- BEGIN op 10634 ( update custom_format "Audio Description" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Audio Description'
	  AND name = 'ASL'
	  AND type = 'release_title'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 1;
-- --- END op 10634

-- --- BEGIN op 10635 ( update custom_format "Audio Description" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Audio Description', 'Audio Description', 'release_title', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Audio Description', 'Audio Description', 'Audio Description');
-- --- END op 10635

-- --- BEGIN op 10636 ( update custom_format "Audio Description" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Audio Description', 'American Sign Language', 'release_title', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Audio Description', 'American Sign Language', 'American Sign Language');
-- --- END op 10636

-- --- BEGIN op 10637 ( update custom_format "Audio Description" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Audio Description', 'Black American Sign Language', 'release_title', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Audio Description', 'Black American Sign Language', 'Black American Sign Language');
-- --- END op 10637

-- --- BEGIN op 10638 ( update custom_format "Audio Description" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Audio Description', 'British Sign Language', 'release_title', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Audio Description', 'British Sign Language', 'British Sign Language');
-- --- END op 10638
