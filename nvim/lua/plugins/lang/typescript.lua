return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "typescript", "tsx" })
      end
    end,
  },
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   opts = {
  --     settings = {
  --       expose_as_code_action = "all",
  --       -- tsserver_file_preferences = {
  --       --   includeInlayParameterNameHints = "literals",
  --       --   includeInlayFunctionParameterTypeHints = true,
  --       --   includeInlayVariableTypeHints = false,
  --       --   includeInlayPropertyDeclarationTypeHints = false,
  --       --   includeInlayFunctionLikeReturnTypeHints = true,
  --       --   includeInlayEnumMemberValueHints = false,
  --       --   includeCompletionsForModuleExports = true,
  --       --   importModuleSpecifierEnding = "minimal",
  --       --   quotePreference = "single",
  --       -- },
  --       -- tsserver_format_preferences = {
  --       --   semicolons = "remove",
  --       --   insertSpaceBeforeFunctionParenthesis = true,
  --       -- },
  --       complete_function_calls = true,
  --     },
  --   },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     {
  --       "neovim/nvim-lspconfig",
  --       opts = {
  --         -- make sure mason installs the server
  --         servers = {
  --           tsserver = {
  --             enabled = false,
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     -- make sure mason installs the server
  --     servers = {
  --       ---@type lspconfig.options.tsserver
  --       tsserver = {
  --         ---@diagnostic disable-next-line: missing-fields
  --         settings = {
  --           completions = {
  --             completeFunctionCalls = true,
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "js-debug-adapter")
      table.insert(opts.ensure_installed, "vtsls")
    end,
  },
}
