return {
  "zbirenbaum/copilot.lua",
  dependencies = { "zbirenbaum/copilot-cmp" },
  event = { "VimEnter" },
  config = function()
    require("copilot").setup {
      cmp = {
        enabled = true,
        method = "getCompletionsCycling",
      },
      panel = {
        -- no config options yet
        enabled = true,
        auto_refresh = true,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>",
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 50,
        keymap = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      ft_disable = { "yaml", "json", "toml" },
    }
  end,
}
