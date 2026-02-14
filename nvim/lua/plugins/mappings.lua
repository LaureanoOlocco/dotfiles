return {
  "AstroNvim/astrocore",
  opts = {
    mappings = {
      i = {
        ["<C-s>"] = { "<Cmd>silent! update!<CR>", desc = "Force write" },
      },
    },
  },
}
