require("flutter-tools").setup({})

-- show indentation
require("ibl").setup({
	scope = { enabled = true },
})

require("Comment").setup()

-- Ensure treesitter parsers are installed
-- Uses vim.treesitter.language.add to check all runtime paths (system packages + nvim-treesitter)
-- Requires tree-sitter-cli to compile missing parsers: pacman -S tree-sitter-cli
local ensure_installed = {
	"bash",
	"c",
	"css",
	"dart",
	"dockerfile",
	"go",
	"graphql",
	"html",
	"javascript",
	"json",
	"latex",
	"lua",
	"python",
	"query",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
}

local missing = {}
for _, lang in ipairs(ensure_installed) do
	if not pcall(vim.treesitter.language.add, lang) then
		table.insert(missing, lang)
	end
end

if #missing > 0 then
	if vim.fn.executable("tree-sitter") == 1 then
		require("nvim-treesitter.install").install(missing)
	else
		vim.defer_fn(function()
			vim.notify(
				"Missing treesitter parsers: " .. table.concat(missing, ", ") .. "\nInstall tree-sitter-cli: pacman -S tree-sitter-cli\nThen run :TSInstall " .. table.concat(missing, " "),
				vim.log.levels.WARN
			)
		end, 1000)
	end
end

-- Enable treesitter highlighting/indent on FileType
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("TSStart", { clear = true }),
	callback = function(args)
		if pcall(vim.treesitter.start, args.buf) then
			vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})

-- System Health Check: Verify external tools are installed
local function check_external_tools()
	local tools = {
		{ exe = "tree-sitter", pkg = "tree-sitter-cli (Arch)" },
		{ exe = "bash-language-server", pkg = "bash-language-server (Arch)" },
		{ exe = "black", pkg = "python-black (Arch)" },
		{ exe = "clangd", pkg = "clang (Arch)" },
		{ exe = "docker-compose-langserver", pkg = "npm install -g @microsoft/compose-language-service" },
		{ exe = "docker-langserver", pkg = "dockerfile-language-server (Arch)" },
		{ exe = "eslint_d", pkg = "eslint_d (Arch)" },
		{ exe = "gofumpt", pkg = "gofumpt (Arch)" },
		{ exe = "golangci-lint", pkg = "golangci-lint (Arch)" },
		{ exe = "golangci-lint-langserver", pkg = "golangci-lint-langserver (AUR)" },
		{ exe = "gopls", pkg = "gopls (Arch)" },
		{ exe = "gotests", pkg = "gotests (Arch)" },
		{ exe = "graphql-lsp", pkg = "npm install -g graphql-language-service-cli" },
		{ exe = "prettier", pkg = "prettier (Arch)" },
		{ exe = "pyright-langserver", pkg = "pyright (Arch)" },
		{ exe = "stylua", pkg = "stylua (Arch)" },
		{ exe = "texlab", pkg = "texlab (Arch)" },
		{ exe = "typescript-language-server", pkg = "typescript-language-server (Arch)" },
	}

	local missing = {}
	for _, tool in ipairs(tools) do
		if vim.fn.executable(tool.exe) == 0 then
			table.insert(missing, tool.exe .. " (" .. tool.pkg .. ")")
		end
	end

	if #missing > 0 then
		local msg = "Missing system tools:\n" .. table.concat(missing, "\n")
		vim.notify(msg, vim.log.levels.WARN, { title = "System Health: Install Missing Tools" })
	end
end

-- Run check on startup (deferred to not block UI)
vim.defer_fn(check_external_tools, 1000)
