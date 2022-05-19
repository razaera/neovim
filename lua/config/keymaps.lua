local which_key = require("which-key")

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

    ["<BSLASH>q"] = { ":call QuickFixToggle()<CR>", "Toggle quickfix list visibility" },

    ["<ESC>"] = { clear_search, "Clear search highlights" },

    ["<CR>"] = { "o<ESC>", "Insert a new line" },
})

for _, direction in pairs({"h", "j", "k", "l"}) do
    local subtbl = { direction = direction }
    local focus_keys = string.gsub("<A-{direction}>", "{(%w+)}", subtbl)
    local focus_cmd = string.gsub("<C-\\><C-n><C-w>{direction}", "{(%w+)}", subtbl)
    local move_keys = string.gsub("<A-S-{direction}>", "{(%w+)}", subtbl)
    local move_cmd = string.gsub("<C-\\><C-n><C-w><S-{direction}>", "{(%w+)}", subtbl)

    vim.keymap.set("n", focus_keys, focus_cmd)
    vim.keymap.set("n", move_keys, move_cmd)
end

vim.keymap.set("c", "%%", [[getcmdtype() == ':' ? expand('%:h').'/' : '%%']], { expr = true })
vim.keymap.set("n", "k", [[(v:count >= 5 ? "m'" . v:count : "") . "k"]], { expr = true, noremap = true })
vim.keymap.set("n", "j", [[(v:count >= 5 ? "m'" . v:count : "") . "j"]], { expr = true, noremap = true })
