#
#~/.bashrc
#

# If not running interactively, don't do anything
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]
then
    startx
fi
[[ $- != *i* ]] && return
# Use bash-completion, if available
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias grep='grep --color=auto'
alias diecaps='setxkbmap -option caps:escape'
alias tuirisannoying='export TUIR_EDITOR=nvim&&export EDITOR=nvim&&export VISUAL=nvim&&tuir'
alias vim='nvim'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"
source ~/git/zsh-autocomplete/zsh-autocomplete.plugin.zsh
eval "$(starship init zsh)"

source /usr/share/nvm/init-nvm.sh
export TUIR_EDITOR='nvim'
export EDITOR='nvim'
export VISUAL='nvim'
