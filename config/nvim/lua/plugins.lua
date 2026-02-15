local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- Colorscheme
	-- use 'nordtheme/vim'
	use 'shaunsingh/nord.nvim'
	use {
		'rose-pine/neovim',
		as = 'rose-pine'
	}

	-- show indentation
	use 'lukas-reineke/indent-blankline.nvim'

	-- comments with gc(c)
	use 'tomtom/tcomment_vim'

	-- Git in nvim
	use 'tpope/vim-fugitive'

	-- highlight unique letter in each word
	use 'unblevable/quick-scope'

	-- copilot
	use 'github/copilot.vim'
	use {
	  'CopilotC-Nvim/CopilotChat.nvim',
	  run = 'make tiktoken',
	  requires = {
		'nvim-lua/plenary.nvim',
	  },
	  config = function()
		-- Your configuration goes here, for example:
		-- require('CopilotChat').setup {
		--   -- See Configuration section for options
		-- }
	  end,
	}
	
	-- go in vim
	use 'fatih/vim-go'

	-- lsp
	use {
    	"williamboman/mason.nvim",
		run = ":MasonUpdate",
    	"williamboman/mason-lspconfig.nvim",
 		"neovim/nvim-lspconfig",
	}
	
	-- Latex Live previews side by side
	use {
	  'xuhdev/vim-latex-live-preview',
	  ft = { 'tex' }
	}
		
	-- treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		branch = 'main',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}

	-- nvim tree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			require("nvim-tree").setup {
				on_attach = nvim_tree_on_attach,
			}
		end
	}
	
	use {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/nvim-cmp',
	}

	use {
		'L3MON4D3/LuaSnip',
		run = "make install_jsregexp",
		'saadparwaiz1/cmp_luasnip',

	}

	use 'dart-lang/dart-vim-plugin'
	use {
		'akinsho/flutter-tools.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'stevearc/dressing.nvim', -- optional for vim.ui.select
		},
	}

	-- fzf
	use { "ibhagwan/fzf-lua",
		requires = { "nvim-tree/nvim-web-devicons" }
	}

	-- formatting and linting
	use {
		'stevearc/conform.nvim',
		opts = {},
	}


	if packer_bootstrap then
    	require('packer').sync()
  	end
end)
