vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "*.html", "*.jsx", "*.tsx", "*.css", "*.scss" }, -- Replace with the desired filetypes
    callback = function()
        local buf_clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
        for _, client in ipairs(buf_clients) do
            if client.name == "tailwindcss" then
                vim.cmd("TailwindSort")
                return
            end
        end
    end,
    desc = "Automatically sort Tailwind classes on save, if Tailwind LSP is active",
})

return {
    "luckasRanarison/tailwind-tools.nvim",
    event = "VeryLazy",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim", -- optional
        "neovim/nvim-lspconfig",         -- optional
    },
    opts = {},                           -- your configuration
    config = function()
        local tailwind = require("tailwind-tools")
        tailwind.setup({
            -- your configuration
        })
    end,
}
