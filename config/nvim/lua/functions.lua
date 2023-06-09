local function isempty(s)
  return s == nil or s == ''
end

function open_nvim_tree()
	-- Get the type of the current buffer
	local filetype = vim.api.nvim_buf_get_option(0, 'filetype')

	-- nvim opened without a file specified
	if isempty(filetype) then
		require("nvim-tree.api").tree.open({ focus = true, find_file = false, })
		return
	end

	-- nvim opened with a given dir
	if filetype == 'directory' or filetype == "NvimTree" then
		require("nvim-tree.api").tree.open({ focus = true, find_file = false, })
		return
	end

	-- current buffer is a file
	require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
end

vim.g.mapleader = ' '
function nvim_tree_on_attach(bufnr)
	local api = require "nvim-tree.api"

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set('n', '<Leader>v', api.node.open.vertical, opts('Open: Vertical Split'))
	vim.keymap.set('n', '<Leader>h', api.node.open.horizontal, opts('Open: Horizontal Split'))
	vim.keymap.set('n', '<Leader>c', api.tree.change_root_to_node, opts('CD'))
end


