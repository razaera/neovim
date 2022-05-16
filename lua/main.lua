local export = {}

function reload()
    local config = require("config")
    local packages = require("packages")

    ok, value = pcall(packages.reload)

    if not ok then
        vim.notify(value, "error")
        return
    end

    ok, value = pcall(config.reload)

    if not ok then
        vim.notify(value, "error")
        return
    end

    vim.notify("Config reloaded")
end

function export.init()
    local config = require("config")
    local packages = require("packages")

    ok, value = pcall(packages.init)

    if not ok then
        vim.notify(value, "error")
        return
    end

    ok, value = pcall(config.init)

    if not ok then
        vim.notify(value, "error")
        return
    end

    vim.api.nvim_create_augroup("CONFIG_RELOAD", { clear = true })

    vim.api.nvim_create_autocmd("BufWritePost", {
            group = "CONFIG_RELOAD",
            pattern = { "*.lua" },
            callback = reload
        })
end

return export
