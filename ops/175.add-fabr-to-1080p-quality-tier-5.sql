-- @operation: export
-- @entity: batch
-- @name: Add faBR to 1080p Quality Tier 5
-- @exportedAt: 2026-06-06T00:14:40.758Z
-- @opIds: 10917, 10918, 10919, 10920

-- --- BEGIN op 10917 ( create regular_expression "faBR" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('faBR', '(?<=^|[\s.-])ADE\b', NULL, NULL);

insert into "tags" ("name") values ('Bluray') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('faBR', 'Bluray');

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('faBR', 'Release Group');
-- --- END op 10917

-- --- BEGIN op 10918 ( update regular_expression "faBR" )
update "regular_expressions" set "pattern" = '(?<=^|[\s.-])faBR\b' where "name" = 'faBR' and "pattern" = '(?<=^|[\s.-])ADE\b';
-- --- END op 10918

-- --- BEGIN op 10919 ( update custom_format "1080p Quality Tier 5" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('1080p Quality Tier 5', 'faBR', 'release_group', 'all', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('1080p Quality Tier 5', 'faBR', 'faBR');
-- --- END op 10919

-- --- BEGIN op 10920 ( update regular_expression "UHD Bluray Release Groups" )
update "regular_expressions" set "pattern" = '(?<=^|[\s.-])(AJP69|ATELiER|BakedFEL|BMF|BRUTE|BSTD|BV|c0kE|CART|Chotab|CJ|coffee|CRiSC|CRX|CtrlHD|Dariush|de[42]|decibel|DON|D-Z0N3|E.N.D|E1|EA|EDPH|EbP|ESiR|EXCiSION|faBR|FoRM|FraMeSToR|GALAXY|Geek|GS88|GZ|hdalx|HDMaNiAcS|HiDt|HiFi|HiP|IDE|iFT|KASHMiR|Kitsune|LiNG|LolHD|LoRD|luvBB|NCmt|NiBuRu|nmd|NTb|NyHD|ORBiT|ORiGEN|Penumbra|playHD|Positive|PTer|PuTao|REBORN|RiCO|rightSIZE|RO|rttr|SA89|SaNcTi|SbR|SiMPLE|Softboat|SoLaR|SOP|SPHD|TayTo|TBB|TDD|TeamSyndicate|TnP|VLAD|VietHD|W4NK3R|WiLF|WMING|xander|ZIMBO|ZoroSenpai|ZQ)\b' where "name" = 'UHD Bluray Release Groups' and "pattern" = '(?<=^|[\s.-])(AJP69|ATELiER|BakedFEL|BMF|BRUTE|BSTD|BV|c0kE|CART|Chotab|CJ|coffee|CRiSC|CRX|CtrlHD|Dariush|de[42]|decibel|DON|D-Z0N3|E.N.D|E1|EA|EDPH|EbP|ESiR|EXCiSION|FoRM|FraMeSToR|GALAXY|Geek|GS88|GZ|hdalx|HDMaNiAcS|HiDt|HiFi|HiP|IDE|iFT|KASHMiR|Kitsune|LiNG|LolHD|LoRD|luvBB|NCmt|NiBuRu|nmd|NTb|NyHD|ORBiT|ORiGEN|Penumbra|playHD|Positive|PTer|PuTao|REBORN|RiCO|rightSIZE|RO|rttr|SA89|SaNcTi|SbR|SiMPLE|Softboat|SoLaR|SOP|SPHD|TayTo|TBB|TDD|TeamSyndicate|TnP|VLAD|VietHD|W4NK3R|WiLF|WMING|xander|ZIMBO|ZoroSenpai|ZQ)\b';
-- --- END op 10920
