# Omarchy

This directory contains the machine-specific Omarchy overrides from the home
machine. Omarchy-supplied files are not copied here unless they have a local
override.

The tmux override mirrors:

- `tmux/tmux.conf.local` -> `~/.config/tmux/tmux.conf.local`

The application launcher override mirrors:

- `applications/WhatsApp.desktop` -> `~/.local/share/applications/WhatsApp.desktop`

The WhatsApp launcher uses Omarchy's packaged
`omarchy-launch-or-focus-webapp` helper with Chromium's exact WhatsApp web-app
window class (`chrome-web.whatsapp.com__-Default`). This makes launching it
from the app launcher focus the existing window instead of opening another
one.

The root `.tmux.conf` is the shared base configuration for systems where the
base file is managed by this repository.

Install them with:

```sh
make install-omarchy
```

Or install one component with:

```sh
make install PROFILE=omarchy COMPONENT=tmux
make install PROFILE=omarchy COMPONENT=whatsapp
```

The installers create timestamped backups before replacing local files.
