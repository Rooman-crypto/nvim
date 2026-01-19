return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",           -- This is the key – forces the old, compatible version
  version = false,             -- don't use tagged releases (they're outdated)
  lazy = false,                -- load immediately (recommended for treesitter)
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "vim", "vimdoc", "query", "python", "c", "cpp", "rust" }, -- ← add/remove as needed
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      -- Add any other old modules you used (e.g. incremental_selection, textobjects…)
      -- incremental_selection = { enable = true, ... },
    })
  end,
}
