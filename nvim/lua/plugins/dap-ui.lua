return {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
        "mfussenegger/nvim-dap",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim",
        "nvim-neotest/nvim-nio",
    },
    opts = {
        controls = {
            element = "repl",
            enabled = false,
            icons = {
                disconnect = "",
                pause = "",
                play = "",
                run_last = "",
                step_back = "",
                step_into = "",
                step_out = "",
                step_over = "",
                terminate = "",
            },
        },
        element_mappings = {},
        expand_lines = true,
        floating = {
            border = "single",
            mappings = {
                close = { "q", "<Esc>" },
            },
        },
        force_buffers = true,
        icons = {
            collapsed = "",
            current_frame = "",
            expanded = "",
        },
        layouts = {
            {
                elements = {
                    {
                        id = "scopes",
                        size = 0.50,
                    },
                    {
                        id = "stacks",
                        size = 0.30,
                    },
                    {
                        id = "watches",
                        size = 0.10,
                    },
                    {
                        id = "breakpoints",
                        size = 0.10,
                    },
                },
                size = 40,
                position = "left",
            },
            {
                elements = {
                    "repl",
                    "console",
                },
                size = 10,
                position = "bottom",
            },
        },
        mappings = {
            edit = "e",
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            repl = "r",
            toggle = "t",
        },
        render = {
            indent = 1,
            max_value_lines = 100,
        },
    },
    config = function(_, opts)
        local dap = require "dap"

        vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "DapBreakpoint", numhl = "DapBreakpoint" })
        vim.api.nvim_set_hl(0, "DapBreakpoint", {
            fg = "#ff0000",
        })

        require("dapui").setup(opts)

        dap.listeners.after.event_initialized["dapui_config"] = function()
            require("dapui").open()
        end

        dap.listeners.before.event_terminated["dapui_config"] = function()
            -- require('dapui').close()
        end

        dap.listeners.before.event_exited["dapui_config"] = function()
            -- require('dapui').close()
        end

        dap.configurations.java = {
            {
                name = "Debug Launch (2GB)",
                type = "java",
                request = "launch",
                vmArgs = "" .. "-Xmx2g ",
            },
            {
                name = "Debug Attach (8000)",
                type = "java",
                request = "attach",
                hostName = "127.0.0.1",
                port = 8000,
            },
            {
                name = "Debug Attach (5005)",
                type = "java",
                request = "attach",
                hostName = "127.0.0.1",
                port = 5005,
            },
        }
    end,
}
