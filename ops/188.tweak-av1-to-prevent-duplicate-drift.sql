-- @operation: export
-- @entity: batch
-- @name: Tweak AV1 to Prevent Duplicate Drift
-- @exportedAt: 2026-06-30T02:50:27.225Z
-- @opIds: 11446

-- --- BEGIN op 11446 ( update regular_expression "AV1" )
update "regular_expressions" set "pattern" = '\bAV1\b' where "name" = 'AV1' and "pattern" = '\b(AV1)\b';
-- --- END op 11446
