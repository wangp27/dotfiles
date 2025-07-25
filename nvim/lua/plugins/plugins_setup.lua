local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins_setup.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use "EdenEast/nightfox.nvim"
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional
      },
    }
    use "christoomey/vim-tmux-navigator"
    use "nvim-treesitter/nvim-treesitter"
    use "p00f/nvim-ts-rainbow"
    use "mason-org/mason.nvim"
    use {
        "mason-org/mason-lspconfig.nvim",
        tag = 'v1.32.0'
    }
    use "neovim/nvim-lspconfig"

    -- dap
    use {
        'mfussenegger/nvim-dap',
        requires = {
            'igorlfs/nvim-dap-view',
            -- 'rcarriga/nvim-dap-ui',
            'theHamsta/nvim-dap-virtual-text',
            'nvim-telescope/telescope-dap.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-neotest/nvim-nio'
        }
    }


    -- auto complete
    use {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets"
    }

    use "ray-x/lsp_signature.nvim"

    -- gcc and gc comment
    use {
        'numToStr/Comment.nvim',
    }

    use {
        "kylechui/nvim-surround",
        tag = "*",
    }

    use {
         "windwp/nvim-autopairs",
    }
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
    use "lewis6991/gitsigns.nvim"

    use {
          'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
          requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- remote nvim
    use {
        "amitds1997/remote-nvim.nvim",
        branch = "main",
        requires = {
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
            'nvim-telescope/telescope.nvim'
        }
    }

    -- leap motion
    use "ggandor/leap.nvim"

    -- cursor animation
    use "sphamba/smear-cursor.nvim"

    -- copilot
    use "github/copilot.vim"

    -- copilot chat
    use {
        "CopilotC-Nvim/CopilotChat.nvim",
        requires = {
            "github/copilot.vim",
            "nvim-lua/plenary.nvim"
        }
    }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
