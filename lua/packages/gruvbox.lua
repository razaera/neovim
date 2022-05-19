local package = {
    "ellisonleao/gruvbox.nvim",
    event = "UIEnter",
    as = "colorscheme",
}

function package.config()
    vim.g.gruvbox_bold = 1
    vim.g.gruvbox_italic = 1
    vim.g.gruvbox_underline = 1
    vim.g.gruvbox_undercurl = 1
    vim.g.gruvbox_termcolors = 256
    vim.g.gruvbox_italicize_comments = 1
    vim.g.gruvbox_italicize_strings = 1

    vim.api.nvim_exec("colorscheme gruvbox", false)
end

return package
