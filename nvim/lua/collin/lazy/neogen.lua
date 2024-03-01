return {
    "danymat/neogen",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "L3MON4D3/LuaSnip",
    },
    config = function()
        local neogen = require("neogen")

        neogen.setup({
            snippet_engine = "luasnip"
        })

        vim.keymap.set("n", "<leader>nf", function()
            neogen.generate({ type = "func" })
        end)

        vim.keymap.set("n", "<leader>nt", function()
            neogen.generate({ type = "type" })
        end)
        vim.keymap.set("n", "<leader>nc", function()
            neogen.generate({ type = "class" })
        end)
        vim.keymap.set("n", "<leader>nn", function()
            neogen.generate({ type = "file" })
        end)
    end,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
}
