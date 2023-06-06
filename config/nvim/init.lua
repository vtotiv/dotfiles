require("functions")
require("plugins")

require("mason").setup()
require("mason-lspconfig").setup()
require('lspconfig').pyright.setup{}

require("autocmd")
require("keymaps")
require("lsp")

require("options")
require("color")

