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

export PATH="$HOME/miniconda3/bin:$PATH"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/philip/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/philip/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/philip/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/philip/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

