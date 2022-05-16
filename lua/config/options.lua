-- Sets the leader key to spacebar.
vim.g.mapleader = " "

vim.g.timeoutlen = 500
vim.g.ttimeoutlen = 500

-- Sets command history size.
vim.o.history = 1000

-- The minimum number of lines that can appear between the cursor and the edge of a window.
vim.o.scrolloff = 10

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "yes"

-- Allows buffers to be active without being visible in a window.
vim.o.hidden = true

-- Defines the visual representation for whitespace and control characters.
vim.o.listchars = [[tab:»\ ,space:·,trail:•]]

-- The number of spaces used to represent a tab character.
vim.o.tabstop = 4
vim.bo.tabstop = 4

-- The number of spaces that should be inserted when the <TAB> key is pressed.
vim.o.softtabstop = 4
vim.bo.softtabstop = 4

-- The number of spaces used for indentation.
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4

-- Instructs the <TAB> key to insert spaces instead of tab characters.
vim.o.expandtab = true
vim.bo.expandtab = true

-- vim.o.splitright = true
-- vim.o.splitbelow = true

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

