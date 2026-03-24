# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a LazyVim-based Neovim configuration that provides a modern, feature-rich development environment. LazyVim is a Neovim setup that comes with sensible defaults and a plugin ecosystem built on top of lazy.nvim.

## Configuration Structure

### Core Files
- `init.lua`: Entry point that bootstraps lazy.nvim and sets the colorscheme (currently rose-pine)
- `lua/config/lazy.lua`: Main lazy.nvim configuration, imports LazyVim and custom plugins
- `lua/config/options.lua`: Global Neovim options and custom settings
- `lua/config/keymaps.lua`: Custom keybindings (mostly commented out examples)
- `lua/config/autocmds.lua`: Custom autocommands (currently empty)

### Plugin Configuration
- `lua/plugins/`: Directory containing custom plugin configurations
  - `colorscheme.lua`: Colorscheme plugins (gruvbox, monokai-nightasty, rose-pine)
  - `nvim-cmp.lua`: Completion configuration with toggle functionality (`<leader>uu`)
  - `neo-tree.lua`: File explorer customization for popup appearance
  - `ui.lua`: UI modifications (lualine without icons)
  - `example.lua`: Comprehensive example file (currently disabled)

## Key Features

### Enabled LazyVim Extras
- `lazyvim.plugins.extras.lang.typescript`: TypeScript language support
- `lazyvim.plugins.extras.formatting.black`: Python formatting with Black

### Custom Configurations
- **Colorscheme**: rose-pine (set in init.lua)
- **Completion Toggle**: `<leader>uu` to toggle autocompletion on/off
- **Case Insensitive Search**: `ignorecase` option enabled
- **Floating Windows**: Custom highlighting for better visibility
- **Lualine**: Simplified without icons, using pipe separators

## Common Commands

### Formatting
- **Toggle Autoformat**: `<leader>uf` (LazyVim default)
- **Disable Autoformat Globally**: Add `vim.g.autoformat = false` to `lua/config/options.lua`

### Code Formatting Tools
- **stylua**: Lua formatting (configured in `stylua.toml`)
- **Black**: Python formatting (via LazyVim extras)

### Plugin Management
- **Install/Update Plugins**: `:Lazy` (opens lazy.nvim interface)
- **Plugin Status**: `:Lazy check` or `:Lazy update`

## Development Workflow

### Making Changes
1. **Options**: Add global settings to `lua/config/options.lua`
2. **Keymaps**: Add custom keybindings to `lua/config/keymaps.lua`
3. **Plugins**: Create new files in `lua/plugins/` for plugin configurations
4. **Plugin Overrides**: Modify existing LazyVim plugins by creating corresponding files in `lua/plugins/`

### Plugin Configuration Pattern
LazyVim uses a structured approach where each plugin file should return a table with plugin specifications:

```lua
return {
  {
    "plugin/name",
    opts = {
      -- plugin options
    },
  },
}
```

### Adding New Plugins
Create a new file in `lua/plugins/` with the plugin specification. LazyVim will automatically load all files in this directory.

## Architecture Notes

### LazyVim Integration
- This configuration extends LazyVim rather than replacing it
- LazyVim provides the base functionality, custom configs override/extend it
- The `lua/config/lazy.lua` file imports `lazyvim.plugins` as the foundation

### Plugin Loading
- lazy.nvim manages all plugin loading and lazy-loading
- Custom plugins in `lua/plugins/` are automatically imported
- LazyVim extras can be enabled via the `spec` table in `lazy.lua`

### Colorscheme Management
- Multiple colorschemes are installed but only rose-pine is active
- Colorscheme is set in `init.lua` and can be overridden in plugin configs
- The `colorscheme.lua` file shows how to configure LazyVim's default colorscheme

## File Organization

```
~/.config/nvim/
├── init.lua                 # Entry point and global settings
├── lua/
│   ├── config/             # Core configuration
│   │   ├── lazy.lua        # Plugin manager setup
│   │   ├── options.lua     # Global options
│   │   ├── keymaps.lua     # Custom keybindings
│   │   └── autocmds.lua    # Custom autocommands
│   └── plugins/            # Plugin configurations
│       ├── colorscheme.lua # Colorscheme setup
│       ├── nvim-cmp.lua    # Completion configuration
│       ├── neo-tree.lua    # File explorer
│       └── ui.lua          # UI customizations
├── stylua.toml             # Lua formatting configuration
├── lazy-lock.json          # Plugin version lock file
└── lazyvim.json           # LazyVim configuration
```

## Important Notes

- The `example.lua` file contains comprehensive examples but is disabled by default
- Custom keymaps in `keymaps.lua` are mostly commented out (completion toggle examples)
- The configuration prioritizes simplicity and extends LazyVim's defaults rather than replacing them
- All LazyVim default keybindings and features remain available unless explicitly overridden