# Source configuration
for FILE in ${ZHOME}/*; do
    source ${FILE}
done

# Autosuggestions
zuse github.com/zsh-users/zsh-autosuggestions
source ${ZPLUG}/zsh-autosuggestions/zsh-autosuggestions.zsh

# Custom completion
zuse github.com/zsh-users/zsh-completions
source ${ZPLUG}/zsh-completions/zsh-completions.plugin.zsh

# Vi mode
bindkey -v
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char
KEYTIMEOUT=1

# History
HISTSIZE=5000
SAVEHIST=5000
setopt inc_append_history
setopt hist_ignore_dups

# Completion
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' rehash true
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:*:*:descriptions' format '%B%F{blue}-- %d --%f%b'

# Now tab does only completion, not expansion
bindkey '^i' complete-word

# Vcs
autoload -Uz vcs_info
precmd() {vcs_info}
setopt prompt_subst

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true

zstyle ':vcs_info:*' formats '%F{yellow}(%b)%f %m%c%u'
zstyle ':vcs_info:*' actionformats '%F{yellow}(%b)%f %F{cyan}(%a)%f %m%c%u'
zstyle ':vcs_info:*' stagedstr '%F{green}●%f'
zstyle ':vcs_info:*' unstagedstr '%F{red}✚%f'

# Prompt
autoload -Uz promptinit
promptinit

PS1='┌%B%(!.%F{red}.%F{green})%n@%m%f %F{blue}%~%f ${vcs_info_msg_0_}
└❯%b%E '

RPS1='%B%F{red}%(?..[%? ⨯] )%f%F{magenta}[%T]%f%b%E'

# Syntax highlighting
zuse github.com/zdharma-continuum/fast-syntax-highlighting
source ${ZPLUG}/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

