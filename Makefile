SHELL := /bin/sh

OMARCHY_TMUX_SOURCE := omarchy/tmux
TMUX_DESTINATION := $(HOME)/.config/tmux

.PHONY: help install install-omarchy install-omarchy-tmux

help:
	@printf '%s\n' \
		'Available targets:' \
		'  make install-omarchy-tmux  Install the Omarchy tmux setup' \
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
	@mkdir -p "$(TMUX_DESTINATION)"
	@set -e; \
	for file in tmux.conf tmux.conf.local; do \
		destination="$(TMUX_DESTINATION)/$$file"; \
		if [ -e "$$destination" ] || [ -L "$$destination" ]; then \
			cp -p "$$destination" "$$destination.bak.$$(date +%Y%m%d-%H%M%S)"; \
		fi; \
		install -m 0644 "$(OMARCHY_TMUX_SOURCE)/$$file" "$$destination"; \
	done
	@printf '%s\n' 'Installed Omarchy tmux setup.'
