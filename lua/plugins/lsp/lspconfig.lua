return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")

    -- 󰒓 Diagnostic signs
    local signs = {
      Error = " ",
      Warn  = " ",
      Hint  = "󰠠 ",
      Info  = " ",
    }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config {
      virtual_text = true,
      signs = true,
      underline = true,
      severity_sort = true,
      float = {
        border = "rounded",
        source = "always",
      },
    }

    -- LSP capabilities (with optional cmp support)
    local ok_cmp, cmp = pcall(require, "blink.cmp") -- fallback to your module
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    if ok_cmp then
      capabilities = cmp.get_lsp_capabilities()
    end

    -- Common on_attach (extend with keymaps/format later)
    local function on_attach(_, bufnr)
      -- Example: keymap for formatting
      vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { buffer = bufnr, desc = "Format buffer" })
    end

    -- Define language servers and basic config
    local servers = {
      html         = {},
      clangd       = {},
      tailwindcss  = {},
      pyright      = {},
      ts_ls     = {},
    }

    for server, opts in pairs(servers) do
      lspconfig[server].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = opts.settings,
      }
    end

    -- Emmet LSP (special)
    lspconfig["emmet_ls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = {
        "html", "typescriptreact", "javascriptreact",
        "css", "sass", "scss", "less", "svelte"
      },
    }

    -- Lua LSP (special)
    lspconfig["lua_ls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = {
            checkThirdParty = false,
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
          telemetry = { enable = false },
        },
      },
    }
  end,
}
