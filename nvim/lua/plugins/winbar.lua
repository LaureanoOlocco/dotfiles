return {
  "AstroNvim/astroui",
  opts = function(_, opts)
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        local bg = "#011627"
        vim.api.nvim_set_hl(0, "WinBar", { bg = bg, bold = true })
        vim.api.nvim_set_hl(0, "WinBarNC", { bg = bg })
        for _, group in ipairs(vim.fn.getcompletion("Aerial*", "highlight")) do
          local hl = vim.api.nvim_get_hl(0, { name = group })
          hl.bg = vim.api.nvim_get_hl(0, { name = "WinBar" }).bg
          vim.api.nvim_set_hl(0, group, hl)
        end
        -- Neo-tree source selector
        vim.api.nvim_set_hl(0, "NeoTreeTabActive", { fg = "#d6deeb", bg = "#1d3b53", bold = true })
        vim.api.nvim_set_hl(0, "NeoTreeTabInactive", { fg = "#637777", bg = "#011627" })
        vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorActive", { fg = "#1d3b53", bg = "#1d3b53" })
        vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorInactive", { fg = "#011627", bg = "#011627" })
        vim.api.nvim_set_hl(0, "NeoTreeSourceSelectorTabActive", { fg = "#d6deeb", bg = "#1d3b53", bold = true })
        vim.api.nvim_set_hl(0, "NeoTreeSourceSelectorTabInactive", { fg = "#637777", bg = "#011627" })
        vim.api.nvim_set_hl(0, "NeoTreeSourceSelectorTabSeparatorActive", { fg = "#1d3b53", bg = "#1d3b53" })
        vim.api.nvim_set_hl(0, "NeoTreeSourceSelectorTabSeparatorInactive", { fg = "#011627", bg = "#011627" })
      end,
    })
  end,
}
