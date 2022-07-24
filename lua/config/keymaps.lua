local which_key = require("which-key")
local telescope = require("telescope.builtin")

local ns = function(spec)
    which_key.register(spec, { noremap = true, silent = true })
end

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local clear_search = function()
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
        ["[q"] = { ":cprevious<CR>", "Go to the previous quickfix item" },
        ["]q"] = { ":cnext<CR>", "Go to the next quickfix item" },
        ["[Q"] = { ":cfirst<CR>", "Go to the first quickfix item" },
        ["]Q"] = { ":clast<CR>", "Go to the last quickfix item" },
        ["[t"] = { ":tabprev<CR>", "Go to the previous tab" },
        ["]t"] = { ":tabnext<CR>", "Go to the next tab" },

        ["[d"] = { vim.diagnostic.goto_prev, "Go to previous diagnostic" },
        ["]d"] = { vim.diagnostic.goto_next, "Go to next diagnostic" },

        ["<S-h>"] = { ":BufferLineCyclePrev<CR>", "Go to the previous buffer" },
        ["<S-l>"] = { ":BufferLineCycleNext<CR>", "Go to the next buffer" },

        ["gd"] = { vim.lsp.buf.definition, "Go to definition" },
        ["gr"] = { vim.lsp.buf.references, "Go to references" },
        ["K"] = { vim.lsp.buf.hover, "Show hover information" },
        ["<C-k>"] = { vim.lsp.buf.signature_help, "Show signature information" },

        ["<LEADER>a"] = {
            name = "Action",
            a = { vim.lsp.buf.code_action, "LSP code actions" },
            r = { vim.lsp.buf.rename, "Rename symbol under cursor" },
        },

        ["<LEADER>/"] = {
            name = "Search",
            ["/"] = { telescope.live_grep, "Search the workspace" },
            w = { telescope.grep_string, "Search for the word under the cursor" },
        },

        ["<LEADER>f"] = {
            name = "Filesystem",
            f = { telescope.find_files, "Find [f]iles" },
            r = { telescope.oldfiles, "Find a [r]ecently-opened file" },
        },

        ["<LEADER>h"] = {
            name = "Help",
            h = { telescope.help_tags, "Search help pages" },
            k = { telescope.keymaps, "Search key bindings" },
            m = { telescope.man_pages, "Search man pages" },
        },

        ["<LEADER>b"] = {
            name = "Buffers",
            b = { telescope.buffers, "Search buffers" },
            h = { ":BufferLineMovePrev<CR>", "Move current buffer to the left" },
            l = { ":BufferLineMoveNext<CR>", "Move current buffer to the right" },
            q = { ":Bdelete!<CR>", "Delete the current buffer" },
            s = {
                name = "[S]ort",
                e = { ":BufferLineSortByExtension<CR>", "Sort buffers by file [e]xtension" },
                d = { ":BufferLineSortByRelativeDirectory<CR>", "Sort buffers by [d]irectory" },
            }
        },

        -- ["<BSLASH>"] = {
        --     name = "Toggle windows",
        --     ["<BSLASH>"] = { ":Neotree filesystem reveal left<CR>", "Toggle file explorer in sidebar" },
        --     ["q"] = { ":TroubleToggle quickfix<CR>", "Toggle [q]uickfix list visibility" },
        --     ["l"] = { ":TroubleToggle loclist<CR>", "Toggle [l]oc list visibility" },
        --     ["d"] = { ":TroubleToggle workspace_diagnostics<CR>", "Toggle [d]iagnostic list visibility" },
        -- },

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

vim.keymap.set("n", "<A-S-h>", ":WinShift left<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-S-l>", ":WinShift right<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-S-j>", ":WinShift down<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-S-k>", ":WinShift up<CR>", { noremap = true, silent = true })

vim.keymap.set("c", "%%", [[getcmdtype() == ':' ? expand('%:h').'/' : '%%']], { expr = true })
vim.keymap.set("n", "k", [[(v:count >= 5 ? "m'" . v:count : "") . "k"]], { expr = true, noremap = true })
vim.keymap.set("n", "j", [[(v:count >= 5 ? "m'" . v:count : "") . "j"]], { expr = true, noremap = true })
