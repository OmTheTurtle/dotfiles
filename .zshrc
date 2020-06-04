# Aliases

# SSH aliases
alias meg='ssh jani@meg.sch.bme.hu -4'
alias brian='ssh jani@brian.sch.bme.hu -4'
alias lois='ssh jani@lois.sch.bme.hu -p 35355 -4'

# alias netfix='sudo ethtool -s enp0s31f6 autoneg on'

alias ll='ls -lh'
alias l='ls -lha'

alias wtr='curl wttr.in'
alias ..='cd ..'
alias mov='lf ~/Videos/Movies'
alias ser='lf ~/Videos/Series'

alias lg='lazygit'
alias g='git'
alias v='vim'
alias rm='rm -I'
alias dockerkill='docker stop $(docker ps -a -q)'

# Colored `ls`
export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
alias ls='ls $LS_OPTIONS'

cdp() {
  cd "/home/$(whoami)/workspace/kir-dev/$1"
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

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=$PATH:/opt/jetbrains
export DENO_INSTALL="/home/johnny/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export TERM=xterm-256color

# Fix url query parameters escaping
unsetopt nomatch

# Ignore case in autocomplete
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'

# Syntax highlighting
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

fpath=($fpath "/home/johnny/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_PROMPT_ADD_NEWLINE=false

SPACESHIP_PROMPT_ORDER=(
  user
  host
  dir
  git
  ruby
  node
  line_sep
  char
)

