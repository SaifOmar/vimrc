return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    views = {
      notify = {
        timeout = 1500,
      },
      cmdline_popup = {
        position = {
          row = 4,     -- Top of the screen
          col = "50%", -- Centered horizontally
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  }
}
