return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = vim.tbl_extend("force", opts.options, {
        icons_enabled = false,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
      })
    end,
  },
}
