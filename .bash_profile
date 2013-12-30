###### Add executables to the PATH

# Get Homebrew apps before anything else
export PATH=/usr/local/bin:$PATH
# Get apps in your ~/bin directory
export PATH=~/bin:$PATH
# Add Pebble SDK to path
export PATH=~/Documents/pebble-dev/PebbleSDK-2.0-BETA4/bin:$PATH
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

###### Command Aliases

# Make the OCaml Console actually useful
alias ocaml="rlwrap ocaml"

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Enable aliases to be sudo’ed
alias sudo='sudo '

###### Bash Colors

# Taken from Bashstrap
# Modified version of @gf3’s Sexy Bash Prompt
# (https://github.com/gf3/dotfiles)
if tput setaf 1 &> /dev/null; then
	tput sgr0
	if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
		# This is the one used by OS X's Terminal
		BLACK=$(tput setaf 190)
		MAGENTA=$(tput setaf 9)
		ORANGE=$(tput setaf 172)
		GREEN=$(tput setaf 2)
		PURPLE=$(tput setaf 141)
		WHITE=$(tput setaf 0)
		CYAN=$(tput setaf 6)
		YELLOW=$(tput setaf 3)
	else
		BLACK=$(tput setaf 190)
		MAGENTA=$(tput setaf 5)
		ORANGE=$(tput setaf 4)
		GREEN=$(tput setaf 2)
		PURPLE=$(tput setaf 1)
		WHITE=$(tput setaf 7)
	fi
	BOLD=$(tput bold)
	RESET=$(tput sgr0)
else
	BLACK="\033[01;30m"
	MAGENTA="\033[1;31m"
	ORANGE="\033[1;33m"
	GREEN="\033[1;32m"
	PURPLE="\033[1;35m"
	WHITE="\033[1;37m"
	BOLD=""
	RESET="\033[m"
fi

export BLACK
export MAGENTA
export ORANGE
export GREEN
export PURPLE
export WHITE
export CYAN
export YELLOW
export BOLD
export RESET

# Git branch details
function parse_git_dirty() {
	[[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
}
function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

export PS1="\[${BOLD}${GREEN}\]\u\[${CYAN}\]\$([[ -n \$(git branch --no-color 2> /dev/null) ]] && echo \" (\$(parse_git_branch))\") \[${ORANGE}\]\W: \[${RESET}\]"

# Make Git Autocomplete work
if [ -f ~/bin/git-completion.bash ]; then
  . ~/bin/git-completion.bash
fi

# init z! (https://github.com/rupa/z)
. ~/bin/z.sh