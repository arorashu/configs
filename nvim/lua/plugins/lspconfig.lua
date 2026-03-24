return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        root_dir = function(fname)
          local util = require("lspconfig.util")
          -- Look for git root first, then fallback to pyproject.toml
          -- added this to support my monorepo for dhwani
          return util.root_pattern(".git")(fname) or util.root_pattern("pyproject.toml")(fname)
        end,
        settings = {
          python = {
            analysis = {
              extraPaths = { "server" },
              autoSearchPaths = true,
            }
          }
        }
      },
      ts_ls = {
        root_dir = function(fname)
          local util = require("lspconfig.util")
          return util.root_pattern(".git")(fname) or util.root_pattern("package.json")(fname)
        end,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = 'all',
              includeInlayFunctionParameterTypeHints = true,
            }
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = 'all',
              includeInlayFunctionParameterTypeHints = true,
            }
          }
        }
      }
    }
  }
}
