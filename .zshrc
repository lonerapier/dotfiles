# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

