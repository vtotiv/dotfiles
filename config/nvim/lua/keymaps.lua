-- set leader to Space
vim.g.mapleader = ' '

-- Set copilot accept
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

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

