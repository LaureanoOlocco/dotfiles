-- ~/.config/nvim/lua/plugins/heirline.lua
return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    opts.tabline = nil
    return opts
  end,
}