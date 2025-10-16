return {
  { "mcookly/bidi.nvim" },
  { "wakatime/vim-wakatime", lazy = false },
  -- Detect tabstop and shiftwidth automatically
  -- markdown-render.nvim
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      completions = { lsp = { enabled = true } },
    },
    cmd = { "RenderMarkdown", "RenderMarkdownStop" },
  },

  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    "theprimeagen/vim-be-good",
    cmd = "VimBeGood",
  },

  "Bleksak/laravel-ide-helper.nvim",
  opts = {
    save_before_write = true,
    format_after_gen = true,
    models_args = {},
  },
  enabled = function()
    return vim.fn.filereadable("artisan") ~= 0
  end,
  keys = {
    {
      "<leader>lgM",
      function()
        require("laravel-ide-helper").generate_models(vim.fn.expand("%"))
      end,
      desc = "Generate Model Info for current model",
    },
    {
      "<leader>lgm",
      function()
        require("laravel-ide-helper").generate_models()
      end,
      desc = "Generate Model Info for all models",
    },
  },
}
