# Aliases

# SSH aliases
alias meg='ssh jani@meg.sch.bme.hu -4'
alias brian='ssh jani@brian.sch.bme.hu -4'
alias lois='ssh jani@lois.sch.bme.hu -p 35355 -4'

# alias netfix='sudo ethtool -s enp0s31f6 autoneg on'

alias ll='ls -lh'
alias l='ls -lha'

alias wtr='curl wttr.in'
alias wtr2='curl v2.wttr.in'
alias ..='cd ..'
alias mov='lf ~/Videos/Movies'
alias ser='lf ~/Videos/Shows'

alias lg='lazygit'
alias g='git'
alias v='vim'
alias rm='rm -I'
alias dockerkill='docker stop $(docker ps -a -q)'
alias nd='nvm use default'
alias vc='vercel'
alias p='pacman'
alias y='yarn'
alias ys='yarn start'
alias yd='yarn dev || yarn develop'

# Colored `ls`
export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
alias ls='ls $LS_OPTIONS'

cdp() {
  cd "/home/$(whoami)/repos/kir-dev/$1"
}

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

export TERM=xterm-256color

autoload -Uz compinit && compinit

# Ignore case in autocomplete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# nvm
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.config/.nvm"
source /usr/share/nvm/nvm.sh --no-use
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_PROMPT_ADD_NEWLINE=false

SPACESHIP_PROMPT_ORDER=(
  dir
  git
  ruby
  node
  line_sep
  char
)

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

