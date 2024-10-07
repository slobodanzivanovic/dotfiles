return {
    "uiiaoo/java-syntax.vim",
    config = function()
        vim.cmd([[highlight link javaIdentifier NONE]])
        vim.cmd([[highlight link javaDelimiter NONE]])
    end,
}
