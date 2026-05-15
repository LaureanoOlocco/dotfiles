-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
vim.env.PATH = "/usr/bin:/usr/local/bin:" .. vim.env.PATH
vim.opt.number = true
vim.opt.relativenumber = false

vim.keymap.set("n", "<leader>/", function()
  vim.cmd("nohlsearch")
  vim.cmd("Noice dismiss")
  vim.fn.setreg("/", "")

end, { desc = "Clear search completely" })
