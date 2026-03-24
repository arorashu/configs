-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Make floating windows more visible
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1f2335", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1f2335", fg = "#ffffff" })

-- vim.g.root_spec = { "cwd" }

-- Disable autoformat globally
vim.g.autoformat = false
vim.g.root_spec = { ".git", "pyproject.toml", "setup.py", "requirements.txt" }

-- Auto-reload files when changed outside Neovim
vim.opt.autoread = true

-- Use normal line numbers instead of relative
vim.opt.relativenumber = false

-- line number is enough to locate cursor; cursorline causes redraw jank over SSH
vim.opt.cursorline = false

-- Disable animations for better performance
vim.g.snacks_animate = false

-- only redraw screen after a command finishes, not during (faster macros, less flicker)
vim.o.lazyredraw = true

-- Python LSP: pyright (via Mason + LazyVim python extra)
vim.g.lazyvim_python_lsp = "pyright"
vim.opt.updatetime = 100
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 10

-- SSH-specific tweaks
if os.getenv("SSH_TTY") then
  vim.o.synmaxcol = 500         -- skip syntax highlight on very long lines

  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
end
