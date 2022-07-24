local package = {
    "neovim/nvim-lspconfig",
    event = "UIEnter",
    after = {
        "which-key",
    }
}

return package
