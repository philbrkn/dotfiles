# Starship
eval "$(starship init zsh)"

# activate syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# disable underline in highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Activate autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# eza library
alias ls='eza --icons'
alias ll='eza -la --icons'
alias tree='eza --tree --icons'
