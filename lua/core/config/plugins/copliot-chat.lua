local chat = require("CopilotChat")
vim.keymap.set('n', '<leader>co', chat.toggle, { noremap = true });
vim.keymap.set('n', '<leader>cm', chat.select_model, { noremap = true });
