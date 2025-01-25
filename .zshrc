# Created by newuser for 5.9
#uncomment to use sway as default
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then 
	exec sway > /dev/null 2>&1 
fi
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty2" ]; then 
	exec dwl -s somebar > /dev/null 2>&1 
fi

autoload edit-command-line; 
zle -N edit-command-line
bindkey -v '^v' edit-command-line


bindkey -s '^f' 'tmux new ~/.local/bin/tmux-sessionizer\n'
#bindkey -v '^r' vi-search-backward
bindkey '^r' history-incremental-search-backward

typeset -g -A key

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

if [[ ! -v ZSH_TMUX_AUTOSTART ]]; then
    export ZSH_TMUX_AUTOSTART=true
fi
alias vi='/usr/bin/vim'
alias vim='nvim'
alias flutemulator='emulator -avd flutter_emulator -no-snapshot-load -debug-init'
alias flutemulator2='emulator -avd Resizable_Experimental_API_34'
alias gdb='gdb -tui'
alias balena='/home/baum/AppImages/balenaEtcher-1.18.4-x64.AppImage'
alias la='ls -a --color=auto'
alias ls='ls --color=auto'
alias yay='paru'
alias dbg='cgdb'
alias reflectsimple="sudo reflector -p https -n 5 -l 150 --sort rate --save /etc/pacman.d/mirrorlist --threads 300"
alias armgdb='arm-none-eabi-gdb'
alias conan='/home/baum/.local/bin/conan/conan'
alias tofi='tofi --font /usr/share/fonts/nerd-fonts-git/TTF/BlexMonoNerdFont-Bold.ttf'
alias tofi-drun='tofi-drun --font /usr/share/fonts/nerd-fonts-git/TTF/BlexMonoNerdFont-Bold.ttf'
alias tofi-run='tofi-run --font /usr/share/fonts/nerd-fonts-git/TTF/BlexMonoNerdFont-Bold.ttf'
alias spt='spotify_player'

if command -v theme.sh > /dev/null; then
	[ -e ~/.theme_history ] && theme.sh "$(theme.sh -l|tail -n1)"

	# Optional

	# Bind C-o to the last theme.
	last_theme() {
		theme.sh "$(theme.sh -l|tail -n2|head -n1)"
	}

	zle -N last_theme
	bindkey '^O' last_theme

	alias th='theme.sh -i'

	# Interactively load a light theme
	alias thl='theme.sh --light -i'

	# Interactively load a dark theme
	alias thd='theme.sh --dark -i'
fi
#export FOAM_INST_DIR="$HOME/OpenFOAM"
#alias of2206='source $FOAM_INST_DIR/OpenFOAM-v2206/etc/bashrc'
#alias ofoam="source ${FOAM_INST_DIR}/OpenFOAM-10/etc/bashrc"
#source ~/git/emsdk/emsdk_env.sh > /dev/null
#source ~/git/zsh-autocomplete/zsh-autocomplete.plugin.zsh
#

##History search comp
autoload -Uz compinit
compinit
setopt SHARE_HISTORY
HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTSIZE=10000
setopt HIST_IGNORE_ALL_DUPS
bindkey '^n' history-search-backward
bindkey '^b' history-search-forward





source ~/.zshenv
export VISUAL='nvim'
#export TERM='alacritty'
export EDITOR='nvim'
export TERMINAL=/usr/bin/foot
#export CHROME_EXECUTABLE='/usr/bin/brave'
#export BROWSER='librewolf'
export NO_AT_BRIDGE=1
export XDG_CURRENT_DESKTOP=sway
export XDG_CONFIG_HOME="$HOME/.config"
export LIBSEAT_BACKEND=logind
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export WLR_DRM_NO_MODIFIERS=1
#bindkey -s ^b "/home/baum/.config/alacritty/alacritty_colorscheme.py\n"
# unset DISPLAY


#export PATH="/usr/local/bin/arm-gnu-toolchain-12.2.mpacbti-rel1-x86_64-arm-none-eabi/bin:$PATH"
# export PATH="/home/baum/git/emsdk:/home/baum/emsdk/upstream/emscripten:$PATH"
export ANDROID_HOME="/home/baum/andstore/Android/Sdk"

alias emscript=echo 'export PATH=/home/baum/.emscripten_cache/sysroot/include/":"/usr/lib/emscripten/system/include/":$PATH\n'
#export PATH="/usr/lib/emscripten/system/include/":$PATH
#export PATH="/usr/lib/emscripten/system/include/":$PATH
export PATH="/home/baum/.cargo/bin":~/.local/bin:$PATH
export PATH="/home/baum/git/flutter/bin/":$PATH
export PATH=$ANDROID_HOME/emulator/:$PATH
export PATH=$ANDROID_HOME/platform-tools/:$PATH
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin/:$PATH
#
#export EMSDK="/home/baum/git/emsdk"
#export EMSDK_NODE="/home/baum/git/emsdk/node/16.20.0_64bit/bin/node"

#export NVM_DIR="$HOME/nvm"
#
#[ -s "$NVM_DIR/nvm.sh" ] && start_nvm(){ 
#    . "$NVM_DIR/nvm.sh"  # This loads nvm
#    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#}

# opam configuration
#[[ ! -r /home/baum/.opam/opam-init/init.zsh ]] || source /home/baum/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
#source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
[[ ! -r /home/baum/.opam/opam-init/init.zsh ]] || source /home/baum/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
#eval "$(starship init zsh)"

#[ -f "/home/baum/.ghcup/env" ] && source "/home/baum/.ghcup/env" # ghcup-env
##Prompt


##PLUGINS
source ~/.zsh/plugins/git/git-prompt.sh
source ~/.zsh/plugins/zsh-z/zsh-z.plugin.sh
# git prompt options
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_STATESEPARATOR=' '
GIT_PS1_HIDE_IF_PWD_IGNORED=true
GIT_PS1_COMPRESSSPARSESTATE=true

# zsh-z plugin options
ZSH_CASE=smart # lower case patterns are treated as case insensitive
zstyle ':completion:*' menu select # improve completion menu style


setopt PROMPT_SUBST

NL=$'\n'
PS1='$NL%B%F{cyan}%3~%f%b% %F{magenta}$(__git_ps1 "  %s")%f$NL%B%(?.%F{green}.%F{red})%(!.#.>)%f%b '
