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
                    ["<C-q>"] = actions.send_to_qflist,
                    ["<M-q>"] = actions.send_selected_to_qflist,
                },
                n = {
                    ["<C-q>"] = actions.send_to_qflist,
                    ["<M-q>"] = actions.send_selected_to_qflist,
                }
            }
        }
    }
end

return package
