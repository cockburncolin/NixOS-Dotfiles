local matugen_colors = require, "../colors/matugen.lua"
if ok then
  for group, color in pairs(matugen_colors) do
    vim.api.nvim_set_hl(0, group, { fg = color })
  end
end

