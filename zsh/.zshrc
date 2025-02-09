
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

PATH=$PATH:/Users/ben/Library/Android/sdk/platform-tools

PATH="$HOME/dotfiles/scripts:$PATH"

PATH="$HOME/neovim/bin:$PATH"

PATH="/opt/homebrew/bin:$PATH"

PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"

PS1=$'\n$ '

source <(fzf --zsh)

alias dot="cd ~/dotfiles"
alias v=nvim
alias ..="cd .."
alias aoc="cd ~/aoc/2024"

setopt globdots

# Added by Windsurf
export PATH="/Users/ben/.codeium/windsurf/bin:$PATH"
