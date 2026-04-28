-- Set up nvim-cmp.
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` and `?`
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
	"gopls",
	"golangci_lint_ls",
	"docker_compose_language_service",
	"dockerls",
	"ts_ls",
	"pyright",
	"bashls",
	"texlab",
	"graphql",
	"clangd",
}

for _, server in ipairs(servers) do
	vim.lsp.config[server] = {
		capabilities = capabilities,
	}
	vim.lsp.enable(server)
end

-- ESLint with eslint_d
vim.lsp.config.eslint = {
	capabilities = capabilities,
	cmd = { "eslint_d", "--stdio" },
	settings = {
		run = "onType",
		experimental = {
			useFlatConfig = true,
		},
		workingDirectory = {
			mode = "auto",
		},
	},
}
vim.lsp.enable("eslint")
