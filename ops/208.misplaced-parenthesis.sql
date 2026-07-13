-- @operation: export
-- @entity: batch
-- @name: Misplaced Parenthesis
-- @exportedAt: 2026-07-12T23:00:23.618Z
-- @opIds: 12345

-- --- BEGIN op 12345 ( update regular_expression "CAM" )
update "regular_expressions" set "pattern" = '(?<=\b[12]\d{3}\b).*(\b(CAM[ ._-]?(Rip)?|DVD[ ._-]?(SCR(EENER)?)|HD[ ._-]?(CAM|SCR|TC|TS)|SCREENER|TELE(CINE|SYNC)|WORKPRINT)\b)' where "name" = 'CAM' and "pattern" = '(?<=\b[12]\d{3}\b).*(\b(CAM[ ._-]?(Rip)?|DVD[ ._-]?(SCR(EENER)?)|HD[ ._-]?(CAM|SCR|TC|TS)|SCREENER|TELE(CINE|SYNC|WORKPRINT))\b)';
-- --- END op 12345
