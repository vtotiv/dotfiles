-- Quit when nvim-tree is last buffer and ask for unsaved files
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
  pattern = "NvimTree_*",
  callback = function()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
  end
})

-- open nvim-tree on startup when no name or file, but don't focus if file given
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- Format on save with conform.nvim
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.json", },
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
