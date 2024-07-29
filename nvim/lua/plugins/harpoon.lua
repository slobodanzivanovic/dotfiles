return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = true,
    keys = {
        { "<leader>ho", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>" },
        { "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>" },
        { "<leader>hr", "<cmd>lua require('harpoon.mark').rm_file()<CR>" },
        { "<leader>hc", "<cmd>lua require('harpoon.mark').clear_all()<CR>" },
        { "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>" },
        { "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>" },
        { "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>" },
        { "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>" },
        { "<leader>5", "<cmd>lua require('harpoon.ui').nav_file(5)<CR>" },
    },
}
