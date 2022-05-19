local package = {
    "nvim-telescope/telescope.nvim",
    event = "UIEnter",
    requires = {
        "nvim-lua/plenary.nvim"
    },
    after = {
        "which-key"
    }
}

function package.config()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    telescope.setup {
        defaults = {
            mappings = {
                i = {
                    ["<ESC>"] = actions.close
                }
            }
        }
    }
end

return package
