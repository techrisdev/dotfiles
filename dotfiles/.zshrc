##### My zsh config
### Path variable
export PATH="/opt/homebrew/bin:/opt/homebrew/opt/bison/bin:/Applications/Visual Studio Code.app/Contents/Resources/app/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.cargo/bin:$HOME/.bin:$HOME/.local/flutter/bin:/Applications/Xcode.app/Contents/Developer/usr/bin"
#export PATH="$PATH:/opt/local/bin:/opt/local/sbin"

### Startup tmux if it isn't running already (before doing anything else)
if [ "$TMUX" = "" ]; then /opt/homebrew/bin/tmux attach; fi

### Other path variables
#export PKG_CONFIG_PATH="/opt/local/lib/pkgconfig/"
export PKG_CONFIG_PATH="/opt/homebrew/lib/pkgconfig/"
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

# Chrome Executable for Flutter Web Apps (I like to use the Brave Browser)
export CHROME_EXECUTABLE="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"

### Aliases
# Ask before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# Use neovim instead of vim
alias vim="nvim"

# Same thing for 'sudo vim'
sudo() {
	if [ "$1" = "vim" ]; then
		# This assumes that sudo is located at /usr/bin/sudo
		/usr/bin/sudo nvim "${@:2}"
	else
		/usr/bin/sudo "$@"
	fi
}

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

# Time Machine Progress
tmprog() {
	tmutil status | LC_NUMERIC="C" awk -F'"' '/_raw_Percent/ {print $4 * 100}'
}

alias gp="git push"

# Use Python 3 by default if it isn't already
alias python="python3"
alias pip="python3 -m pip"

### Other Configuration
# Enable vi mode
bindkey -v

# Clear screen before every command
preexec() {
	clear
}

### Autocompletion
#source /opt/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(completion history)

### Syntax Highlighting
#source /opt/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### Dracula Color Theme for zsh-syntax-highlighting (my own version, tries to replicate the fish version)
FOREGROUND="#F8F8F2"
SELECTION="#44475A"
COMMENT="#6272A4"
RED="#FF5555"
ORANGE="#FFB86C"
YELLOW="#F1FA8C"
GREEN="#50FA7B"
PURPLE="#BD93F9"
CYAN="#8BE9FD"
PINK="#FF79C6"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[comment]="fg=$COMMENT"
ZSH_HIGHLIGHT_STYLES[alias]="fg=$CYAN"
ZSH_HIGHLIGHT_STYLES[suffix-alias]="fg=$CYAN"
ZSH_HIGHLIGHT_STYLES[global-alias]="fg=$CYAN"
ZSH_HIGHLIGHT_STYLES[function]="fg=$CYAN"
ZSH_HIGHLIGHT_STYLES[command]="fg=$CYAN"
ZSH_HIGHLIGHT_STYLES[precommand]="fg=$CYAN,italic"
ZSH_HIGHLIGHT_STYLES[autodirectory]="fg=$ORANGE,italic"
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=#FFB86C"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=#FFB86C"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]="fg=#BD93F9"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=#8BE9FD"
ZSH_HIGHLIGHT_STYLES[reserved-word]="fg=#8BE9FD"
ZSH_HIGHLIGHT_STYLES[hashed-command]="fg=#8BE9FD"
ZSH_HIGHLIGHT_STYLES[commandseparator]="fg=#FF79C6"
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]="fg=$PINK"
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]="fg=$PINK"
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]="fg=$PINK"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]="fg=#FF79C6"
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]="fg=#FF79C6"
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]="fg=#FF79C6"
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]="fg=#F1FA8C"
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]="fg=#F1FA8C"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=#F1FA8C"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]="fg=#FF5555"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=#F1FA8C"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]="fg=#FF5555"
ZSH_HIGHLIGHT_STYLES[rc-quote]="fg=#F1FA8C"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]="fg=$PINK"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]="fg=#FF5555"
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]="fg=$PINK"
ZSH_HIGHLIGHT_STYLES[assign]="fg=$PURPLE"
ZSH_HIGHLIGHT_STYLES[named-fd]="fg=#F8F8F2"
ZSH_HIGHLIGHT_STYLES[numeric-fd]="fg=#F8F8F2"
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=#FF5555"
ZSH_HIGHLIGHT_STYLES[path]="underline,fg=#8BE9FD"
ZSH_HIGHLIGHT_STYLES[path_pathseparator]="fg=#FF79C6"
ZSH_HIGHLIGHT_STYLES[path_prefix]="underline,fg=#8BE9FD"
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]="underline,fg=#FF79C6"
ZSH_HIGHLIGHT_STYLES[globbing]="fg=#F8F8F2"
ZSH_HIGHLIGHT_STYLES[history-expansion]="fg=#BD93F9"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]="fg=#FF5555"
ZSH_HIGHLIGHT_STYLES[redirection]="fg=#F8F8F2"
ZSH_HIGHLIGHT_STYLES[arg0]="fg=#F8F8F2"
ZSH_HIGHLIGHT_STYLES[default]="fg=$PURPLE"
ZSH_HIGHLIGHT_STYLES[cursor]="standout"

### Starship Prompt
eval "$(starship init zsh)"
