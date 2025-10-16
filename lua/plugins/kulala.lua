return {
  "mistweaverco/kulala.nvim",
  keys = {
    { "<leader>ks", desc = "Send request" },
    { "<leader>ks", desc = "Send all requests" },
    { "<leader>kb", desc = "Open scratchpad" },
  },
  ft = { "http", "rest" },
  opts = {
    global_keymaps = false,
  },
  enabled = true,
  event = "VeryLazy",
}
