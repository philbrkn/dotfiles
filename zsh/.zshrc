# Starship
eval "$(starship init zsh)"

# OS-specific plugin loading
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS (Homebrew)
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    alias ls='eza --icons'
    alias ll='eza -la --icons'
    alias tree='eza --tree --icons'
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Ubuntu (apt packages)
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    alias ls='exa --icons'
    alias ll='exa -la --icons'
    alias tree='exa --tree --icons'
fi

# disable underline in highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

alias e='exit'
