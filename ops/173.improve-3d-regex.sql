-- @operation: export
-- @entity: batch
-- @name: Improve 3D regex
-- @exportedAt: 2026-06-03T15:45:52.020Z
-- @opIds: 1298, 1299, 1300, 1301

-- --- BEGIN op 1298 ( update regular_expression "3D" )
update "regular_expressions" set "description" = 'Matches 3D stereoscopic format tags in two branches.

**1. 3D tag** - matches `3D` optionally prefixed with `Bluray` or `BD`.

**2. Stereoscopic packing format** - matches Over-Under and Side-by-Side tags with an optional size prefix.

- The prefix group `(H(alf)?|F(ull)?)` recognises Half/H and Full/F as size indicators. The entire prefix is optional, so bare formats like `SBS` or `OU` match without one. Each optional suffix (`alf`, `ull`, `ver`, `nder`, `ide`, `y`) allows both short and long forms to match from a single pattern, e.g. `O(ver)?.?U(nder)?` matches `OU`, `Over.Under`, and mixed forms like `Over.U` or `O.Under`.

- Word boundaries `\b` at the start and end of the pattern prevent matches against substrings within larger words. For example, `HOURS` contains `OU` but has no word boundary between `O` and the preceding `H` or between `U` and the following `R`, so it does not match. Similarly `HOUSE` contains `HOU` but the trailing `SE` prevents a word boundary after `U`.

- Separators between components use `.?` (any single optional character) except between `S(ide)` and `B(y)` in the Side-by-Side pattern, which uses `[\W_]?` (non-word character or underscore). This is because `.?` would allow an alphabetic character in that position, causing false matches where a letter between S and B forms an unintended word. For example, `SOBS` would match as `S[O]B[]S` with `.?` consuming the O. Using `[\W_]?` restricts that position to only non-alphanumeric separators like dots, hyphens, spaces and underscores.

- Note that because the prefix is fully optional, double separators like `H..OU` or `Half..SBS` will still match. The prefixed path fails because `.?` only allows one separator character, but the engine falls back to matching bare `OU` or `SBS` at the end of the string where valid word boundaries exist.' where "name" = '3D' and "description" = 'Matches terms related to 3D video formats:
- `bluray3d` or `bd3d` (optional `bluray` or `bd` followed by `3d`).
- `sbs` (side-by-side).
- `half ou` or `half sbs` with space (` `), dot (`.`), or hyphen (`-`) as separators.';
-- --- END op 1298

-- --- BEGIN op 1299 ( update regular_expression "3D" )
update "regular_expressions" set "regex101_id" = 'i0Ngyx/1' where "name" = '3D' and "regex101_id" is null;
-- --- END op 1299

-- --- BEGIN op 1300 ( update regular_expression "3D" )
update "regular_expressions" set "pattern" = '\b((Bluray|BD)?3D|((H(alf)?|F(ull)?).?)?(O(ver)?.?U(nder)?|S(ide)?[\W_]?B(y)?.?S(ide)?))\b' where "name" = '3D' and "pattern" = '(?<=\b[12]\d{3}\b).*\b((Bluray|BD)?3D|SBS|H[- .]?OU|H[- .]?SBS|Half[ .-]?OU|Half[ .-]?SBS)\b';
-- --- END op 1300

-- --- BEGIN op 1301 ( update regular_expression "3D" )
DELETE FROM regular_expression_tags WHERE regular_expression_name = '3D' AND tag_name = 'Enhancement';

insert into "tags" ("name") values ('Edition') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('3D', 'Edition');
-- --- END op 1301
