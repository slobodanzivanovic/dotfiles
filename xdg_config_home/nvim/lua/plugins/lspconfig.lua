return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(_)
                local opts = { buffer = _.buf, silent = true }

                vim.keymap.set("n", "gR", "<cmdTelescope lsp_references<CR>", opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
                vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
                vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
                vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)
                vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
            end,
        })

        local capabilities = cmp_nvim_lsp.default_capabilities()

        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        local exclude_servers = {
            "jdtls",
        }

        mason_lspconfig.setup_handlers({
            function(server_name)
                if not vim.tbl_contains(exclude_servers, server_name) then
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end
            end,
            ["lua_ls"] = function()
                lspconfig["lua_ls"].setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                                update_in_insert = false,
                            },
                            workspace = {
                                library = {
                                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                    [vim.fn.stdpath("config") .. "/lua"] = true,
                                },
                                checkThirdParty = false,
                            },
                            telemetry = { enabled = false },
                        },
                    },
                })
            end,
            ["emmet_ls"] = function()
                lspconfig["emmet_ls"].setup({
                    capabilities = capabilities,
                    filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "php" },
                })
            end,
        })
    end,
}
