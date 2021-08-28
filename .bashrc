# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# An alias for logging in to the school server because I do it so often.
alias unl='ssh dfalzone@cse.unl.edu'

# Do this each time I open a shell.
fortune 40% psych 20% fortunes 20% literature 20% riddles | cowsay -W60 | lolcat -s 50 -p 0.5

alias rotate="python3 ~/portraits/rotate.py"

duck() {
    url=$1;
    links "duckduckgo.com/lite/search?q=$url";
}

# Alias to ensure Nano uses my preferred settings.
alias nano="nano -b -M --guidestripe=100 -l -L -ET4 --nowrap"

# Alias to ensure Shed shows byte indices in hexadecimal.
alias shed="shed -H"

alias ycom="links https://news.ycombinator.com/news"
alias tuir="tuir --ascii"

# Alias for copying my files from the school server to localhost.
# TODO change from UNL to Metro
fetchunl() {
    filepath=$1;
    scp -r dfalzone@cse.unl.edu:/home/ugrad/dfalzone/$filepath/ cse.unl;
}

# Source everything in the "scripts" directory.
source ~/scripts/*.sh;

# Get the weather.
alias wthr="curl http://wttr.in/Omaha?f"

# Make it easier to use the TMA-16 and the assembler for it.
alias tma16="$HOME/tma-16/tma-16-rs/target/release/tma-16-rs"
alias tmasm="python3 ~/tma-16/tma_16_assembler.py"
alias python3="python3.8"
alias python="python3"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/claire/.local/bin:"

alias tetris="tint"

alias linux="python3 ~/linux.py"

mardoc() {
    filename=$1;
    python3 ~/marain/mardoc.py $filename > $filename.html;
    firefox $filename.html;
#    rm $filename.html;
}

alias cd70="cd ~/Downloads/That\ 70\'s\ Show/"

gits() {
    git add --all;
    git commit -m "$1";
    git push origin master;
}

alias mpl="python3 ~/ncndi/mpl_interpreter.py"

export MUSICPATH="/media/claire/music"

# Function to quickly view a webpage with no frills.
function qbrowse {
    curl "$1" 2> /dev/null | pandoc -f html -t plain | less;
}

alias vlc="vlc 2> /dev/null"

function ytdl {
    youtube-dl -x --audio-format mp3 "$1";
}
