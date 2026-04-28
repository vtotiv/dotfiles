vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.encoding = "utf-8"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.expandtab = false

vim.opt.clipboard:append({ "unnamedplus" })

-- copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

-- make warnings go away
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- set zathura as viewer for LatexLivePreview
vim.g.livepreview_previewer = "zathura"
vim.g.livepreview_use_biber = 1
