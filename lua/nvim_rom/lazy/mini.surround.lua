return {
  "nvim-mini/mini.surround",
  config = function()
    require("mini.surround").setup({
      mappings = {
        add = "gs",
        delete = "gD",
        replace = "gR",
        highlight = "gH",
      },
    })
  end,
}

