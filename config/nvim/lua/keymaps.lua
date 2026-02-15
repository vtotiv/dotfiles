-- set leader to Space
vim.g.mapleader = ' '

-- map tab, I don't know why TAB doesn't work wihout it
vim.api.nvim_set_keymap('i', '<Tab>', '<Tab>', { noremap = true, silent = true })

-- Set copilot accept, next and previous
vim.api.nvim_set_keymap("i", "<C-z>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.keymap.set('i', '<C-u>', '<Plug>(copilot-next)')
vim.keymap.set('i', '<C-i>', '<Plug>(copilot-previous)')

-- remap most used Nvim funcs
vim.keymap.set('n', '<Leader>n', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<Leader>m', ':NvimTreeFocus<CR>')

-- better window navigation
vim.keymap.set('n', '<Leader>h', '<C-w>h')
vim.keymap.set('n', '<Leader>j', '<C-w>j')
vim.keymap.set('n', '<Leader>k', '<C-w>k')
vim.keymap.set('n', '<Leader>l', '<C-w>l')

-- use alt + shift + hjkl to resize windows
vim.keymap.set('n', '<S-M-J>', ':<C-U>resize -2<CR>')
vim.keymap.set('n', '<S-M-K>', ':<C-U>resize +2<CR>')
vim.keymap.set('n', '<S-A-H>', ':<C-U>vertical resize -2<CR>')
vim.keymap.set('n', '<S-A-L>', ':<C-U>vertical resize +2<CR>')

-- better nav for omnicomplete
vim.keymap.set('i', '<C-j>', '<C-n>')
vim.keymap.set('i', '<C-k>', '<C-p>')

-- maintains selection when indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- selects last pasted text
vim.keymap.set('n', 'gp', '`[v`]')
vim.keymap.set('n', 'gP', '`[V`]')

-- hides highlights
vim.keymap.set('n', '<Leader>ö', ':noh<CR>')

-- untabs in insert mode
vim.keymap.set('i', '<S-TAB>', '<C-D>')

-- insert line without leaving normal mode
vim.keymap.set('n', '<Leader>o', 'o<Esc>')
vim.keymap.set('n', '<Leader>O', 'O<Esc>')

-- copy current relative path to clipboard
vim.keymap.set("n", "<leader>cf", ':let @+ = expand("%")<CR>', { desc = "Copy relative path" })

-- fzf
local fzflua = require('fzf-lua')
vim.keymap.set('n', '<leader>ff', fzflua.files, { silent = true })
vim.keymap.set('n', '<leader>fg', fzflua.grep_project, { silent = true })
vim.keymap.set('n', '<leader>fv', fzflua.grep_visual, { silent = true })
vim.keymap.set('n', '<leader>fc', fzflua.grep_cword, { silent = true })
vim.keymap.set('n', '<leader>fC', fzflua.grep_cWORD, { silent = true })
