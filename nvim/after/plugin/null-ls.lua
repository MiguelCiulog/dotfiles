require("null-ls").setup({
    sources = {
        -- Shortens lines
        require("null-ls").builtins.formatting.golines,
        -- require("null-ls").null_ls.builtins.formatting.gofmt,

        -- require("null-ls").builtins.diagnostics.mypy.with({
        --     extra_args = {
        --         "--ignore-missing-imports",
        --         "--follow-imports=skip",
        --         "--strict-optional",
        --     }
        -- }),
        -- require("null-ls").builtins.diagnostics.ruff,
        require("null-ls").builtins.formatting.isort,
        require("null-ls").builtins.formatting.black,
        require("null-ls").builtins.completion.luasnip,
        require("null-ls").builtins.code_actions.gitsigns,
        require("null-ls").builtins.formatting.stylua,
    },
})

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end
