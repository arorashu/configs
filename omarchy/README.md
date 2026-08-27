# Omarchy

This directory contains the machine-specific Omarchy overrides from the home
machine. Omarchy supplies the main tmux configuration, so it is intentionally
not copied into this repository.

The tmux override mirrors:

- `tmux/tmux.conf.local` -> `~/.config/tmux/tmux.conf.local`

The root `.tmux.conf` is the shared base configuration for systems where the
base file is managed by this repository.

Install them with:

```sh
make install-omarchy-tmux
```

The installer creates a timestamped backup before replacing the local override.
