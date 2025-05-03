# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
#export ZSH="$HOME/.oh-my-zsh"

if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then 
    #export WLR_DRM_NO_MODIFIER=1
    #export XDG_CURRENT_DESKTOP=sway
    #export XDG_SESSION_DESKTOP=sway
	exec sway > /dev/null 2>&1 
fi
#if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty2" ]; then 
#	exec dwl -s somebar > /dev/null 2>&1 
#fi

#plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting)
autoload edit-command-line; 
zle -N edit-command-line
bindkey -v '^v' edit-command-line


bindkey -s '^f' 'tmux new ~/.local/bin/tmux-sessionizer\n'
#bindkey -v '^r' vi-search-backward
bindkey '^r' history-incremental-search-backward

typeset -g -A key
# Path to your Oh My Zsh installation.


if [[ ! -v ZSH_TMUX_AUTOSTART ]]; then
    export ZSH_TMUX_AUTOSTART=true
fi
alias vi='/usr/bin/vim'
alias hyprmon='/home/baum/.local/bin/choosemonitor'
alias vim='nvim'
alias flutemulator='emulator -avd updated_flut -no-snapshot-load -debug-init'
alias flutemulator2='emulator -avd flutter_emulator -no-snapshot-load -debug-init'
#alias flutemulator2='emulator -avd Resizable_Experimental_API_34'
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
export TERM='xterm-256color'
export EDITOR='nvim'
export TERMINAL=/usr/bin/foot
#export WLR_DRM_NO_MODIFIER=1
#export WLR_DRM_DEVICES=/dev/dri/card0:/dev/dri/card1
#export CHROME_EXECUTABLE='/usr/bin/brave'
#export BROWSER='librewolf'
export NO_AT_BRIDGE=1
#export XDG_CURRENT_DESKTOP=sway
export XDG_CONFIG_HOME="$HOME/.config"
export LIBSEAT_BACKEND=logind
export XDG_SESSION_TYPE=wayland
#export XDG_SESSION_DESKTOP=sway
#export WLR_DRM_NO_MODIFIERS=1
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

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="gruvbox"

export ANDROID_HOME="/home/baum/andstore/Android/Sdk"

alias emscript=echo 'export PATH=/home/baum/.emscripten_cache/sysroot/include/":"/usr/lib/emscripten/system/include/":$PATH\n'
#export PATH="/usr/lib/emscripten/system/include/":$PATH
#export PATH="/usr/lib/emscripten/system/include/":$PATH
export PATH="/home/baum/.cargo/bin":~/.local/bin:$PATH
export PATH="/home/baum/git/flutter/bin/":$PATH
export PATH=$ANDROID_HOME/emulator/:$PATH
export PATH=$ANDROID_HOME/platform-tools/:$PATH
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin/:$PATH

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)

#source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/.zsh/plugins/git/git-prompt.sh
source ~/.zsh/plugins/zsh-z/zsh-z.plugin.sh
source ~/.zsh/plugins/zsh-autosuggestion/zsh-autosuggestions.plugin.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
#source ~/.zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
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
