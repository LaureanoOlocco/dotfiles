return {
  "hat0uma/csvview.nvim",
  ft = "csv",
  cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
  keys = {
  { "<leader>tv", "<cmd>CsvViewToggle<CR>", desc = "Toggle CSV View" },
  },
  config = function()
    require("csvview").setup()
  end,
}