return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "sontungexpt/better-diagnostic-virtual-text", -- diagnostics
  },
  config = function()
    -- 1️⃣ Capabilities for nvim-cmp
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    -- 2️⃣ Mason setup
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "pyright",   -- Python
        "lua_ls",    -- Lua
        "clangd",    -- C / C++
      },
    })

    -- 3️⃣ Helper: common on_attach function
    local on_attach = function(client, bufnr)
      -- Better diagnostic virtual text
      require("better-diagnostic-virtual-text.api").setup_buf(bufnr, {
        virtual_text = true,
        ui = {
          arrow = "→",
          above = false,
        },
      })

      -- LSP keymaps
      local opts = { buffer = bufnr, noremap = true, silent = true }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    end

    -- 4️⃣ Setup servers
    local servers = {
      pyright = { capabilities = capabilities },
      lua_ls = {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      },
      clangd = { capabilities = capabilities },
    }

    for server, config in pairs(servers) do
      vim.lsp.config(server, vim.tbl_extend("force", config, { on_attach = on_attach }))
      vim.lsp.enable(server)
    end
  end,
}

