-- Copilot accept, next and previous
vim.keymap.set(
	"i",
	"<C-z>",
	'copilot#Accept("<CR>")',
	{ silent = true, expr = true, replace_keycodes = false, desc = "Copilot accept" }
)
vim.keymap.set("i", "<C-u>", "<Plug>(copilot-next)", { desc = "Copilot next" })
vim.keymap.set("i", "<M-]>", "<Plug>(copilot-previous)", { desc = "Copilot previous" })

-- NvimTree
vim.keymap.set("n", "<Leader>n", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
vim.keymap.set("n", "<Leader>m", ":NvimTreeFocus<CR>", { desc = "Focus NvimTree" })

-- better window navigation
vim.keymap.set("n", "<Leader>h", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<Leader>j", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<Leader>k", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<Leader>l", "<C-w>l", { desc = "Window right" })

-- use alt + shift + hjkl to resize windows
vim.keymap.set("n", "<S-M-j>", ":<C-U>resize -2<CR>", { desc = "Resize down" })
vim.keymap.set("n", "<S-M-k>", ":<C-U>resize +2<CR>", { desc = "Resize up" })
vim.keymap.set("n", "<S-M-h>", ":<C-U>vertical resize -2<CR>", { desc = "Resize left" })
vim.keymap.set("n", "<S-M-l>", ":<C-U>vertical resize +2<CR>", { desc = "Resize right" })

-- better nav for omnicomplete
vim.keymap.set("i", "<C-j>", "<C-n>", { desc = "Next completion" })
vim.keymap.set("i", "<C-k>", "<C-p>", { desc = "Previous completion" })

-- maintains selection when indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- selects last pasted text
vim.keymap.set("n", "gp", "`[v`]", { desc = "Select last paste (charwise)" })
vim.keymap.set("n", "gP", "`[V`]", { desc = "Select last paste (linewise)" })

-- hides highlights
vim.keymap.set("n", "<Leader>ö", ":noh<CR>", { desc = "Clear search highlights" })

-- untabs in insert mode
vim.keymap.set("i", "<S-TAB>", "<C-D>", { desc = "Unindent" })

-- insert line without leaving normal mode
vim.keymap.set("n", "<Leader>o", "o<Esc>", { desc = "Insert line below" })
vim.keymap.set("n", "<Leader>O", "O<Esc>", { desc = "Insert line above" })

-- copy current relative path to clipboard
vim.keymap.set("n", "<leader>cf", ':let @+ = expand("%")<CR>', { desc = "Copy relative path" })

-- fzf
local fzflua = require("fzf-lua")
vim.keymap.set("n", "<leader>ff", fzflua.files, { silent = true, desc = "Find files" })
vim.keymap.set("n", "<leader>fg", fzflua.grep_project, { silent = true, desc = "Grep project" })
vim.keymap.set("n", "<leader>fv", fzflua.grep_visual, { silent = true, desc = "Grep visual" })
vim.keymap.set("n", "<leader>fc", fzflua.grep_cword, { silent = true, desc = "Grep word" })
vim.keymap.set("n", "<leader>fC", fzflua.grep_cWORD, { silent = true, desc = "Grep WORD" })

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnostic float" })
