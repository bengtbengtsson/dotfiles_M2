
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

PATH=$PATH:/Users/ben/Library/Android/sdk/platform-tools
PATH="$HOME/dotfiles/scripts:$PATH"
PATH="/opt/homebrew/bin:$PATH"
PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
PATH="/Users/ben/local/lua-5.1/bin/:$PATH"

PS1='$ %~/ '

source <(fzf --zsh)

alias dot="cd ~/dotfiles"
alias zet="cd ~/second-brain"

setopt globdots

# Added for Raspberry PI Pico development
export PICO_SDK_PATH=~/sandbox/tools/pico-sdk/

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
