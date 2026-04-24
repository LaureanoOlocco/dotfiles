return {
  "AstroNvim/astroui",
  opts = function(_, opts)
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        local palette = {
          base = {
            bg = "#181818",
            bg_alt = "#141414",
            bg_hi = "#242424",
            fg = "#D4D4D4",
            fg_muted = "#7D7D7D",
          },
        }
        local bg = palette.base.bg
        vim.api.nvim_set_hl(0, "WinBar", { bg = bg, bold = true })
        vim.api.nvim_set_hl(0, "WinBarNC", { bg = bg })
        for _, group in ipairs(vim.fn.getcompletion("Aerial*", "highlight")) do
          local hl = vim.api.nvim_get_hl(0, { name = group })
          hl.bg = vim.api.nvim_get_hl(0, { name = "WinBar" }).bg
          vim.api.nvim_set_hl(0, group, hl)
        end
        -- Neo-tree source selector
        vim.api.nvim_set_hl(0, "NeoTreeTabActive", { fg = palette.base.fg, bg = palette.base.bg_hi, bold = true })
        vim.api.nvim_set_hl(0, "NeoTreeTabInactive", { fg = palette.base.fg_muted, bg = palette.base.bg_alt })
        vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorActive", { fg = palette.base.bg_hi, bg = palette.base.bg_hi })
        vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorInactive", { fg = palette.base.bg_alt, bg = palette.base.bg_alt })
        vim.api.nvim_set_hl(0, "NeoTreeSourceSelectorTabActive", { fg = palette.base.fg, bg = palette.base.bg_hi, bold = true })
        vim.api.nvim_set_hl(0, "NeoTreeSourceSelectorTabInactive", { fg = palette.base.fg_muted, bg = palette.base.bg_alt })
        vim.api.nvim_set_hl(0, "NeoTreeSourceSelectorTabSeparatorActive", { fg = palette.base.bg_hi, bg = palette.base.bg_hi })
        vim.api.nvim_set_hl(0, "NeoTreeSourceSelectorTabSeparatorInactive", { fg = palette.base.bg_alt, bg = palette.base.bg_alt })
      end,
    })
  end,
}
