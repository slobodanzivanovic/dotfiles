return {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        "onsails/lspkind.nvim",
    },
    config = function()
        local cmp = require "cmp"
        local cmp_autopairs = require "nvim-autopairs.completion.cmp"
        local luasnip = require "luasnip"
        local lspkind = require "lspkind"

        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            -- window = {
            --   completion = cmp.config.window.bordered(),
            --   documentation = cmp.config.window.bordered(),
            -- },
            mapping = cmp.mapping.preset.insert {
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-Space>"] = cmp.mapping.complete {},
                ["<C-c>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
            },
            sources = cmp.config.sources {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
                { name = "buffer" },
            },
            formatting = {
                expandable_indicator = true,
                format = lspkind.cmp_format {
                    mode = "symbol_text",
                    maxwidth = 50,
                    ellipsis_char = "...",
                },
            },
            -- experimental = {
            --   ghost_text = true,
            -- },
        }
    end,
}
