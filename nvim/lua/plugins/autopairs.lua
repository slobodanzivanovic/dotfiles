return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        local Rule = require "nvim-autopairs.rule"

        require("nvim-autopairs").setup {
            check_ts = true,
            ts_config = {
                lua = { "string" },
                javascript = { "template_string" },
                java = false,
            },
        }

        local ts_conds = require "nvim-autopairs.ts-conds"

        require("nvim-autopairs").add_rules {
            Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node { "string", "comment" }),
            Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node { "function" }),
        }
    end,
}
