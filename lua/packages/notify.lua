local package = {
    "rcarriga/nvim-notify",
    after = "colorscheme",
}

function package.config()
    vim.notify = require("notify")
end

return package
