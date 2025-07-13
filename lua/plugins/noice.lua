return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      views    = {
        cmdline_popup = {
          position = {
            row = 5,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          }
        },
      },
      -- Significantly improve messages experience
      messages = {
        -- Set message view to use minimal view with compact formatting
        view = "mini",
        -- Increase max messages history
        view_history = "popup",
        -- Reduce lag by using a higher throttle time
        view_error = "notify",
        view_warn = "notify",
        view_search = false,
      },
      lsp      = {
        progress = {
          enabled = true,
          -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
          -- See the section on formatting for more details on how to customize.
          --- @type NoiceFormat|string
          format = "lsp_progress",
          --- @type NoiceFormat|string
          format_done = "lsp_progress_done",
          throttle = 1000 / 30, -- frequency to update lsp progress message
          view = "mini",
        },
        override = {
          -- override the default lsp markdown formatter with Noice
          ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
          -- override the lsp markdown formatter with Noice
          ["vim.lsp.util.stylize_markdown"] = false,
          -- override cmp documentation with Noice (needs the other options to work)
          ["cmp.entry.get_documentation"] = false,
        },
        hover = {
          enabled = true,
          silent = false, -- set to true to not show a message if hover is not available
          view = nil,     -- when nil, use defaults from documentation
          ---@type NoiceViewOptions
          opts = {},      -- merged with defaults from documentation
        },
        signature = {
          enabled = true,
          auto_open = {
            enabled = false,
            trigger = false, -- Automatically show signature help when typing a trigger character from the LSP
            luasnip = false, -- Will open signature help when jumping to Luasnip insert nodes
            throttle = 50,   -- Debounce lsp signature help request by 50ms
          },
          view = nil,        -- when nil, use defaults from documentation
          ---@type NoiceViewOptions
          opts = {},         -- merged with defaults from documentation
        },
        message = {
          -- Messages shown by lsp servers
          enabled = true,
          view = "notify",
          opts = {},
        },
        -- defaults for hover and signature help
        documentation = {
          view = "hover",
          ---@type NoiceViewOptions
          opts = {
            lang = "markdown",
            replace = true,
            render = "plain",
            format = { "{message}" },
            win_options = { concealcursor = "n", conceallevel = 3 },
          },
        },
      },
      -- Hide written messages that are displayed when files are saved
      -- routes   = {
      --   {
      --     filter = {
      --       event = "msg_show",
      --       kind = "",
      --       find = "written",
      --     },
      --     opts = { skip = true },
      --   },
      --   -- Reduce distractions by skipping unnecessary messages
      --   {
      --     filter = {
      --       event = "msg_show",
      --       kind = "",
      --       find = "lines",
      --     },
      --     opts = { skip = true },
      --   },
      --   -- Clean up search messages like "Pattern not found"
      --   {
      --     filter = {
      --       event = "msg_show",
      --       kind = "search_count",
      --     },
      --     opts = { skip = true },
      --   },
      -- },

      -- Nicer looking notifications using nvim-notify
      notify   = {
        -- Display notifications for warning/error messages
        enabled = true,
        -- Set a clean view of notifications
        view = "notify",
        -- Limit notification size
        timeout = 3000,
      },

      -- Show message history as a proper popup with scrollback

      -- Command line settings
      cmdline  = {
        view = "cmdline_popup",
        format = {
          cmdline = { icon = ">" },
          search_down = { icon = "🔍⌄" },
          search_up = { icon = "🔍⌃" },
          filter = { icon = "$" },
          lua = { icon = "☾" },
          help = { icon = "?" },
        },
      },
    })
  end,
}
