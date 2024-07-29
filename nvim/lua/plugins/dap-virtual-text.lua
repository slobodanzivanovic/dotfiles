return {
    "theHamsta/nvim-dap-virtual-text",
    lazy = true,
    opts = {
        commented = true,
        display_callback = function(variable, buf, stackframe, node, options)
            if options.virt_text_pos == "inline" then
                return " = " .. variable.value
            else
                return variable.name .. " = " .. variable.value
            end
        end,
    },
}
