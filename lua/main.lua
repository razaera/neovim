local export = {}

local packer_install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_repo_path = "https://github.com/wbthomason/packer.nvim"

function bootstrap()
    vim.notify("Bootstrapping packages")
    vim.fn.system({ "git", "clone", "--depth", "1", packer_repo_path, packer_install_path })
    vim.cmd("packloadall")
end

function reload()
    local config = require("config")
    local packages = require("packages")

    ok, value = pcall(packages.reload)

    if not ok then
        vim.notify(value, "error")
    end

    ok, value = pcall(config.reload)

    if not ok then
        vim.notify(value, "error")
    end

    vim.notify("Config reloaded")
end

function export.init()
    local bootstrapping = vim.fn.empty(vim.fn.glob(packer_install_path)) > 0
    if bootstrapping then bootstrap() end

    local config = require("config")
    local packages = require("packages")

    ok, value = pcall(packages.init, bootstrapping)

    if not ok then
        vim.notify(value, "error")
    end

    ok, value = pcall(config.init)

    if not ok then
        vim.notify(value, "error")
    end

    vim.api.nvim_create_augroup("CONFIG_RELOAD", { clear = true })

    vim.api.nvim_create_autocmd("BufWritePost", {
            group = "CONFIG_RELOAD",
            pattern = { "*.lua" },
            callback = reload
        })
end

return export
