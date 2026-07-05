-- @operation: export
-- @entity: batch
-- @name: Tweak German DL Regex to account for Bypassers
-- @exportedAt: 2026-07-05T02:48:41.051Z
-- @opIds: 12106

-- --- BEGIN op 12106 ( update regular_expression "German DL" )
update "regular_expressions" set "pattern" = '(?=.*\bGERMAN\b)(?=.*\b[DM]L\b).*' where "name" = 'German DL' and "pattern" = '\b(GERMAN[ ._-][DM]L)\b';
-- --- END op 12106
