local package = {
    "neovim/nvim-lspconfig",
    event = "UIEnter",
    after = {
        "which-key",
    }
}

function package.config()
    -- local lspconfig = require("lspconfig")

    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- -- capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities)
    -- capabilities.textDocument.completion.completionItem.snippetSupport = true

    -- lspconfig.util.default_config = vim.tbl_extend(
    --     "force",
    --     lspconfig.util.default_config,
    --     {
    --         -- on_attach = on_attach,
    --         -- capabilities = capabilities,
    --         -- autostart = false
    --     }
    -- )
end

return package
