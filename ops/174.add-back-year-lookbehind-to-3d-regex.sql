-- @operation: export
-- @entity: batch
-- @name: Add back year lookbehind to 3D regex
-- @exportedAt: 2026-06-03T16:38:29.356Z
-- @opIds: 1305, 1306, 1307

-- --- BEGIN op 1305 ( update regular_expression "3D" )
update "regular_expressions" set "description" = 'Matches 3D stereoscopic format tags in two branches.

**1. 3D tag** - matches `3D` optionally prefixed with `Bluray` or `BD`.

**2. Stereoscopic packing format** - matches Over-Under and Side-by-Side tags with an optional size prefix.

- The prefix group `(H(alf)?|F(ull)?)` recognises Half/H and Full/F as size indicators. The entire prefix is optional, so bare formats like `SBS` or `OU` match without one. Each optional suffix (`alf`, `ull`, `ver`, `nder`, `ide`, `y`) allows both short and long forms to match from a single pattern, e.g. `O(ver)?.?U(nder)?` matches `OU`, `Over.Under`, and mixed forms like `Over.U` or `O.Under`.

- Word boundaries `\b` at the start and end of the pattern prevent matches against substrings within larger words. For example, `HOURS` contains `OU` but has no word boundary between `O` and the preceding `H` or between `U` and the following `R`, so it does not match. Similarly `HOUSE` contains `HOU` but the trailing `SE` prevents a word boundary after `U`.

- Separators between components use `.?` (any single optional character) except between `S(ide)` and `B(y)` in the Side-by-Side pattern, which uses `[\W_]?` (non-word character or underscore). This is because `.?` would allow an alphabetic character in that position, causing false matches where a letter between S and B forms an unintended word. For example, `SOBS` would match as `S[O]B[]S` with `.?` consuming the O. Using `[\W_]?` restricts that position to only non-alphanumeric separators like dots, hyphens, spaces and underscores.

- Note that because the prefix is fully optional, double separators like `H..OU` or `Half..SBS` will still match. The prefixed path fails because `.?` only allows one separator character, but the engine falls back to matching bare `OU` or `SBS` at the end of the string where valid word boundaries exist.

- A year lookbehind `(?<=\b[12]\d{3}\b)` ensures the pattern only matches after a four-digit year in the filename. This is needed because `3D` appears in actual movie titles (e.g. "Step Up 3D", "Jaws 3D", "Amityville 3D") and should not be matched as a format tag when it comes before the year. The lookbehind applies to the entire pattern rather than just the 3D branch to keep the regex simpler. In practice this has no effect on stereoscopic tags like SBS or OU since they do not appear in movie titles.' where "name" = '3D' and "description" = 'Matches 3D stereoscopic format tags in two branches.

**1. 3D tag** - matches `3D` optionally prefixed with `Bluray` or `BD`.

**2. Stereoscopic packing format** - matches Over-Under and Side-by-Side tags with an optional size prefix.

- The prefix group `(H(alf)?|F(ull)?)` recognises Half/H and Full/F as size indicators. The entire prefix is optional, so bare formats like `SBS` or `OU` match without one. Each optional suffix (`alf`, `ull`, `ver`, `nder`, `ide`, `y`) allows both short and long forms to match from a single pattern, e.g. `O(ver)?.?U(nder)?` matches `OU`, `Over.Under`, and mixed forms like `Over.U` or `O.Under`.

- Word boundaries `\b` at the start and end of the pattern prevent matches against substrings within larger words. For example, `HOURS` contains `OU` but has no word boundary between `O` and the preceding `H` or between `U` and the following `R`, so it does not match. Similarly `HOUSE` contains `HOU` but the trailing `SE` prevents a word boundary after `U`.

- Separators between components use `.?` (any single optional character) except between `S(ide)` and `B(y)` in the Side-by-Side pattern, which uses `[\W_]?` (non-word character or underscore). This is because `.?` would allow an alphabetic character in that position, causing false matches where a letter between S and B forms an unintended word. For example, `SOBS` would match as `S[O]B[]S` with `.?` consuming the O. Using `[\W_]?` restricts that position to only non-alphanumeric separators like dots, hyphens, spaces and underscores.

- Note that because the prefix is fully optional, double separators like `H..OU` or `Half..SBS` will still match. The prefixed path fails because `.?` only allows one separator character, but the engine falls back to matching bare `OU` or `SBS` at the end of the string where valid word boundaries exist.';
-- --- END op 1305

-- --- BEGIN op 1306 ( update regular_expression "3D" )
update "regular_expressions" set "regex101_id" = 'i0Ngyx/2' where "name" = '3D' and "regex101_id" = 'i0Ngyx/1';
-- --- END op 1306

-- --- BEGIN op 1307 ( update regular_expression "3D" )
update "regular_expressions" set "pattern" = '(?<=\b[12]\d{3}\b).*\b((Bluray|BD)?3D|((H(alf)?|F(ull)?).?)?(O(ver)?.?U(nder)?|S(ide)?[\W_]?B(y)?.?S(ide)?))\b' where "name" = '3D' and "pattern" = '\b((Bluray|BD)?3D|((H(alf)?|F(ull)?).?)?(O(ver)?.?U(nder)?|S(ide)?[\W_]?B(y)?.?S(ide)?))\b';
-- --- END op 1307
