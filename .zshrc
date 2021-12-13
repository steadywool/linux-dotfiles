source $ZHOME/aliases.zsh
source $ZHOME/theme.zsh
source $ZHOME/zuse.zsh

zuse github.com/zsh-users/zsh-autosuggestions
source $ZPLUG/zsh-autosuggestions/zsh-autosuggestions.zsh

zuse github.com/zsh-users/zsh-completions
source $ZPLUG/zsh-completions/zsh-completions.plugin.zsh

zuse github.com/zsh-users/zsh-syntax-highlighting
source $ZPLUG/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

zuse github.com/jeffreytse/zsh-vi-mode
source $ZPLUG/zsh-vi-mode/zsh-vi-mode.zsh

# Vi mode
bindkey -v
KEYTIMEOUT=5

# History
HISTSIZE=5000
SAVEHIST=5000

# completion
autoload -Uz compinit
compinit
setopt COMPLETE_ALIASES
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# Vcs
autoload -Uz vcs_info
precmd() {vcs_info}
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true
