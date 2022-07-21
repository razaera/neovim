local lspconfig = require("lspconfig")

local on_attach = function(client)
    local which_key = require("which-key")

    which_key.register(
        {
            ["[d"] = { vim.diagnostic.goto_prev, "Go to previous diagnostic" },
            ["]d"] = { vim.diagnostic.goto_next, "Go to next diagnostic" },
        },
        {
            noremap = true,
            silent = true
        }
    )
end

lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    cmd = {"lua-language-server"};
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";")
            },
            completion = {
                keywordSnippet = "Disable"
            },
            diagnostics = {
                enable = true,
                globals = { "vim", "describe", "it", "before_each", "after_each" }
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                },
            },
        },
    },
}

lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGroup = false,
                importEnforceGranularity = true
            },
            -- diagnostics = {
            --     disabled = {
            --         "unresolved-proc-macro"
            --     }
            -- },
            checkOnSave = {
                command = "clippy"
            },
            -- cargo = {
            --     loadOutDirsFromCheck = false
            -- },
            -- procMacro = {
            --     enable = false
            -- },
            -- inlayHints = {
            --     chainingHints = true,
            --     parameterHints = true,
            --     typeHints = true
            -- }
        }
    }
}

lspconfig.solargraph.setup {
    on_attach = on_attach,
    settings = {
        solargraph = {
            diagnostics = true,
            completion = true
        }
    }
}
