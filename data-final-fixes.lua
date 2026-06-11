local setting_name = "jsl-quality-science-durability-quality-durability-scaling-factor"
local factor = settings.startup[setting_name].value

local function compute_multiplier(level, scaling_factor)
  if scaling_factor == 1 then
    return 1 + level
  end

  return scaling_factor ^ level
end

for _, quality in pairs(data.raw.quality or {}) do
  local level = quality.level or 0
  quality.tool_durability_multiplier = compute_multiplier(level, factor)
end
