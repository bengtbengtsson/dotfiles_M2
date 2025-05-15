
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

PATH=$PATH:/Users/ben/Library/Android/sdk/platform-tools

PATH="$HOME/dotfiles/scripts:$PATH"

#PATH="$HOME/neovim/bin:$PATH"

PATH="/opt/homebrew/bin:$PATH"

PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"

#PS1=$'\n%~\n$ '

# Compact one-line prompt with venv
precmd() {
  VENV=""
  [[ -n "$VIRTUAL_ENV" ]] && VENV="(${VIRTUAL_ENV:t}) "
  PS1=$'\n'"%~"$'\n'"${VENV}\$ "
}

source <(fzf --zsh)

alias dot="cd ~/dotfiles"
alias v=nvim
alias zet="cd ~/Documents/sb_20240218"
alias vks='NVIM_APPNAME="nvim-kickstart" nvim'

setopt globdots

# Added by Windsurf
export PATH="/Users/ben/.codeium/windsurf/bin:$PATH"

# Added for Raspberry PI Pico development
export PICO_SDK_PATH=~/sandbox/tools/pico-sdk/

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
