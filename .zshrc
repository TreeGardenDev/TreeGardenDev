# Created by newuser for 5.9
#uncomment to use sway as default
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then 
	exec sway > /dev/null 2>&1 
fi


bindkey -s ^f "tmux new ~/.local/bin/tmux-sessionizer\n"

typeset -g -A key

#key[Home]="${terminfo[khome]}"
#key[End]="${terminfo[kend]}"
#key[Insert]="${terminfo[kich1]}"
#key[Backspace]="${terminfo[kbs]}"
#key[Delete]="${terminfo[kdch1]}"
#key[Up]="${terminfo[kcuu1]}"
#key[Down]="${terminfo[kcud1]}"
#key[Left]="${terminfo[kcub1]}"
#key[Right]="${terminfo[kcuf1]}"
#key[PageUp]="${terminfo[kpp]}"
#key[PageDown]="${terminfo[knp]}"
#key[Shift-Tab]="${terminfo[kcbt]}"
#
## setup key accordingly
#[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
#[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
#[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
#[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
#[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
#[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
#[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
#[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
#[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
#[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
#[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
#[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete
#
## Finally, make sure the terminal is in application mode, when zle is
## active. Only then are the values from $terminfo valid.
#if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
#	autoload -Uz add-zle-hook-widget
#	function zle_application_mode_start { echoti smkx }
#	function zle_application_mode_stop { echoti rmkx }
#	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
#	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
#fi
#
#autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
#zle -N up-line-or-beginning-search
#zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

#autoload bashcompinit
#bashcompinit
if [[ ! -v ZSH_TMUX_AUTOSTART ]]; then
    export ZSH_TMUX_AUTOSTART=true
fi
alias vim='nvim'
alias balena='/home/baum/AppImages/balenaEtcher-1.18.4-x64.AppImage'
alias la='ls -a --color=auto'
alias ls='ls --color=auto'
alias yay='paru'
alias dbg='cgdb'
alias reflectsimple="sudo reflector --verbose --country 'United States' -l 5 --sort rate --save /etc/pacman.d/mirrorlist"
alias armgdb='arm-none-eabi-gdb'
alias conan='/home/baum/.local/bin/conan/conan'

#export FOAM_INST_DIR="$HOME/OpenFOAM"
#alias of2206='source $FOAM_INST_DIR/OpenFOAM-v2206/etc/bashrc'
#alias ofoam="source ${FOAM_INST_DIR}/OpenFOAM-10/etc/bashrc"
#source ~/git/emsdk/emsdk_env.sh > /dev/null
source ~/git/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zshenv
#export VISUAL='nvim'
#export EDITOR='nvim'
#export BROWSER='librewolf'
export NO_AT_BRIDGE=1
export XDG_CURRENT_DESKTOP=sway
export XDG_CONFIG_HOME="$HOME/.config"
export LIBSEAT_BACKEND=logind
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export WLR_DRM_NO_MODIFIERS=1
eval "$(starship init zsh)"
#make keybind
#bindkey -s '^f' '/home/baum/.config/alacritty/alacritty_colorscheme.py'
bindkey -s ^b "/home/baum/.config/alacritty/alacritty_colorscheme.py\n"
# unset DISPLAY


#export PATH="/usr/local/bin/arm-gnu-toolchain-12.2.mpacbti-rel1-x86_64-arm-none-eabi/bin:$PATH"
# export PATH="/home/baum/git/emsdk:/home/baum/emsdk/upstream/emscripten:$PATH"
export PATH="/home/baum/.emscripten_cache/sysroot/include/":$PATH
export PATH="/usr/lib/emscripten/system/include/":$PATH
# xport EMSDK="/home/baum/git/emsdk"
#export EMSDK_NODE="/home/baum/git/emsdk/node/16.20.0_64bit/bin/node"

#export NVM_DIR="$HOME/nvm"
#
#[ -s "$NVM_DIR/nvm.sh" ] && start_nvm(){ 
#    . "$NVM_DIR/nvm.sh"  # This loads nvm
#    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#}

# opam configuration
#[[ ! -r /home/baum/.opam/opam-init/init.zsh ]] || source /home/baum/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
