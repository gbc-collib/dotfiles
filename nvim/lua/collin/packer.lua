vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  use {
	  'nvim-telescope/telescope.nvim', --tag = '0.1.0',
	                              branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine'
	    })

  use({ "ellisonleao/gruvbox.nvim", as='gruv-box',  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end })
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'hrsh7th/cmp-buffer'},
	{'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'L3MON4D3/LuaSnip'},     -- Required
    {'rafamadriz/friendly-snippets'},
  }
}
 use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})
 use('nvim-treesitter/playground')
 use('theprimeagen/harpoon')
 use("tpope/vim-fugitive")
 use("theprimeagen/refactoring.nvim")
 use("mbbill/undotree")
 use("folke/tokyonight.nvim")
 use("startup-nvim/startup.nvim")
end)
