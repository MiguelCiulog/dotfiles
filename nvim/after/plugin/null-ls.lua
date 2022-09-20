require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.formatting.prettier,
        require("null-ls").builtins.formatting.fixjson,
        -- require("null-ls").null_ls.builtins.formatting.gofmt,
        -- Shortens lines
        require("null-ls").builtins.formatting.golines,
        require("null-ls").builtins.formatting.autopep8,
        require("null-ls").builtins.completion.luasnip
    },
})
