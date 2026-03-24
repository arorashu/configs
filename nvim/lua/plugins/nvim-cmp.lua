return {
  -- Disable friendly-snippets (the source of all snippet expansions)
  {
    "rafamadriz/friendly-snippets",
    enabled = false,
  },
  -- Configure blink.cmp (LazyVim's new default completion engine)
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      -- Remove snippets from completion sources
      opts.sources = opts.sources or {}
      opts.sources.default = { "lsp", "path", "buffer" } -- No "snippets"

      -- Configure enabled to check both global and buffer variables
      opts.enabled = function()
        return vim.g.completion ~= false and vim.b.completion ~= false
      end

      return opts
    end,
    keys = {
      {
        "<leader>ch",
        function()
          local blink = require("blink.cmp")

          -- Toggle the buffer variable (per-buffer)
          if vim.b.completion == false then
            vim.b.completion = true
            vim.notify("Completion enabled (buffer)", vim.log.levels.INFO)
          else
            vim.b.completion = false
            blink.hide() -- Hide any open completion menu
            vim.notify("Completion disabled (buffer)", vim.log.levels.INFO)
          end
        end,
        desc = "Toggle completion (buffer)",
        mode = "n",
      },
      {
        "<leader>cH",
        function()
          local blink = require("blink.cmp")

          -- Toggle the global variable (all buffers)
          if vim.g.completion == false then
            vim.g.completion = true
            vim.notify("Completion enabled (global)", vim.log.levels.INFO)
          else
            vim.g.completion = false
            blink.hide() -- Hide any open completion menu
            vim.notify("Completion disabled (global)", vim.log.levels.INFO)
          end
        end,
        desc = "Toggle completion (global)",
        mode = "n",
      },
    },
  },
}
