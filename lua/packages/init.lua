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
        { "lewis6991/impatient.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "sheerun/vim-polyglot" },
        { "folke/lsp-colors.nvim" },

        spec("packer"),
        spec("notify"),
        spec("which-key"),
        spec("neo-tree"),
        spec("gruvbox"),
        spec("colorizer"),
    }
end

function export.init()
    local packages = require("packages")
    local packer = require("packer")

    ok, value = pcall(packer.startup, { all_specs() })

    if not ok then
        return error("Failed to init packer: " .. value)
    end
end

function export.reload()
    local packer = require("packer")
    local plenary = require("plenary")

    ok, value = pcall(plenary.reload.reload_module, "packages")

    if not ok then
        return error("Failed to reload packages: " .. value)
    end

    ok, value = pcall(export.init)

    if not ok then
        return error("Failed to init packages: " .. value)
    end

    ok, value = pcall(packer.compile)

    if not ok then
        return error("Failed to compile packer: " .. value)
    end
end

return export
