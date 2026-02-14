return {
  "willothy/nvim-cokeline",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  event = "VeryLazy",
  config = function()
    local get_hex = require("cokeline.hlgroups").get_hl_attr

    local active_bg = "#1d3b53"
    local inactive_bg = "#011627"
    local active_fg = get_hex("Normal", "fg")
    local inactive_fg = get_hex("Comment", "fg")

    require("cokeline").setup({
      show_if_buffers_are_at_least = 2,

      sidebar = {
        filetype = { "neo-tree" },
        components = {
          {
            text = function()
              return "  Files"
            end,
            bold = true,
            fg = active_fg,
            bg = inactive_bg,
          },
        },
      },

      default_hl = {
        fg = function(buffer)
          return buffer.is_focused and active_fg or inactive_fg
        end,
        bg = function(buffer)
          return buffer.is_focused and active_bg or inactive_bg
        end,
      },

      components = {
        {
          text = function(buffer)
            return buffer.is_focused and "▎" or " "
          end,
          fg = function(buffer)
            return buffer.is_focused and "#82aaff" or nil
          end,
        },
       -- { text = " " },
        {
          text = function(buffer) return buffer.devicon.icon end,
          fg = function(buffer)
            return buffer.is_focused and buffer.devicon.color or inactive_fg
          end,
        },
       -- { text = " " },
        {
          text = function(buffer) return buffer.filename end,
          bold = function(buffer) return buffer.is_focused end,
        },
        { text = " " },
        {
          text = function(buffer)
            return buffer.is_modified and "● " or ""
          end,
          fg = function(buffer)
            return buffer.is_modified and "#ffcb6b" or nil
          end,
        },
        {
          text = function(buffer)
            local errors = buffer.diagnostics.errors
            local warnings = buffer.diagnostics.warnings
            local result = ""
            if errors > 0 then result = result .. " " end
            if warnings > 0 then result = result .. " " end
            return result
          end,
          fg = function(buffer)
            if buffer.diagnostics.errors > 0 then
              return "#ef5350"
            elseif buffer.diagnostics.warnings > 0 then
              return "#ffcb6b"
            end
          end,
        },
        { text = " " },
      },
    })

    vim.keymap.set("n", "<Tab>", "<Plug>(cokeline-focus-next)", { silent = true })
    vim.keymap.set("n", "<S-Tab>", "<Plug>(cokeline-focus-prev)", { silent = true })
  end,
}
