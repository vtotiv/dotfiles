return {
	-- Theme
	"shaunsingh/nord.nvim",
	{ "rose-pine/neovim", name = "rose-pine", lazy = false, priority = 1000 },

	-- UI Enhancements
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl" },
	"unblevable/quick-scope",
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local api = require("nvim-tree.api")

			local function on_attach(bufnr)
				local function opts(desc)
					return {
						desc = "nvim-tree: " .. desc,
						buffer = bufnr,
						noremap = true,
						silent = true,
						nowait = true,
					}
				end

				api.config.mappings.default_on_attach(bufnr)

				vim.keymap.set("n", "<Leader>v", api.node.open.vertical, opts("Open: Vertical Split"))
				vim.keymap.set("n", "<Leader>s", api.node.open.horizontal, opts("Open: Horizontal Split"))
				vim.keymap.set("n", "<Leader>c", api.tree.change_root_to_node, opts("CD"))
			end

			require("nvim-tree").setup({ on_attach = on_attach })
		end,
	},

	-- Git
	"tpope/vim-fugitive",

	-- Copilot
	"github/copilot.vim",
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim" },
		},
		build = "make tiktoken",
		opts = {},
	},

	-- LSP & Autocomplete
	"neovim/nvim-lspconfig",
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	-- Formatting
	{
		"stevearc/conform.nvim",
		opts = {
			format_on_save = { timeout_ms = 500 },
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				graphql = { "prettier" },
				python = { "black" },
				yaml = { "prettier" },
				lua = { "stylua" },
				go = { "gofumpt" },
				dart = { "dart_format" },
			},
		},
	},

	-- Fuzzy Finding
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Language Specific
	{
		"akinsho/flutter-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
	},
	{ "xuhdev/vim-latex-live-preview", ft = "tex" },

	"numToStr/Comment.nvim",
}
