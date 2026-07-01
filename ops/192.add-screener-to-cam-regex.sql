-- @operation: export
-- @entity: batch
-- @name: Add SCREENER to CAM Regex
-- @exportedAt: 2026-06-30T21:53:42.205Z
-- @opIds: 11622

-- --- BEGIN op 11622 ( update regular_expression "CAM" )
update "regular_expressions" set "pattern" = '(?<=\b[12]\d{3}\b).*(\b(CAM|HDTS|SCREENER|TELESYNC)\b)' where "name" = 'CAM' and "pattern" = '(?<=\b[12]\d{3}\b).*(\b(CAM|HDTS|TELESYNC)\b)';
-- --- END op 11622
