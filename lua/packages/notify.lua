local package = { "rcarriga/nvim-notify" }

function package.config()
    vim.notify = require("notify")
end

return package
