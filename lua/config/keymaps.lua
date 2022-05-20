local which_key = require("which-key")
local telescope = require("telescope.builtin")
local trouble = require("trouble")

function ns(spec)
    which_key.register(spec, { noremap = true, silent = true })
end

function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function clear_search()
    vim.api.nvim_feedkeys(t "<Plug>(clever-f-reset)", "x", true)
    vim.cmd("nohlsearch")
end

ns({
        -- Prevents the cursor from moving when joining lines
        J = { "mzJ`z", "Join the below line into the current line" },
        Y = { "y$", "Yank to the end of the current line" },
        -- Keeps the cursor centered when moving to the next search result
        n = { "nzzzv", "Go to next search result" },
        -- Keeps the cursor centered when moving to the next search result
        N = { "Nzzzv", "Go to previous search result" },

        ["[a"] = { ":previous<CR>", "Go to the previous arg" },
        ["]a"] = { ":next<CR>", "Go to the next arg" },
        ["[A"] = { ":first<CR>", "Go to the first arg" },
        ["]A"] = { ":last<CR>", "Go to the last arg" },
        ["[b"] = { ":BufferLineCyclePrev<CR>", "Go to the previous buffer" },
        ["]b"] = { ":BufferLineCycleNext<CR>", "Go to the next buffer" },
        ["[l"] = { ":lprevious<CR>", "Go to the previous loclist item" },
        ["]l"] = { ":lnext<CR>", "Go to the next loclist item" },
        ["[L"] = { ":lfirst<CR>", "Go to the first loclist item" },
        ["]L"] = { ":llast<CR>", "Go to the last loclist item" },
        ["[q"] = { ":cprevious<CR>", "Go to the previous quickfix list item" },
        ["]q"] = { ":cnext<CR>", "Go to the next quickfix list item" },
        ["[Q"] = { ":cfirst<CR>", "Go to the first quickfix list item" },
        ["]Q"] = { ":clast<CR>", "Go to the last quickfix list item" },
        ["[t"] = { ":tabprev<CR>", "Go to the previous tab" },
        ["]t"] = { ":tabnext<CR>", "Go to the next tab" },

        ["<S-h>"] = { ":BufferLineCyclePrev<CR>", "Go to the previous buffer" },
        ["<S-l>"] = { ":BufferLineCycleNext<CR>", "Go to the next buffer" },
        -- ["<S-j>"] = { function() trouble.next({skip_groups = true, jump = true}) end, "Go to next list item" },
        -- ["<S-k>"] = { function() trouble.previous({skip_groups = true, jump = true}) end, "Go to previous list item" },

        ["<LEADER>f"] = {
            name = "[F]ind",
            b = { telescope.buffers, "Find a [b]uffer" },
            c = { telescope.commands, "Find [c]ommands" },
            f = { telescope.find_files, "Find [f]iles" },
            g = { telescope.live_grep, "[G]rep the workspace" },
            h = { telescope.help_tags, "Find [h]elp pages" },
            j = { telescope.jumplist, "Find a [j]ump location" },
            k = { telescope.keymaps, "Find a [k]eymap" },
            l = { telescope.reloader, "Find [l]ua modules to reload" },
            m = { telescope.man_pages, "Find a [m]an page" },
            p = { telescope.grep_string, "Find the [p]hrase under the cursor" },
            q = { telescope.quickfixhistory, "Find a recently used [q]uickfix lists" },
            r = { telescope.oldfiles, "Find a [r]ecently-opened file" },
        },

        ["<LEADER>b"] = {
            name = "[B]uffers",
            ["h"] = { ":BufferLineMovePrev<CR>", "Move current buffer to the left" },
            ["l"] = { ":BufferLineMoveNext<CR>", "Move current buffer to the right" },
            ["c"] = { ":Bdelete!<CR>", "[C]lose the current buffer" },
            ["s"] = {
                name = "[S]ort",
                ["e"] = { ":BufferLineSortByExtension<CR>", "Sort buffers by file [e]xtension" },
                ["d"] = { ":BufferLineSortByRelativeDirectory<CR>", "Sort buffers by [d]irectory" },
            }
        },

        ["<BSLASH>"] = {
            name = "Toggle windows",
            ["<BSLASH>"] = { ":Neotree filesystem reveal left<CR>", "Toggle file explorer in sidebar" },
            ["q"] = { ":TroubleToggle quickfix<CR>", "Toggle [q]uickfix list visibility" },
            ["l"] = { ":TroubleToggle loclist<CR>", "Toggle [l]oc list visibility" },
            ["d"] = { ":TroubleToggle workspace_diagnostics<CR>", "Toggle [d]iagnostic list visibility" },
        },

        ["-"] = { ":Neotree filesystem reveal current<CR>", "Open file explorer in current window" },

        ["<ESC>"] = { clear_search, "Clear search highlights" },

        ["<CR>"] = { "o<ESC>", "Insert a new line" },
    })

for _, direction in pairs({"h", "j", "k", "l"}) do
    local subtbl = { direction = direction }
    local focus_keys = string.gsub("<A-{direction}>", "{(%w+)}", subtbl)
    local focus_cmd = string.gsub("<C-\\><C-n><C-w>{direction}", "{(%w+)}", subtbl)
    -- local move_keys = string.gsub("<A-S-{direction}>", "{(%w+)}", subtbl)
    -- local move_cmd = string.gsub("<C-\\><C-n><C-w><S-{direction}>", "{(%w+)}", subtbl)

    vim.keymap.set("n", focus_keys, focus_cmd)
    -- vim.keymap.set("n", move_keys, move_cmd)
end

vim.keymap.set("n", "<A-S-h>", ":WinShift left<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<A-S-l>", ":WinShift right<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<A-S-j>", ":WinShift down<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<A-S-k>", ":WinShift up<CR>", { noremap = true, silent = true})

vim.keymap.set("c", "%%", [[getcmdtype() == ':' ? expand('%:h').'/' : '%%']], { expr = true })
vim.keymap.set("n", "k", [[(v:count >= 5 ? "m'" . v:count : "") . "k"]], { expr = true, noremap = true })
vim.keymap.set("n", "j", [[(v:count >= 5 ? "m'" . v:count : "") . "j"]], { expr = true, noremap = true })
