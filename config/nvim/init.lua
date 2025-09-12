require("pre")
require("plugins")

require("mason").setup()
require("mason-lspconfig").setup()
require('lspconfig').pyright.setup{}

require("flutter-tools").setup {}

require("functions")
require("autocmd")
require("keymaps")
require("lsp")
require("formatter")

require("options")
require("color")
