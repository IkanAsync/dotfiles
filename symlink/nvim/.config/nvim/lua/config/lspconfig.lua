local M = {}
local map = vim.keymap.set

M.on_attach = function(_, bufnr)
    local function opts(desc)
        return { buffer = bufnr, desc = "LSP " .. desc }
    end

    map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
    map("n", "gd", ":Telescope lsp_definitions<CR>", opts "Go to definition")
    map("n", "gi", ":Telescope lsp_implementations<CR>", opts "Go to implementation")
    map("n", "grr", ":Telescope lsp_references<CR>", opts "Go to _references")

    map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
    map("n", "<leader>cr", vim.lsp.buf.rename, opts "Rename")
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts "Code Action")
end -- disable semanticTokens
M.on_init = function(client, _)
    if vim.fn.has "nvim-0.11" ~= 1 then
        if client.supports_method "textDocument/semanticTokens" then
            client.server_capabilities.semanticTokensProvider = nil
        end
    else
        if client:supports_method "textDocument/semanticTokens" then
            client.server_capabilities.semanticTokensProvider = nil
        end
    end
end

M.capabilities = require("blink.cmp").get_lsp_capabilities()

M.capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

M.defaults = function()
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            M.on_attach(_, args.buf)
        end,
    })

    vim.diagnostic.config {
        severity_sort = true,
        float = { border = "rounded", source = "if_many" },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = "󰅚 ",
                [vim.diagnostic.severity.WARN] = "󰀪 ",
                [vim.diagnostic.severity.INFO] = "󰋽 ",
                [vim.diagnostic.severity.HINT] = "󰌶 ",
            },
        } or {},
        virtual_text = {
            source = "if_many",
            spacing = 2,
            format = function(diagnostic)
                local diagnostic_message = {
                    [vim.diagnostic.severity.ERROR] = diagnostic.message,
                    [vim.diagnostic.severity.WARN] = diagnostic.message,
                    [vim.diagnostic.severity.INFO] = diagnostic.message,
                    [vim.diagnostic.severity.HINT] = diagnostic.message,
                }
                return diagnostic_message[diagnostic.severity]
            end,
        },
    }

    local lua_lsp_settings = {
        cmd = { "/usr/bin/lua-language-server" },
        Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
                library = {
                    vim.fn.expand "$VIMRUNTIME/lua",
                    vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
                    "${3rd}/luv/library",
                },
            },
        },
    }

    vim.lsp.config("*", { capabilities = M.capabilities, on_init = M.on_init })
    vim.lsp.config("lua_ls", { settings = lua_lsp_settings })
    vim.lsp.enable "lua_ls"

    local servers = {
        "gopls",
        "basedpyright",
        "html",
        "cssls",
        "emmet_language_server",
        "zls",
        "clangd",
    }

    -- config lsp

    -- golang
    vim.lsp.config("gopls", {
        settings = {
            gopls = {
                gofumpt = true,
                hints = {
                    assignVariableTypes = true,
                    compositeLiteralFields = true,
                    compositeLiteralTypes = true,
                    constantValues = true,
                    functionTypeParameters = true,
                    parameterNames = true,
                    rangeVariableTypes = true,
                },
            },
        },
    })

    -- emmet
    vim.lsp.config("emmet_language_server", {
        filetypes = {
            "css",
            "eruby",
            "html",
            "javascript",
            "javascriptreact",
            "less",
            "sass",
            "scss",
            "pug",
            "typescriptreact",
        },
        init_options = {
            ---@type table<string, string>
            includeLanguages = {},
            --- @type string[]
            excludeLanguages = {},
            --- @type string[]
            extensionsPath = {},
            --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
            preferences = {},
            --- @type boolean Defaults to `true`
            showAbbreviationSuggestions = true,
            --- @type "always" | "never" Defaults to `"always"`
            showExpandedAbbreviation = "always",
            provideCloseTag = false,
            --- @type boolean Defaults to `false`
            showSuggestionsAsSnippets = false,
            --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
            syntaxProfiles = {
                html = {
                    inline_break = 1,
                },
            },
            --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
            variables = {},
        },
    })

    -- python
    vim.lsp.config("basedpyright", {
        settings = {
            basedpyright = {
                analysis = {
                    typeCheckingMode = "basic",
                    autoImportCompletions = true,
                    diagnosticSeverityOverrides = {
                        reportUnusedImport = "information",
                        reportUnusedFunction = "information",
                        reportUnusedVariable = "information",
                        reportGeneralTypeIssues = "none",
                        reportOptionalMemberAccess = "none",
                        reportOptionalSubscript = "none",
                        reportPrivateImportUsage = "none",
                    },
                },
            },
        },
    })

    -- nix
    vim.lsp.config("nixd", {
        settings = {
            cmd = { "nixd" },
        },
    })
    vim.lsp.enable "nixd"

    vim.lsp.enable(servers)

    -- simpan diakhir agar tidak bentrok dengan enable lsp
    local fmt = require("conform").formatters_by_ft
    for _, arr in pairs(fmt) do
        for _, name in ipairs(arr) do
            table.insert(servers, name)
        end
    end

    require("mason-tool-installer").setup { ensure_installed = servers }
end

return M
