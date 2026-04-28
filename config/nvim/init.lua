-- Basic setup
require("pre") -- Loads global options like mapleader

-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require("lazy").setup("plugins")

-- Load remaining configuration
require("setups")
require("functions")
require("autocmd")
require("keymaps")
require("lsp")
require("options")
require("color")
