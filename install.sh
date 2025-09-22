#!/bin/bash

. scripts/utils.sh

info "Dotfiles intallation initialized..."

# Detect operating system
if [[ "$OSTYPE" == "darwin"* ]]; then
    PLATFORM="macos"
    info "Detected macOS"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    PLATFORM="linux"
    info "Detected Linux"
else
    error "Unsupported operating system: $OSTYPE"
    exit 1
fi

read -p "Install apps? [y/n] " install_apps
read -p "Overwrite existing dotfiles? [y/n] " overwrite_dotfiles

if [[ "$install_apps" == "y" ]]; then
    if [[ "$PLATFORM" == "macos" ]]; then
        . scripts/macos/prerequisites.sh
        . scripts/macos/brew-install.sh
        printf "\n"
        info "===================="
        info "Prerequisites"
        info "===================="

        install_xcode
        install_homebrew

        printf "\n"
        info "===================="
        info "Apps"
        info "===================="

        install_custom_formulae
        install_custom_casks
        run_brew_bundle
    elif [[ "$PLATFORM" == "linux" ]]; then
        . scripts/linux/prerequisites.sh
        install_basics
        install_starship
        setup_zsh
        install_clipboard_tools
    fi
fi

# printf "\n"
# info "===================="
# info "OSX System Defaults"
# info "===================="
#
# register_keyboard_shortcuts
# apply_osx_system_defaults
#
printf "\n"
info "===================="
info "Terminal"
info "===================="

info "Adding .hushlogin file to suppress 'last login' message in terminal..."
touch ~/.hushlogin

printf "\n"
info "===================="
info "Symbolic Links"
info "===================="

chmod +x ./scripts/symlinks.sh
if [[ "$overwrite_dotfiles" == "y" ]]; then
    warning "Deleting existing dotfiles..."
    ./scripts/symlinks.sh --delete --include-files
fi
./scripts/symlinks.sh --create

# Install Tmux Plugin Manager
printf "\n"
info "===================="
info "Tmux Plugin Manager"
info "===================="
if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    info "Installing Tmux Plugin Manager..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    success "TPM installed"
else
    success "TPM already installed"
fi

success "Dotfiles set up successfully."
