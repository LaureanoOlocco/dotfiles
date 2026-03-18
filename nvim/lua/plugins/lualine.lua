return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      theme = {
        normal = {
          a = { fg = "#011627", bg = "#82aaff", gui = "bold" },
          b = { fg = "#d6deeb", bg = "#1d3b53" },
          c = { fg = "#7fdbca", bg = "#011627" },
          y = { fg = "#d6deeb", bg = "#1d3b53" },
          z = { fg = "#271d01", bg = "#82aaff", gui = "bold" },
        },
        insert = {
          a = { fg = "#011627", bg = "#addb67", gui = "bold" },
          z = { fg = "#011627", bg = "#addb67", gui = "bold" },
        },
        visual = {
          a = { fg = "#011627", bg = "#c792ea", gui = "bold" },
          z = { fg = "#011627", bg = "#c792ea", gui = "bold" },
        },
        replace = {
          a = { fg = "#011627", bg = "#ef5350", gui = "bold" },
          z = { fg = "#011627", bg = "#ef5350", gui = "bold" },
        },
        inactive = {
          a = { fg = "#4b6479", bg = "#011627" },
          b = { fg = "#4b6479", bg = "#011627" },
          c = { fg = "#4b6479", bg = "#011627" },
        },
      },
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        { "mode" },
      },
      lualine_b = {
        { "branch", icon = "" },        -- icono rama git
        {
          "diff",
          symbols = {
            added = " ",               -- icono archivo nuevo
            modified = " ",            -- icono archivo modificado
            removed = " ",             -- icono archivo eliminado
          },
        },
      },
      lualine_c = {
        {
          "filename",
          path = 1,                      -- 0=solo nombre, 1=ruta relativa, 2=ruta absoluta
          symbols = {
            modified = "●",            -- buffer modificado
            readonly = " ",            -- archivo readonly
            unnamed = "",   -- buffer sin nombre
          },
        },
      },
      lualine_x = {
        {
          "diagnostics",
          sources = { "nvim_lsp" },
          symbols = {
            error = " ",               -- icono error LSP
            warn = " ",                -- icono warning LSP
            info = " ",                -- icono info LSP
            hint = "󰌵 ",               -- icono hint LSP
          },
        },
        { "filetype", icon_only = false },  -- muestra devicon + nombre del filetype
      },
      lualine_y = {
        { "encoding", icon = "" },      -- icono encoding
        { "fileformat", icons_enabled = true },  -- unix/windows/mac
      },
      lualine_z = {
        { "location", icon = "" },      -- icono posición línea:columna
        { "progress", icon = "" },      -- icono porcentaje del archivo
      },
    },
  },
}