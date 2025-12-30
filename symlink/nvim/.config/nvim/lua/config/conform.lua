local conform = require "conform"

conform.setup {
    formatters_by_ft = {
        lua = { "stylua" },
        css = { "prettier" },
        html = { "prettier" },
        go = { "goimports" },
        python = { "black" },
        vue = { "prettier" },
        htmldjango = { "djlint" },
        -- nix = { "nixfmt" },
        c = { "clang-format" },
        zig = { "zls" },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 1000,
        lsp_fallback = true,
    },
}
