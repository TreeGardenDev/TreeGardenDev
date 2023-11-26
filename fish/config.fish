if test (tty) = "/dev/tty1"
  sway > /dev/null 2>&1
end

if test (tty) = "/dev/tty2"
	dwl -s somebar > /dev/null 2>&1 
end
set fish_greeting ""

#fish open in external editor command set
bind \ce "edit_command_buffer"
bind \cf "tmux new ~/.local/bin/tmux-sessionizer;"
bind \cb "python /home/baum/.config/alacritty/alacritty_colorscheme.py"


if status is-interactive
    # Commands to run in interactive sessions can go here
end

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
abbr -a conan '/home/baum/.local/bin/conan/conan'
abbr -a tofi 'tofi --font /usr/share/fonts/nerd-fonts-git/TTF/BlexMonoNerdFont-Bold.ttf'
abbr -a tofi-drun 'tofi-drun --font /usr/share/fonts/nerd-fonts-git/TTF/BlexMonoNerdFont-Bold.ttf'
abbr -a tofi-run 'tofi-run --font /usr/share/fonts/nerd-fonts-git/TTF/BlexMonoNerdFont-Bold.ttf'
#abbr -a emscript 'echo set PATH=/home/baum/.emscripten_cache/sysroot/include/":"/usr/lib/emscripten/system/include/":$PATH\n'
abbr -a emscript 'fish_add_path /home/baum/.emscripten_cache/sysroot/include/; fish_add_path /usr/lib/emscripten/system/include/; fish_add_path /home/baum/git/emsdk; fish_add_path /home/baum/emsdk/upstream/emscripten'
function fish_hybrid_key_bindings --description \
"Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings fish_hybrid_key_bindings
#set -g fish_vi_key_bindings command

set -xU NO_AT_BRIDGE 1
set -xU XDG_CURRENT_DESKTOP sway
set -xU XDG_CONFIG_HOME "$HOME/.config"
set -xU LIBSEAT_BACKEND logind
set -xU XDG_SESSION_TYPE wayland
set -xU XDG_SESSION_DESKTOP sway
set -xU WLR_DRM_NO_MODIFIERS 1
set -xU MOZ_ENABLE_WAYLAND 1
set -xU ANDROID_HOME "/home/baum/Android/Sdk"
set -xU ANDROID_AVD_HOME "/home/baum/.config/.android/avd"
set -xU EDITOR nvim
set -xU VISUAL nvim
set -xU ZSH_TMUX_AUTOSTART true
#set PATH "/home/baum/.cargo/bin":~/.local/bin:$PATH
#set PATH "/home/baum/git/flutter/bin/":$PATH
#set PATH "$ANDROID_HOME/emulator/":$PATH
#set PATH "$ANDROID_HOME/platform-tools/":$PATH
#set PATH "$ANDROID_HOME/cmdline-tools/latest/bin/":$PATH

source ~/.env/openai
#[[ ! -r /home/baum/.opam/opam-init/init.fish ]] || source /home/baum/.opam/opam-init/init.fish  > /dev/null 2> /dev/null



#set PATH="/home/baum/.emscripten_cache/sysroot/include/":$PATH
#set PATH="/usr/lib/emscripten/system/include/":$PATH
#set PATH="$HOME/.cargo/env":$PATH

#source ~/.zshenv

eval "$(starship init fish)"

