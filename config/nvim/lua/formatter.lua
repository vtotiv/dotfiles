require("conform").setup({
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
	},
})
