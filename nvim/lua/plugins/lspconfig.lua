return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "folke/neodev.nvim",
  },
  config = function()
    require("neodev").setup {}

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
              update_in_insert = false,
            },
            workspace = {
              library = {
                [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                [vim.fn.stdpath "config" .. "/lua"] = true,
              },
              checkThirdParty = false,
            },
            telemetry = { enabled = false },
          },
        },
      },
      tsserver = {},
      eslint = {},
      pyright = {},
      lemminx = {},
      gradle_ls = {},
      marksman = {},
      html = {},
      emmet_ls = {
        filetypes = { "html", "css", "sass", "scss", "less", "php" },
      },
      cssls = {},
      tailwindcss = {},
      jsonls = {},
      yamlls = {},
    }

    local default_handlers = {
      -- ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
      -- ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local default_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    local opts = { noremap = true, silent = true }
    local on_attach = function(_, bufnr)
      opts.buffer = bufnr
      vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
      vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
      vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
    end

    for name, config in pairs(servers) do
      require("lspconfig")[name].setup {
        capabilities = default_capabilities,
        filetypes = config.filetypes,
        handlers = vim.tbl_deep_extend("force", {}, default_handlers, config.handlers or {}),
        on_attach = on_attach,
        settings = config.settings,
      }
    end

    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- vim.diagnostic.config({
    --   virtual_text = true,
    --   float = {
    --     header = false,
    --     focusable = true,
    --   },
    -- })
  end,
}
