local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
    ensure_installed = { 
        "lua",
        "luadoc",
        "printf",
        "vim",
        "vimdoc",
        "nix",
        "go",
        "rust",
        "gowork",
        "gomod"
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
})
