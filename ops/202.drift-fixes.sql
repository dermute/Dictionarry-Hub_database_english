-- @operation: export
-- @entity: batch
-- @name: Drift Fixes
-- @exportedAt: 2026-07-07T00:44:00.912Z
-- @opIds: 12149

-- --- BEGIN op 12149 ( update regular_expression "VP9" )
update "regular_expressions" set "pattern" = '\bVP9\b' where "name" = 'VP9' and "pattern" = '\b(VP9)\b';
-- --- END op 12149
