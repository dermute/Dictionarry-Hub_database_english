-- @operation: export
-- @entity: batch
-- @name: Update YTS Regex
-- @exportedAt: 2026-05-25T01:04:45.162Z
-- @opIds: 10825

-- --- BEGIN op 10825 ( update regular_expression "YTS" )
update "regular_expressions" set "pattern" = '(?<=^|[\s.-])YTS(.(AG|BZ|LT|MX))?\b' where "name" = 'YTS' and "pattern" = '(?<=^|[\s.-])YTS(.(MX|LT|AG))?\b';
-- --- END op 10825
