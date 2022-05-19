local package = {
    "nvim-telescope/telescope.nvim",
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

    local which_key = require("which-key")

    which_key.register({
            ["<LEADER>f"] = {
                name = "[F]ind",
                b = { builtin.buffers, "Find a [b]uffer" },
                c = { builtin.commands, "Find [c]ommands" },
                f = { builtin.find_files, "Find [f]iles" },
                g = { builtin.live_grep, "[G]rep the workspace" },
                h = { builtin.help_tags, "Find [h]elp pages" },
                j = { builtin.jumplist, "Find a [j]ump location" },
                k = { builtin.keymaps, "Find a [k]eymap" },
                l = { builtin.reloader, "Find [l]ua modules to reload" },
                m = { builtin.man_pages, "Find a [m]an page" },
                p = { builtin.grep_string, "Find the [p]hrase under the cursor" },
                q = { builtin.quickfixhistory, "Find a recently used [q]uickfix lists" },
                r = { builtin.resume, "[R]esume previous find" },
            }
        })
end

return package
