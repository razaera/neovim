local package = {
    "sainnhe/edge",
    event = "VimEnter",
}

function package.config()
    vim.cmd("colorscheme edge")
end

return package
