return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "antosha417/nvim-lsp-file-operations", config = true },
  },

  config = function()
    --------------------------------------------------------------------------
    -- 🧠 Diagnostic UI
    --------------------------------------------------------------------------
    local signs = {
      Error = " ",
      Warn  = " ",
      Hint  = "󰠠 ",
      Info  = " ",
    }
    for type, icon in pairs(signs) do
      vim.fn.sign_define("DiagnosticSign" .. type, { text = icon, texthl = "DiagnosticSign" .. type })
    end

    vim.diagnostic.config {
      virtual_text = true,
      signs = true,
      underline = true,
      severity_sort = true,
      float = { border = "rounded", source = "always" },
    }

    --------------------------------------------------------------------------
    -- 🧩 Capabilities
    --------------------------------------------------------------------------
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok_cmp, cmp = pcall(require, "blink.cmp")
    if ok_cmp then
      capabilities = cmp.get_lsp_capabilities()
    end

    --------------------------------------------------------------------------
    -- 🔗 Common on_attach
    --------------------------------------------------------------------------
    local function on_attach(_, bufnr)
      vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { buffer = bufnr, desc = "Format buffer" })
    end

    --------------------------------------------------------------------------
    -- 🌐 Define LSP configurations (new API)
    --------------------------------------------------------------------------
    local function define(server, opts)
      vim.lsp.config(server, vim.tbl_deep_extend("force", {
        capabilities = capabilities,
        on_attach = on_attach,
      }, opts or {}))
    end

    -- Core servers
    define("html", {})
    define("clangd", {})
    define("tailwindcss", {})
    define("pyright", {})
    define("ts_ls", {})

    -- Emmet
    define("emmet_ls", {
      filetypes = {
        "html", "typescriptreact", "javascriptreact",
        "css", "sass", "scss", "less", "svelte",
      },
    })

    -- Lua
    define("lua_ls", {
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
    })

    --------------------------------------------------------------------------
    -- 🚀 Enable servers (new API)
    --------------------------------------------------------------------------
    for _, server in ipairs({
      "html",
      "clangd",
      "tailwindcss",
      "pyright",
      "ts_ls",
      "emmet_ls",
      "lua_ls",
    }) do
      vim.lsp.enable(server)
    end
  end,
}
