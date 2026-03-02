return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.completion.copilot-lua" },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      copilot_node_command = "/home/eclypsium/.nvm/versions/node/v24.13.0/bin/node",
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<M-l>",
          next = "<M-j>",
          prev = "<M-k>",
          dismiss = "<M-h>",
        },
      },
      panel = {
        enabled = true,
        auto_refresh = true,
      },
    },
  },
}
