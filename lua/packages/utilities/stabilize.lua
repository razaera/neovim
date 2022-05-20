local package = {
    "luukvbaal/stabilize.nvim",
    event = "UIEnter",
}

function package.config()
    require("stabilize").setup()
end

return package
