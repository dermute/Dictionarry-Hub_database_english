-- @operation: export
-- @entity: batch
-- @name: Update CAM Regex to include more Variations of CAM
-- @exportedAt: 2026-07-12T22:53:19.947Z
-- @opIds: 12343

-- --- BEGIN op 12343 ( update regular_expression "CAM" )
update "regular_expressions" set "pattern" = '(?<=\b[12]\d{3}\b).*(\b(CAM[ ._-]?(Rip)?|DVD[ ._-]?(SCR(EENER)?)|HD[ ._-]?(CAM|SCR|TC|TS)|SCREENER|TELE(CINE|SYNC|WORKPRINT))\b)' where "name" = 'CAM' and "pattern" = '(?<=\b[12]\d{3}\b).*(\b(CAM|HDSCR|HDTS|SCREENER|TELESYNC)\b)';
-- --- END op 12343
