# ---- PATH edits first ----
PATH=$PATH:/Users/ben/Library/Android/sdk/platform-tools
PATH="$HOME/.local/bin:$PATH"
PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
PATH="/Users/ben/local/lua-5.1/bin/:$PATH"
export PATH

cat << 'EOF'
 ____  ____    _____
| __ )| __ )  |_   _|___  ___
|  _ \|  _ \    | | / _ \/ __|
| |_) | |_) |   | ||  __/ (__
|____/|____/    |_| \___|\___|

EOF

# PS1='$ %~/ '
setopt prompt_subst

git_branch() {
      ref=$(git symbolic-ref --quiet --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
        [[ -n "$ref" ]] && echo "($ref)"
}

PS1='$ %~ $(git_branch) '


source <(fzf --zsh)

alias dot="cd ~/dotfiles"
alias zet="cd ~/second-brain"
alias scheme='rlwrap mit-scheme'
alias cc='claude --dangerously-skip-permissions'

setopt globdots

# Let self-updating casks (VS Code etc.) update themselves instead of brew upgrade
export HOMEBREW_NO_UPGRADE_AUTO_UPDATES_CASKS=1

# Added for Raspberry PI Pico development
export PICO_SDK_PATH=~/sandbox/tools/pico-sdk/

export TERM=xterm-256color

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Added by Antigravity
export PATH="/Users/ben/.antigravity/antigravity/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Rust toolchain (rustup installed via Homebrew)
export PATH="$HOME/.cargo/bin:$PATH"
