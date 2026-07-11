-- @operation: export
-- @entity: batch
-- @name: Tighten Basic HDR Formats Regex
-- @exportedAt: 2026-07-11T00:31:57.232Z
-- @opIds: 12341

-- --- BEGIN op 12341 ( update regular_expression "Basic HDR Formats" )
update "regular_expressions" set "pattern" = '\bHDR(\b|\d)|\b(DV|Dovi|Dolby[ .]?Vision|HLG|PQ(10)?)\b' where "name" = 'Basic HDR Formats' and "pattern" = 'HDR|\b(DV|Dovi|Dolby[ .]?Vision|HLG|PQ(10)?)\b';
-- --- END op 12341
