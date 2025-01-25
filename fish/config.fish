if test (tty) = "/dev/tty1"
  sway > /dev/null 2>&1
end

if test (tty) = "/dev/tty2"
	dwl -s somebar > /dev/null 2>&1 
end
set fish_greeting ""

bind  -M insert \cC "fish_clipboard_copy"

bind -M insert \cc kill-whole-line repaint


#if status is-interactive
#    # Commands to run in interactive sessions can go here
#end

set fish_color_error red --bold

abbr -a vi 'vim'
abbr -a vim 'nvim'
abbr -a flutemulator 'emulator -avd flutter_emulator -no-snapshot-load -debug-init'
abbr -a flutemulator2 'emulator -avd Resizable_Experimental_API_34'
abbr -a gdb 'gdb -tui'
abbr -a balena '/home/baum/AppImages/balenaEtcher-1.18.4-x64.AppImage'
abbr -a la 'ls -a --color=auto'
abbr -a ls 'ls --color=auto'
abbr -a yay 'paru'
abbr -a dbg 'cgdb'
abbr -a reflectsimple "sudo reflector -p https -n 5 -l 150 --sort rate --save /etc/pacman.d/mirrorlist --threads 300"
abbr -a armgdb 'arm-none-eabi-gdb'
#abbr -a conanlocal '/home/baum/.local/bin/conan/conan'
abbr -a tofi 'tofi --font /usr/share/fonts/nerd-fonts-git/TTF/BlexMonoNerdFont-Bold.ttf'
abbr -a tofi-drun 'tofi-drun --font /usr/share/fonts/nerd-fonts-git/TTF/BlexMonoNerdFont-Bold.ttf'
abbr -a tofi-run 'tofi-run --font /usr/share/fonts/nerd-fonts-git/TTF/BlexMonoNerdFont-Bold.ttf'
abbr -a zathura 'zathura -d /home/baum/pdf/'
abbr -a themeswitch '/home/baum/.config/fish/functions/changescheme.sh'
abbr -a lightmode 'theme.sh windows-nt-light'
abbr -a darkmode 'theme.sh gruvbox-dark-hard'
abbr -a gcc "zsh -c 'gcc"
abbr -a g++ "zsh -c 'g++"
#abbr -a emscript 'echo set PATH=/home/baum/.emscripten_cache/sysroot/include/":"/usr/lib/emscripten/system/include/":$PATH\n'
#abbr -a emscript 'fish_add_path /home/baum/.emscripten_cache/sysroot/include/; fish_add_path /usr/lib/emscripten/system/include/; fish_add_path /home/baum/git/emsdk; fish_add_path /home/baum/emsdk/upstream/emscripten'
#function fish_hybrid_key_bindings --description \
#"Vi-style bindings that inherit emacs-style bindings in all modes"
#    for mode in default insert visual
#        fish_default_key_bindings -M $mode
#    end
#    fish_vi_key_bindings --no-erase
#end
set -g fish_key_bindings fish_hybrid_key_bindings
set -g fish_vi_key_bindings command
set -xU _JAVA_AWT_WM_NONREPARENTING 1
set -xU NO_AT_BRIDGE 1
set -xU XDG_CURRENT_DESKTOP sway
set -xU XDG_CONFIG_HOME "$HOME/.config"
set -xU LIBSEAT_BACKEND logind
set -xU XDG_SESSION_TYPE wayland
set -xU XDG_SESSION_DESKTOP sway
set -xU WLR_DRM_NO_MODIFIERS 1
set -xU MOZ_ENABLE_WAYLAND 1
set -xU ANDROID_HOME "/home/baum/andstore/Android/Sdk"
set -xU ANDROID_AVD_HOME "/home/baum/.config/.android/avd"
set -xU EDITOR nvim
set -xU VISUAL nvim
set -xU TERMINAL foot
set -xU TERM foot-256color
set -xU TerminalEmulator foot
set -xU ZSH_TMUX_AUTOSTART true
set -xU PAGER nvimpager

if test (cat $HOME/.config/.theme_history|tail -n1) = "windows-nt-light"
    set -xU scheme "day"
    theme.sh windows-nt-light
else
    set -xU scheme "night"
    theme.sh gruvbox-dark-hard
end


#set -g fish_key_bindings fish_vi_key_bindings
bind -M insert \cc kill-whole-line repaint
#fish open in external editor command set
bind -M insert \cv edit_command_buffer
bind -M insert \cf 'tmux new ~/.local/bin/tmux-sessionizer'
bind -M default \cm history-search-forward
bind -M default \cn history-search-backward
#bind -M insert \cm history-search-forward
#bind -M insert \cn history-search-backward
bind -M default \cr history-pager


#if test "$scheme" = "day"
#    theme.sh windows-nt-light
#else
#    theme.sh gruvbox-dark-hard
#end
#set PATH "/home/baum/.cargo/bin":~/.local/bin:$PATH
#set PATH "/home/baum/git/flutter/bin/":$PATH
#set PATH "$ANDROID_HOME/emulator/":$PATH
#set PATH "$ANDROID_HOME/platform-tools/":$PATH
#set PATH "$ANDROID_HOME/cmdline-tools/latest/bin/":$PATH

#source ~/.env/openai
#[[ ! -r /home/baum/.opam/opam-init/init.fish ]] || source /home/baum/.opam/opam-init/init.fish  > /dev/null 2> /dev/null

if type -q theme.sh
	if test -e ~/.theme_history
	theme.sh (theme.sh -l|tail -n1)
	end

	# Optional
	# Bind C-o to the last theme.
	function last_theme
		theme.sh (theme.sh -l|tail -n2|head -n1)
	end

	bind \co last_theme

	alias th='theme.sh -i'

	# Interactively load a light theme
	alias thl='theme.sh --light -i'

	# Interactively load a dark theme
	alias thd='theme.sh --dark -i'
end


#set PATH="/home/baum/.emscripten_cache/sysroot/include/":$PATH
#set PATH="/usr/lib/emscripten/system/include/":$PATH
#set PATH="$HOME/.cargo/env":$PATH

#source ~/.zshenv
bind -M insert \cg 'git diff; commandline -f repaint'
eval "$(starship init fish)"
