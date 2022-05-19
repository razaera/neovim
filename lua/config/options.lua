vim.g.mapleader = " "

vim.o.timeoutlen = 500
-- vim.opt.ttimeoutlen = 500
vim.o.lazyredraw = true

vim.o.clipboard = 'unnamedplus'
vim.o.history = 1000

vim.o.scrolloff = 10
vim.o.wrap = true
vim.wo.wrap = true

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "yes"

vim.o.hidden = true
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.listchars = [[tab:»\ ,space:·,trail:•]]

vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.bo.softtabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.expandtab = true
vim.bo.expandtab = true

vim.o.background = "light"
vim.o.termguicolors = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.grepprg = "rg --vimgrep --smart-case"
vim.bo.grepprg = "rg --vimgrep --smart-case"

vim.g.vim_markdown_follow_anchor = 1
vim.g.vim_markdown_math = 1
vim.g.vim_markdown_strikethrough = 1

vim.o.conceallevel = 2
vim.wo.conceallevel = 2
-- vim.o.foldmethod = "syntax"
-- vim.wo.foldmethod = "syntax"
vim.o.foldlevelstart = 99
