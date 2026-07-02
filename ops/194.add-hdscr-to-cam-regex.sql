-- @operation: export
-- @entity: batch
-- @name: Add HDSCR to CAM Regex
-- @exportedAt: 2026-07-01T19:10:25.207Z
-- @opIds: 11635

-- --- BEGIN op 11635 ( update regular_expression "CAM" )
update "regular_expressions" set "pattern" = '(?<=\b[12]\d{3}\b).*(\b(CAM|HDSCR|HDTS|SCREENER|TELESYNC)\b)' where "name" = 'CAM' and "pattern" = '(?<=\b[12]\d{3}\b).*(\b(CAM|HDTS|SCREENER|TELESYNC)\b)';
-- --- END op 11635
