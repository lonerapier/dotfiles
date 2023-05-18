return {
  tools = {
    inlay_hints = {
      auto = false,
      show_parameter_hints = false,
      show_type_hints = false,
      show_chain_hints = false,
      --[[ parameter_hints_prefix = "<- ", ]]
      --[[ type_hints_prefix = ": ", ]]
      --[[ other_hints_prefix = " = ", ]]
    },
  },
  settings = {
    ["rust-analyzer"] = {
      completion = {
        postfix = {
          enable = false,
        },
      },
      lens = {
        enable = true,
      },
      checkOnSave = {
        command = "clippy",
      },
      inlayHints = {
        closureReturnTypeHints = {
          enable = true,
        },
        lifetimeElisionHints = {
          enable = true,
          useParameterNames = true,
        },
        bindingModeHints = {
          enable = true,
        },
        maxLength = 100,
      },
    },
  },
}
