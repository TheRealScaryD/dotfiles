return {
  -- the colorscheme should be available when starting Neovim
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
{
    'tribela/transparent.nvim',
     event = 'VimEnter',
     config = true,
},
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
--or                               , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
   },
    {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},

require('telescope').setup{
  defaults = {
    layout_strategy = "cursor",
    layout_config = {
      width = .95,  -- Example: 80% of screen width
      height = .95,},}, -- Example: 80% of screen height
  pickers = {},
  extensions = {},
                          },
  }
