SHELL := /bin/sh

OMARCHY_TMUX_SOURCE := omarchy/tmux/tmux.conf.local
TMUX_CONFIG_DIR := $(HOME)/.config/tmux
OMARCHY_TMUX_DESTINATION := $(TMUX_CONFIG_DIR)/tmux.conf.local

.PHONY: help install install-omarchy install-omarchy-tmux

help:
	@printf '%s\n' \
		'Available targets:' \
		'  make install-omarchy-tmux  Install Omarchy tmux overrides' \
		'  make install-omarchy       Install all Omarchy setups' \
		'  make install PROFILE=omarchy COMPONENT=tmux'

install:
	@if [ -z "$(PROFILE)" ] || [ -z "$(COMPONENT)" ]; then \
		printf '%s\n' 'Usage: make install PROFILE=omarchy COMPONENT=tmux'; \
		exit 2; \
	fi
	@$(MAKE) install-$(PROFILE)-$(COMPONENT)

install-omarchy: install-omarchy-tmux

install-omarchy-tmux:
	@mkdir -p "$(TMUX_CONFIG_DIR)"
	@if [ -e "$(OMARCHY_TMUX_DESTINATION)" ] || [ -L "$(OMARCHY_TMUX_DESTINATION)" ]; then \
		cp -p "$(OMARCHY_TMUX_DESTINATION)" "$(OMARCHY_TMUX_DESTINATION).bak.$$(date +%Y%m%d-%H%M%S)"; \
	fi
	@install -m 0644 "$(OMARCHY_TMUX_SOURCE)" "$(OMARCHY_TMUX_DESTINATION)"
	@printf '%s\n' 'Installed Omarchy tmux overrides.'
