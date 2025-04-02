return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local keymap = vim.keymap

    -- Set diagnostic signs
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      if client.server_capabilities.referencesProvider then
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
      end
      if client.server_capabilities.declarationProvider then
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      end
      if client.server_capabilities.definitionProvider then
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
      end
      if client.server_capabilities.implementationProvider then
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
      end

      keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      keymap.set("n", "K", vim.lsp.buf.hover, opts)
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
    end

    -- LSP Servers Setup
    local servers = {
      "html",
      "clangd",
      "tailwindcss",
      "emmet_ls",
      "pyright",
      "ts_ls",
      "lua_ls",
    }

    for _, server in ipairs(servers) do
      lspconfig[server].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end

    -- Special case for Emmet LSP
    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })

    -- Special case for Lua LSP
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}
