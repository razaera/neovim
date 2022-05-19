local export = {}

function spec(package_name)
    ok, value = pcall(require, "packages/" .. package_name)

    if ok then
        return value
    else
        vim.notify(value, "error")
        return {}
    end
end

function all_specs()
    return {
        { "andymass/vim-matchup" },
        { "Julian/vim-textobj-variable-segment" },
        { "kana/vim-textobj-entire" },
        { "kana/vim-textobj-fold" },
        { "kana/vim-textobj-indent" },
        { "kana/vim-textobj-user" },
        { "lewis6991/impatient.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "tpope/vim-characterize" },
        { "tpope/vim-repeat" },
        { "tpope/vim-surround" },

        spec("colorizer"),
        spec("clever-f"),
        spec("gruvbox"),
        spec("neo-tree"),
        spec("notify"),
        spec("packer"),
        spec("polyglot"),
        spec("telescope"),
        spec("which-key"),
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
