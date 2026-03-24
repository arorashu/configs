return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      commands = {
        popup_command_help = {
          winopts = {
            winblend = 0,  -- Makes popup fully opaque
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
          },
        },
      },
    },
  },
}
