vim.g.mapleader = " "

local o = vim.opt

o.termguicolors = true
o.number = true
o.relativenumber = true
o.signcolumn = "yes"
o.clipboard = "unnamedplus"
o.cursorline = true
o.scrolloff = 999

o.ignorecase = true

vim.cmd("colorscheme habamax")

vim.pack.add({
    "https://github.com/saghen/blink.cmp",
    "https://github.com/saghen/blink.lib", -- DEPENDENCY
    "https://github.com/mason-org/mason.nvim",
})

require("lsp")
