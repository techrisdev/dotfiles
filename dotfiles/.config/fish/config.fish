##### My fish config
### Path variable
export PATH="/opt/homebrew/bin:/opt/local/bin:/opt/X11/bin:/opt/homebrew/opt/bison/bin:/Applications/Visual Studio Code.app/Contents/Resources/app/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.cargo/bin:$HOME/.bin:$HOME/.local/flutter/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:$HOME/go/bin:/opt/homebrew/opt/openssl/bin"
#export PATH="$PATH:/opt/local/bin:/opt/local/sbin"

### Startup tmux if it isn't running already (before doing anything else)
if [ $TERM != "screen" ]
	tmux a
end

### Other path variables
#export PKG_CONFIG_PATH="/opt/local/lib/pkgconfig/"
export PKG_CONFIG_PATH="/opt/homebrew/lib/pkgconfig:/opt/local/lib/pkgconfig:/opt/homebrew/opt/openssl@3/lib/pkgconfig:/opt/homebrew/Cellar/openssl@3/3.0.0_1/lib/pkgconfig:/opt/homebrew/opt/libarchive/lib/pkgconfig:/opt/homebrew/opt/libedit/lib/pkgconfig"
#export LUA_PATH="/opt/local/share/lua/5.3/?.lua;/opt/local/share/lua/5.4/?/init.lua;/opt/local/lib/lua/5.4/?.lua;/opt/local/lib/lua/5.4/?/init.lua;./?.lua;./?/init.lua;"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk16-zulu/Contents/Home

### Other variables
# Set the language to english if it isn't already
export LANG="en_US.UTF-8"

# neovim as the default editor
export EDITOR=nvim
export VISUAL=nvim

# Default C Compiler Flags
#export LDFLAGS="-L/opt/local/lib"
#export CFLAGS="-I/opt/local/include"
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib -L/opt/homebrew/opt/openssl/lib -L/opt/homebrew/opt/libarchive/lib -L/opt/homebrew/opt/libedit/lib"
export CFLAGS="-I/opt/homebrew/opt/openssl@3/include -I/opt/homebrew/opt/openssl/include -I/opt/homebrew/opt/libarchive/include"
export CPPFLAGS="-I/opt/homebrew/opt/libedit/include"

# Chrome Executable for Flutter Web Apps (I like to use the Brave Browser)
export CHROME_EXECUTABLE="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"

### Aliases
# Ask before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# Use nvim instead of vim
alias vim="nvim"

# Same for 'sudo vim'
function sudo
	if [ (count $argv) -gt 1 ]
		if [ $argv[1] = "vim" ]
			/usr/bin/sudo nvim $argv[2]
		# This is not good code, I was too lazy to find out how to do '&&' in fish
		else
			/usr/bin/sudo $argv
		end
	else
		/usr/bin/sudo $argv
	end
end

# Use exa instead of ls
alias ls="exa --icons -a --group-directories-first"

# Package Manager
#alias update='sudo port selfupdate; sudo port upgrade outdated; sudo port uninstall inactive'
alias update='brew upgrade; brew cleanup'

# Memory and Swap usage
alias mem='top -l 1 -s 0 | grep PhysMem'
alias swap='sysctl vm.swapusage'

# Clear the screen and scrollback
alias scrollclear="clear && printf '\e[3J'"

alias gp="git push"

# Use Python 3 by default if it isn't already
alias python="python3"
alias pip="python3 -m pip"

# For macOS: Change shortcuts for my Keyboard Shortcut Script
alias change_shortcut="sh dev/Projects/desktop-manager/Install_Launcher.sh"


### Other configuration
# Disable the fish greeting
set fish_greeting

### Dracula Color Theme
set -l foreground f8f8f2
set -l selection 44475a
set -l comment 6272a4
set -l red ff5555
set -l orange ffb86c
set -l yellow f1fa8c
set -l green 50fa7b
set -l purple bd93f9
set -l cyan 8be9fd
set -l pink ff79c6

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

# Vi Mode
function fish_user_key_bindings
  fish_vi_key_bindings
end


# Clear the screen before every command
function preexec --on-event fish_preexec
	clear
end

### Starship Prompt
starship init fish | source
