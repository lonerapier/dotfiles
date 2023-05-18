return {
  {
    "petertriho/nvim-scrollbar",
    -- lazy = false,
    event = "BufEnter",
    config = function() require("scrollbar").setup() end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    -- lazy = false,
    event = "CmdlineEnter",
    config = function() require("hlslens").setup() end,
  },
  -- lsp_lines (pretty diagnostics)
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    lazy = false,
    dependencies = { "mason-lspconfig.nvim" },
    module = "lsp_lines",
    config = function() require("lsp_lines").setup() end,
  },
  { "gpanders/editorconfig.nvim",    lazy = false },
  {
    "simrat39/rust-tools.nvim",
    ft = { "rs", "toml" },
  },
  { "simrat39/symbols-outline.nvim", event = { "BufRead" } },
  {
    "saecki/crates.nvim",
    -- tag = "v0.3.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("crates").setup() end,
    event = { "BufEnter Cargo.toml" },
  },
  { "p00f/nvim-ts-rainbow",   lazy = false },
  { "nullchilly/fsread.nvim", lazy = false },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup {
        lsp_inlay_hints = {
          enable = false,
        },
      }
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  { "folke/tokyonight.nvim" },
  { "embark-theme/vim",                name = "embark" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "jacoborus/tender.vim" },
  { "savq/melange" },
  { "sainnhe/sonokai" },
  { "sainnhe/everforest" },
  { "rose-pine/neovim" },
  { "ellisonleao/gruvbox.nvim" },
  -- Catppuccin
  {
    "catppuccin/nvim",
    lazy = false,
    -- opt = false,
    name = "catppuccin",
    config = function()
      -- latte, frappe, macchiato, mocha
      -- vim.g.catppuccin_flavour = "mocha"
      -- local colors = require("catppuccin.palettes").get_palette()
      require("catppuccin").setup {
        -- transparent_background = true,
        term_colors = true,
        styles = {
          comments = { "italic" },
          functions = { "italic", "bold" },
          keywords = { "italic" },
        },
      }
    end,
  },
}
