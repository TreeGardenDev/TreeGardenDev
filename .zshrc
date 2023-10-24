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

bindkey -s ^f "tmux new ~/.local/bin/tmux-sessionizer\n"
bindkey -v '^r' vi-search-backward

typeset -g -A key

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

if [[ ! -v ZSH_TMUX_AUTOSTART ]]; then
    export ZSH_TMUX_AUTOSTART=true
fi
alias vim='nvim'
alias balena='/home/baum/AppImages/balenaEtcher-1.18.4-x64.AppImage'
alias la='ls -a --color=auto'
alias ls='ls --color=auto'
alias yay='paru'
alias dbg='cgdb'
alias reflectsimple="sudo reflector -p https -n 5 -l 150 --sort rate --save /etc/pacman.d/mirrorlist --threads 300"
alias armgdb='arm-none-eabi-gdb'
alias conan='/home/baum/.local/bin/conan/conan'

#export FOAM_INST_DIR="$HOME/OpenFOAM"
#alias of2206='source $FOAM_INST_DIR/OpenFOAM-v2206/etc/bashrc'
#alias ofoam="source ${FOAM_INST_DIR}/OpenFOAM-10/etc/bashrc"
#source ~/git/emsdk/emsdk_env.sh > /dev/null
source ~/git/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zshenv
#export VISUAL='nvim'
export EDITOR='nvim'
#export BROWSER='librewolf'
export NO_AT_BRIDGE=1
export XDG_CURRENT_DESKTOP=sway
export XDG_CONFIG_HOME="$HOME/.config"
export LIBSEAT_BACKEND=logind
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export WLR_DRM_NO_MODIFIERS=1
bindkey -s ^b "/home/baum/.config/alacritty/alacritty_colorscheme.py\n"
# unset DISPLAY


#export PATH="/usr/local/bin/arm-gnu-toolchain-12.2.mpacbti-rel1-x86_64-arm-none-eabi/bin:$PATH"
# export PATH="/home/baum/git/emsdk:/home/baum/emsdk/upstream/emscripten:$PATH"

alias emscript=echo 'export PATH=/home/baum/.emscripten_cache/sysroot/include/":"/usr/lib/emscripten/system/include/":$PATH\n'
#export PATH="/usr/lib/emscripten/system/include/":$PATH
#export PATH="/usr/lib/emscripten/system/include/":$PATH
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
eval "$(starship init zsh)"
