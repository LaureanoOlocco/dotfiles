return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
 ██▒   █▓    ██▓    ███▄ ▄███▓
▓██░   █▒   ▓██▒   ▓██▒▀█▀ ██▒
 ▓██  █▒░   ▓██▒   ▓██    ▓██░
  ▒██ █░░   ░██░   ▒██    ▒██
   ▒▀█░     ░██░   ▒██▒   ░██▒
   ░ ▐░     ░▓     ░ ▒░   ░  ░
   ░ ░░      ▒ ░   ░  ░      ░
     ░░      ▒ ░   ░      ░
      ░      ░
     ░
        ]],
      },
    },
    indent = {
      enabled = true,
      animate = {
        enabled = true,
        style = "up_down",
        easing = "outQuart",
        duration = { step = 25, total = 1600 },
      },
      scope = {
        enabled = true,
        char = "│",
        underline = false,
        only_current = false,
      },
      chunk = {
        enabled = false,
      },
    },
    scope = { enabled = true },
    picker = {
      layout = {
        preset = "telescope",
      },
      win = {
        input = { wo = { statusline = " " } },
        list = { wo = { statusline = " " } },
        preview = { wo = { statusline = " " } },
      },
      layouts = {
        telescope = {
          fullscreen = true,
          reverse = false,
          layout = {
            box = "horizontal",
            backdrop = false,
            width = 0.8,
            height = 0.9,
            border = "none",
            {
              box = "vertical",
              width = 0.3,
              { win = "input", height = 1, border = "rounded", title = "{title}", title_pos = "center" },
              { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
            },
            { win = "preview", title = "{preview:Preview}", border = "rounded", title_pos = "center" },
          },
        },
      },
    },
  },
}
