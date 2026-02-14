return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "md", "rmd" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons", -- AstroVim ya suele tenerlo
  },
  config = function()
    require("render-markdown").setup({
      enabled = true, -- render por defecto
    })
  end,
}

