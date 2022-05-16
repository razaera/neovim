local export = {}

function export.init()
    local modules = { "keymaps", "options" }

    for index, module_name in ipairs(modules) do
        ok, value = pcall(require, "config/" .. module_name)

        if ok then
            modules[module_name] = value
        else
            return error(value)
        end
    end
end

function export.reload()
    local plenary = require("plenary")

    ok, value = pcall(plenary.reload.reload_module, "config")

    if not ok then
        return error("Failed to reload config: " .. value)
    end

    export.init()
end

return export
