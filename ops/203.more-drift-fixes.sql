-- @operation: export
-- @entity: batch
-- @name: More Drift Fixes
-- @exportedAt: 2026-07-07T02:05:06.964Z
-- @opIds: 12275, 12276, 12277, 12278

-- --- BEGIN op 12275 ( delete custom_format "Internal" )
delete from "custom_formats" where "name" = 'Internal';
-- --- END op 12275

-- --- BEGIN op 12276 ( update custom_format "IMAX" )
UPDATE custom_format_conditions
SET arr_type = 'radarr'
WHERE custom_format_name = 'IMAX'
  AND name = 'IMAX'
  AND type = 'release_title'
  AND arr_type = 'all'
  AND negate = 0
  AND required = 1;
-- --- END op 12276

-- --- BEGIN op 12277 ( update custom_format "IMAX" )
UPDATE custom_format_conditions
SET arr_type = 'radarr'
WHERE custom_format_name = 'IMAX'
  AND name = 'IMAX Enhanced'
  AND type = 'release_title'
  AND arr_type = 'all'
  AND negate = 1
  AND required = 1;
-- --- END op 12277

-- --- BEGIN op 12278 ( update custom_format "IMAX Enhanced" )
UPDATE custom_format_conditions
SET arr_type = 'radarr'
WHERE custom_format_name = 'IMAX Enhanced'
  AND name = 'IMAX Enhanced'
  AND type = 'release_title'
  AND arr_type = 'all'
  AND negate = 0
  AND required = 1;
-- --- END op 12278
