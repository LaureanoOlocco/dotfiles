return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.utility.noice-nvim" },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        bottom_search = true,         -- búsqueda abajo (clásica)
        command_palette = true,        -- comandos como popup
        long_message_to_split = true,  -- mensajes largos en split
      },
    },
  },
}
