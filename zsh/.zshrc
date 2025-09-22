# Starship
eval "$(starship init zsh)"

# OS-specific plugin loading
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS (Homebrew)
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Ubuntu (apt packages)
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# disable underline in highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

alias ls='eza --icons'
alias ll='eza -la --icons'
alias tree='eza --tree --icons'

alias e='exit'
