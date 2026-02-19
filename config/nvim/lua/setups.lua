--
require("mason").setup()
require("mason-lspconfig").setup()

require("flutter-tools").setup({})

-- show indentation
require("ibl").setup()

-- better picker for CopilotChat
-- require('fzf-lua').register_ui_select()

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if status_ok then
	configs.setup({
		ensure_installed = {
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"typescript",
			"javascript",
			"dart",
			"go",
			"python",
			"json",
		},

		sync_install = false,

		auto_install = true,

		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	})
end
