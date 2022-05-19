local package = {
    "nvim-telescope/telescope.nvim",
    event = "UIEnter",
    requires = {
        "nvim-lua/plenary.nvim"
    },
    after = {
        "which-key",
        "trouble.nvim",
    }
}

function package.config()
    local actions = require("telescope.actions")
    local trouble = require("trouble")

    require("telescope").setup {
        defaults = {
            mappings = {
                i = {
                    ["<ESC>"] = actions.close,
                    ["<C-t>"] = trouble.open_with_trouble,
                },
                n = {
                    ["<C-t>"] = trouble.open_with_trouble,
                }
            }
        }
    }
end

return package
