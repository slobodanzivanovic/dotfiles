return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                "eslint",
                "pyright",
                "jdtls",
                "lemminx",
                "gradle_ls",
                "marksman",
                "html",
                "emmet_ls",
                "cssls",
                "tailwindcss",
                "jsonls",
                "yamlls",
            },
            automatic_installation = true,
        })

        require("mason-tool-installer").setup({
            ensure_installed = {
                "java-debug-adapter",
                "java-test",
                "prettier",
                "stylua",
                "isort",
                "black",
                "flake8",
            },
        })
    end,
}
