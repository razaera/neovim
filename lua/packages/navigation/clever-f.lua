local package = {
    "rhysd/clever-f.vim",
    event = "UIEnter",
    after = "colorscheme",
}

function package.config()
    vim.g.clever_f_across_no_line = 1
    vim.g.clever_f_smart_case = 1
    vim.g.clever_f_mark_direct = 1
end

return package
