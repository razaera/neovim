local package = {
    "hrsh7th/nvim-cmp",
    requires = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline"
    },
    event = "UIEnter",
}

function package.config()
    local cmp = require("cmp")

    cmp.setup({
            sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "cmdline" },
                })
        })
end

return package
