-- ~/.config/nvim/lua/plugins/yara.lua
vim.filetype.add({
  extension = {
    yar = "yara",
    yara = "yara",
  },
})

return {
  {
    "s3rvac/vim-syntax-yara",
    ft = "yara",
  },
}
