local export = {}

function spec(package_name, options)
    ok, value = pcall(require, "packages/" .. package_name)

    if ok then
        return vim.tbl_extend("force", value, options or {})
    else
        vim.notify(value, "error")
        return {}
    end
end

function all_specs()
    return {
        { "lewis6991/impatient.nvim" },
        { "nvim-lua/plenary.nvim" },

        spec("colorschemes/edge", { as = "colorscheme" }),
        spec("colorschemes/gruvbox", { disable = true }),

        spec("bufdelete"),
        spec("bufferline"),
        spec("characterize"),
        spec("clever-f"),
        spec("colorizer"),
        spec("comment"),
        spec("dressing"),
        spec("gitsigns", { as = "vcs" }),
        spec("lualine", { as = "statusline" }),
        spec("matchup"),
        spec("neo-tree"),
        spec("notify"),
        spec("packer"),
        spec("polyglot"),
        spec("repeat"),
        spec("surround"),
        spec("telescope"),
        spec("textobj-entire"),
        spec("textobj-fold"),
        spec("textobj-indent"),
        spec("textobj-segment"),
        spec("trouble"),
        spec("which-key", { as = "which-key" }),
        spec("winshift"),
    }
end

function export.init(should_sync)
    ok, value = pcall(require, "packer")

    if not ok then
        return error("Failed to load packer: " .. value)
    end

    local packer = value

    ok, value = pcall(packer.startup, { all_specs() })

    if not ok then
        return error("Failed to init packer: " .. value)
    end

    if should_sync then
        packer.sync()
    end
end

function export.reload()
    local packer = require("packer")
    local plenary = require("plenary")

    ok, value = pcall(plenary.reload.reload_module, "packages")

    if not ok then
        return error("Failed to reload packages: " .. value)
    end

    ok, value = pcall(export.init, false)

    if not ok then
        return error("Failed to init packages: " .. value)
    end

    ok, value = pcall(packer.compile)

    if not ok then
        return error("Failed to compile packer: " .. value)
    end
end

return export
