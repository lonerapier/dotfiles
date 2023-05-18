local config = {
  colorscheme = "gruvbox",
  diagnostics = {
    virtual_lines = false,
    virtual_text = false,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = {
          "tohtml",
          "gzip",
          "matchit",
          "zipPlugin",
          "netrwPlugin",
          "tarPlugin",
          "matchparen",
        },
      },
    },
  },
  -- Custom icons
  icons = {
    VimIcon = "",
  },
  polish = function()
    -- Set up notify background color (Fixes warning)
    require("notify").setup {
      background_colour = "#000000",
    }

    require("nvim-treesitter.configs").setup {
      highlight = {
        enable = true,
      },
      rainbow = {
        enable = true,
        extended_mode = true,
      },
    }

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"
  end,
}

return config
