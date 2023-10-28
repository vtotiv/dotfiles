vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.encoding = 'utf-8'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.expandtab = false

-- vim.cmd[[set clipboard+=unnamedplus]]
vim.opt.clipboard:append({'unnamedplus'})

-- copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

-- make warnings go away
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- disable netrw at the very start of your init.lua for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set zathura as viewer for LatexLivePreview
vim.g.livepreview_previewer = 'zathura'

-- replace gofmt with stricter gofumpt
vim.g.go_fmt_command = "gopls"
vim.g.go_gopls_gofumpt = 1

-- dart config
vim.g.dart_html_in_string = true
vim.g.dart_format_on_save = true
