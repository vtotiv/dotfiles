local function isempty(s)
	return s == nil or s == ""
end

function open_nvim_tree()
	local filetype = vim.bo[0].filetype

	-- nvim opened without a file specified
	if isempty(filetype) then
		require("nvim-tree.api").tree.open({ focus = true, find_file = false })
		return
	end

	-- nvim opened with a given dir
	if filetype == "directory" or filetype == "NvimTree" then
		require("nvim-tree.api").tree.open({ focus = true, find_file = false })
		return
	end

	-- current buffer is a file
	require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
end
