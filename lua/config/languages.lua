local lspconfig = require("lspconfig")

lspconfig.sumneko_lua.setup {
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
    settings = {
        solargraph = {
            diagnostics = true,
            completion = true
        }
    }
}
