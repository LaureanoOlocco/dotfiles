-- ~/.config/nvim/lua/plugins/neotree.lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      width = 30,
      mappings = {
        ["e"] = function(state)
          local win = state.winid
          local current_width = vim.api.nvim_win_get_width(win)
          local normal = 40
          local expanded = 90
          if current_width >= expanded then
            vim.api.nvim_win_set_width(win, normal)
          else
            vim.api.nvim_win_set_width(win, expanded)
          end
        end,
      },
    },
  },
}