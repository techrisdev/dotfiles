##### My fish config
### Startup tmux if it isn't running already (before doing anything else)
if [ "$TMUX" = "" ]
	/opt/local/bin/tmux attach 
end

### Path variables
export PATH="/opt/local/bin:/opt/local/sbin:/opt/local/libexec/llvm-11/bin:/bin:/usr/local/bin:/usr/bin:$HOME/.cargo/bin:$HOME/.bin"

### Other variables
# Set the language to english if it isn't already
export LANG="en_US.UTF-8"

# pkgconfig
export PKG_CONFIG_PATH=/opt/local/lib/pkgconfig

# neovim as the default editor
export EDITOR=nvim
export VISUAL=nvim

# Default C Compiler Flags
export LDFLAGS="-L/opt/local/lib"
export CFLAGS="-I/opt/local/include"

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
		# This is not good code, I was to lazy to find out how to do '&&' in fish
		else
			/usr/bin/sudo $argv
		end
	else
		/usr/bin/sudo $argv
	end
end

# Use exa instead of ls
alias ls="exa --icons -a --group-directories-first"

# MacPorts Package Manager
alias update='sudo port selfupdate; sudo port upgrade outdated; sudo port uninstall inactive'

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

# Clear the screen before every command
function preexec --on-event fish_preexec
	clear
end

### Starship Prompt
starship init fish | source
