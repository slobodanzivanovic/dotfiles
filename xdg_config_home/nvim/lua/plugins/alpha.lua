return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.startify")

        dashboard.section.header.val = {
            [[  ██▒   █▓ ██▓ ███▄ ▄███▓ ]],
            [[ ▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ]],
            [[  ▓██  █▒░▒██▒▓██    ▓██░ ]],
            [[   ▒██ █░░░██░▒██    ▒██  ]],
            [[    ▒▀█░  ░██░▒██▒   ░██▒ ]],
            [[    ░ ▐░  ░▓  ░ ▒░   ░  ░ ]],
            [[    ░ ░░   ▒ ░░  ░      ░ ]],
            [[      ░░   ▒ ░░      ░    ]],
            [[       ░   ░         ░    ]],
            [[      ░                   ]],
        }

        alpha.setup(dashboard.opts)

        vim.cmd([[
            autocmd FileType alpha setlocal nofoldenable
            autocmd FileType alpha set laststatus=0
            autocmd BufUnload <buffer> set laststatus=2
        ]])
    end,
}
