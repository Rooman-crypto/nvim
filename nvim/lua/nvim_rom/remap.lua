  vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlights text when yanking",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
--Vscode maps
vim.keymap.set({ "i", "c" }, "jj", "<Esc>", { noremap = true, silent = true })

--vim.keymap.set("n", "<C>n", ":nohlsearch<CR>", opts)
--vim.keymap.set("n", "K", "O<Esc>", opts)

--vim.keymap.set("n", "J", "o<Esc>", opts)
vim.keymap.set({ "n", "i" }, "<C-s>", "<Cmd>w<CR>", opts)
