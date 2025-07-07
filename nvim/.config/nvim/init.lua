-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Global settings and keybinds
vim.g.mapleader = " "

vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.textwidth = 80

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
        "neovim/nvim-lspconfig",
	    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	    { "lewis6991/gitsigns.nvim", opts = {} },
	    { "nvim-lualine/lualine.nvim", dependencies = { 'nvim-tree/nvim-web-devicons' }, opts = {} },
		{ "nvim-telescope/telescope.nvim", dependencies = { 'nvim-lua/plenary.nvim' } },
		{ "nvim-tree/nvim-tree.lua", opts = {} },
	    { "nvim-treesitter/nvim-treesitter", lazy = false, build = ":TSUpdate" },
	    { "williamboman/mason.nvim", opts = {} },
	    { "williamboman/mason-lspconfig.nvim", opts = {} },
    }
  },
  { colorscheme = { "catppuccin" } },
  checker = { enabled = true },
})

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true
    }
}

require('telescope').setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules/.*",
      "%.lock",
    }
  }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>td', builtin.diagnostics, { desc = 'Telescope diagnostics' })

vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<cr>')
vim.keymap.set('n', '<leader>tf', ':NvimTreeFocus<cr>')


vim.cmd([[colorscheme catppuccin]])
