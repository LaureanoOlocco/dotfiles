local base = {
  bg = "#181818",
  bg_alt = "#141414",
  bg_hi = "#242424",
  fg = "#D4D4D4",
  fg_dim = "#A8A8A8",
  fg_muted = "#7D7D7D",
}

local terminal = {
  red = "#FC6B83",
  green = "#3FA266",
  blue = "#81A1C1",
  magenta = "#B48EAD",
}

local bubbles_theme = {
  normal = {
    a = { fg = base.bg, bg = terminal.blue, gui = "bold" },
    b = { fg = base.fg, bg = base.bg_hi },
    c = { fg = base.fg_dim, bg = base.bg },
    x = { fg = base.fg, bg = base.bg },
    y = { fg = base.fg, bg = base.bg_hi },
    z = { fg = base.bg, bg = terminal.blue, gui = "bold" },
  },
  insert = {
    a = { fg = base.bg, bg = terminal.green, gui = "bold" },
    z = { fg = base.bg, bg = terminal.green, gui = "bold" },
  },
  visual = {
    a = { fg = base.bg, bg = terminal.magenta, gui = "bold" },
    z = { fg = base.bg, bg = terminal.magenta, gui = "bold" },
  },
  replace = {
    a = { fg = base.bg, bg = terminal.red, gui = "bold" },
    z = { fg = base.bg, bg = terminal.red, gui = "bold" },
  },
  inactive = {
    a = { fg = base.fg_muted, bg = base.bg_alt },
    b = { fg = base.fg_muted, bg = base.bg_alt },
    c = { fg = base.fg_muted, bg = base.bg_alt },
    x = { fg = base.fg_muted, bg = base.bg_alt },
    y = { fg = base.fg_muted, bg = base.bg_alt },
    z = { fg = base.fg_muted, bg = base.bg_alt },
  },
}

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      theme = bubbles_theme,
      section_separators = { left = "", right = "" },
      component_separators = "",
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        { "mode", separator = { left = "" }, right_padding = 1 },
      },
      lualine_b = {
        { "branch", icon = "" },
      },
      lualine_c = {
        {
          "filename",
          path = 0,
          symbols = {
            modified = "●",
            readonly = "",
            unnamed = "",
          },
        },
        {
          "diagnostics",
          sources = { "nvim_lsp" },
          symbols = {
            error = " ",
            warn = " ",
            info = " ",
            hint = "󰌵 ",
          },
        },
      },
      lualine_x = {
        { "filetype", icon_only = false },
      },
      lualine_y = {
        {
          "diff",
          symbols = {
            added = " ",
            modified = " ",
            removed = " ",
          },
        },
      },
      lualine_z = {
        { "filesize", icon = "󰆼", separator = { right = "" }, left_padding = 1 },
      },
    },
    inactive_sections = {
      lualine_a = {
        { "filename", separator = { left = "", right = "" } },
      },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {
        { "filesize", icon = "󰆼", separator = { left = "", right = "" } },
      },
    },
  },
}
