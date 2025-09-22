#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. $SCRIPT_DIR/../utils.sh

install_basics() {
    info "Updating package lists..."
    sudo apt update

    info "Installing basic packages..."
    while IFS= read -r package; do
        # Skip empty lines and comments
        [[ -z "$package" || "$package" == \#* ]] && continue

        if ! dpkg -l | grep -q "^ii  $package "; then
            info "Installing $package..."
            sudo apt install -y "$package"
        else
            warning "$package already installed"
        fi
    done <"$SCRIPT_DIR/../../packages/ubuntu-packages.txt"
}

install_starship() {
    info "Installing Starship prompt..."
    if command -v starship &>/dev/null; then
        warning "Starship already installed"
    else
        curl -sS https://starship.rs/install.sh | sh -s -- --yes
    fi
}

install_wezterm() {
    info "Installing WezTerm..."
    if command -v wezterm &>/dev/null; then
        warning "WezTerm already installed"
    else
        # Add WezTerm repository and install
        curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
        echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
        sudo apt update
        sudo apt install -y wezterm
    fi
}

setup_zsh() {
    info "Setting up Zsh..."

    # Change default shell to zsh if not already
    if [[ "$SHELL" != */zsh ]]; then
        info "Changing default shell to zsh..."
        chsh -s $(which zsh)
        warning "You'll need to log out and back in for shell change to take effect"
    fi
}

install_clipboard_tools() {
    info "Installing clipboard tools for tmux..."
    if ! command -v xclip &>/dev/null; then
        sudo apt install -y xclip
    fi
}

if [ "$(basename "$0")" = "$(basename "${BASH_SOURCE[0]}")" ]; then
    install_basics
    install_starship
    install_wezterm
    setup_zsh
    install_clipboard_tools
fi
