return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  cmd = {
    "SupermavenUseFree",
    "SupermavenUsePro",
  },
  opts = {
    -- disable_inline_completion = vim.g.ai_cmp,
    ignore_filetypes = { "bigfile" },
  },
}
