--
require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig").pyright.setup({})

require("flutter-tools").setup({})

-- show indentation
require("ibl").setup()

-- better picker for CopilotChat
-- require('fzf-lua').register_ui_select()
