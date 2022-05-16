local ne = { noremap = true, expr = true }
local ns = { noremap = true, silent = true }
local e = { expr = true }

function map(mode, keys, procedure, opts)
    vim.keymap.set(mode, keys, procedure, ns)
end

function nmap(keys, procedure, opts)
    map("n", keys, procedure, opts)
end

function cmap(keys, procedure, opts)
    map("c", keys, procedure, opts)
end

for _, direction in pairs({"h", "j", "k", "l"}) do
    local subtbl = { direction = direction }
    local focus_keys = string.gsub("<A-{direction}>", "{(%w+)}", subtbl)
    local focus_cmd = string.gsub("<C-\\><C-n><C-w>{direction}", "{(%w+)}", subtbl)
    -- local move_keys = string.gsub("<A-S-{direction}>", "{(%w+)}", subtbl)
    -- local move_cmd = string.gsub("<C-\\><C-n><C-w><S-{direction}>", "{(%w+)}", subtbl)

    nmap(focus_keys, focus_cmd, ns)
end

--  nmap("k", [[(v:count >= 10 ? "m'" . v:count : "") . "k"]], ne)
--  nmap("j", [[(v:count >= 10 ? "m'" . v:count : "") . "j"]], ne)

nmap("J", "mzJ`z", ns)

nmap("n", "nzzzv", ns)
nmap("N", "Nzzzv", ns)

nmap("<CR>", "o<ESC>", ns)

function expand_cwd()
    if vim.fn.getcmdtype() == ":" then
        return vim.fn.expand("%:h") .. "/"
    else
        return "%%"
    end
end

-- cmap("%%", expand_cwd, e)
-- vim.keymap.set("c", "%%", "getcmdtype() == ':' ? expand('%:h').'/' : '%%'", { expr = true })
