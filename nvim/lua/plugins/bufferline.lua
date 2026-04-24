return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    local palette = {
      bg_hi = "#242424",
      bg_alt = "#141414",
      fg = "#D4D4D4",
      comment = "#7D7D7D",
      link = "#81A1C1",
      git_modified = "#F1B467",
      error = "#F14C4C",
      warn = "#F8C762",
    }

    -- Highlights custom para el offset del sidebar (Neo-tree)
    local function set_offset_hl()
      vim.api.nvim_set_hl(0, "BufferLineOffsetFiles", {
        fg = palette.comment,
        bg = palette.bg_alt,
        bold = true,
      })
      vim.api.nvim_set_hl(0, "BufferLineOffsetSeparator", {
        fg = palette.comment,
        bg = palette.bg_alt,
      })
      vim.api.nvim_set_hl(0, "BufferLineOffsetSeparatorVisible", {
        fg = palette.comment,
        bg = palette.bg_alt,
      })
      vim.api.nvim_set_hl(0, "BufferLineOffsetSeparatorSelected", {
        fg = palette.comment,
        bg = palette.bg_alt,
      })
    end
    set_offset_hl()
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = set_offset_hl,
    })

    require("bufferline").setup({
      options = {
        mode = "buffers",
        numbers = "none",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        indicator = {
          icon = "▍",
          style = "icon",
        },
        modified_icon = "●",
        max_name_length = 30,
        max_prefix_length = 15,
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
            highlight = "BufferLineOffsetFiles",
          },
        },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = { "", "" },
        enforce_regular_tabs = false,
        always_show_bufferline = false,
        hover = {
          enabled = true,
          delay = 150,
          reveal = { "close" },
        },
      },
      highlights = {
        fill             = { bg = palette.bg_alt },
        background       = { fg = palette.comment, bg = palette.bg_alt },
        buffer_visible   = { fg = palette.comment, bg = palette.bg_alt },
        buffer_selected  = { fg = palette.fg,      bg = palette.bg_hi, bold = true, italic = false },

        separator          = { fg = palette.bg_alt, bg = palette.bg_alt },
        separator_visible  = { fg = palette.bg_alt, bg = palette.bg_alt },
        separator_selected = { fg = palette.bg_alt, bg = palette.bg_hi },

        indicator_selected = { fg = palette.link, bg = palette.bg_hi },

        modified          = { fg = palette.git_modified, bg = palette.bg_alt },
        modified_visible  = { fg = palette.git_modified, bg = palette.bg_alt },
        modified_selected = { fg = palette.git_modified, bg = palette.bg_hi },

        error                     = { fg = palette.error, bg = palette.bg_alt },
        error_visible             = { fg = palette.error, bg = palette.bg_alt },
        error_selected            = { fg = palette.error, bg = palette.bg_hi, bold = true },
        error_diagnostic          = { fg = palette.error, bg = palette.bg_alt },
        error_diagnostic_visible  = { fg = palette.error, bg = palette.bg_alt },
        error_diagnostic_selected = { fg = palette.error, bg = palette.bg_hi, bold = true },

        warning                     = { fg = palette.warn, bg = palette.bg_alt },
        warning_visible             = { fg = palette.warn, bg = palette.bg_alt },
        warning_selected            = { fg = palette.warn, bg = palette.bg_hi, bold = true },
        warning_diagnostic          = { fg = palette.warn, bg = palette.bg_alt },
        warning_diagnostic_visible  = { fg = palette.warn, bg = palette.bg_alt },
        warning_diagnostic_selected = { fg = palette.warn, bg = palette.bg_hi, bold = true },
      },
    })

    vim.keymap.set("n", "<Tab>",   "<Cmd>BufferLineCycleNext<CR>", { silent = true })
    vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { silent = true })
  end,
}
