local package = {
    "nvim-telescope/telescope.nvim",
    requires = {
        "nvim-lua/plenary.nvim"
    },
    after = {
        "which-key.nvim"
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

    require("which-key").register(
        {
            f = { builtin.find_files, "Search for [f]iles" },
            g = { builtin.live_grep, "[G]rep the workspace" },
            p = { builtin.grep_string, "Search for the [p]hrase under the cursor" },
        },
        {
            prefix = "<LEADER>"
        }
    )
end

return package
