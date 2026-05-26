vim.g.mapleader = " "

local o = vim.opt

o.termguicolors = true
o.number = true
o.relativenumber = true
o.signcolumn = "yes"
o.clipboard = "unnamedplus"
o.cursorline = true
o.scrolloff = 999

o.ignorecase = true

vim.cmd("colorscheme habamax")

vim.pack.add({
    "https://github.com/saghen/blink.cmp",
    "https://github.com/saghen/blink.lib", -- DEPENDENCY
})

vim.lsp.config["lua_ls"] = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    settings = {
        Lua = {
            diagnostics = { globals = "vim" },
            workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME }
            },
            telemetry = { enable = false }
        }
    }
}
vim.lsp.enable({
    "lua_ls"
})
vim.diagnostic.config({
    virtual_text = true
})
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map("n", "K", vim.lsp.buf.hover, "LSP hover")
        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        map("n", "gr", vim.lsp.buf.references, "References")
        map("n", "gR", vim.lsp.buf.rename, "Rename symbol")
        map("n", "gl", vim.diagnostic.open_float, "Open diagnostics on current line")
        map("n", "<Leader>f", vim.lsp.buf.format, "Run LSP formatter")
    end
})

local cmp = require("blink.cmp")
cmp.build():wait(60000)
cmp.setup({
    keymap = {
        preset = "default",
        ["<Cr>"] = { "select_and_accept" }
    }
})
