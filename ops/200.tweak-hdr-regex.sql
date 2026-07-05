-- @operation: export
-- @entity: batch
-- @name: Tweak HDR Regex
-- @exportedAt: 2026-07-04T18:58:03.553Z
-- @opIds: 11781, 11782, 11783, 11784, 11785

-- --- BEGIN op 11781 ( update regular_expression "SDR" )
update "regular_expressions" set "pattern" = '\bSDR\b' where "name" = 'SDR' and "pattern" = '\b(SDR)\b';
-- --- END op 11781

-- --- BEGIN op 11782 ( update regular_expression "Dolby Vision" )
update "regular_expressions" set "pattern" = '\b(DV|Dovi|Dolby[ .]?Vision)\\b' where "name" = 'Dolby Vision' and "pattern" = '\b(dv(?![ .](HLG|SDR))|dovi|dolby[ .]?vision)\b';
-- --- END op 11782

-- --- BEGIN op 11783 ( update regular_expression "Dolby Vision" )
update "regular_expressions" set "pattern" = '\b(DV|Dovi|Dolby[ .]?Vision)\b' where "name" = 'Dolby Vision' and "pattern" = '\b(DV|Dovi|Dolby[ .]?Vision)\\b';
-- --- END op 11783

-- --- BEGIN op 11784 ( update regular_expression "Dolby Vision (Without Fallback)" )
update "regular_expressions" set "pattern" = '(?<=^(?!.*(HDR|HULU|REMUX|BLURAY)).*?)\b(DV|Dovi|Dolby[ .]?Vision)\b' where "name" = 'Dolby Vision (Without Fallback)' and "pattern" = '(?<=^(?!.*(HDR|HULU|REMUX|BLURAY)).*?)\b(DV|Dovi|Dolby[- .]?V(ision)?)\b';
-- --- END op 11784

-- --- BEGIN op 11785 ( update regular_expression "Basic HDR Formats" )
update "regular_expressions" set "pattern" = 'HDR|\b(DV|Dovi|Dolby[ .]?Vision|HLG|PQ(10)?)\b' where "name" = 'Basic HDR Formats' and "pattern" = '(?:(?<=^(?!.*\b(HLG|PQ|SDR)(\b|\d)).*?)HDR)|\b(dv(?![ .](HLG|SDR))|dovi|dolby[ .]?vision)\b';
-- --- END op 11785
