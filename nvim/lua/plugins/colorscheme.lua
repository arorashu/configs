return {
  { "ellisonleao/gruvbox.nvim" },
  { "polirritmico/monokai-nightasty.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup({
        filter = "pro",
        transparent_background = false,
        terminal_colors = true,
        styles = {
          comment = { italic = true },
          keyword = { italic = true },
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "gruvbox" },
    -- opts = { colorscheme = "monokai-pro" },
    -- opts = { colorscheme = "rose-pine" },
  },
}
