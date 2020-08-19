printf "$(whoami) running Windows 10 on $(hostname)\r\n"
date;

                                                         # The true name of Ba'al, the soul-eater
                                                         # (see xkcd 1638)
PS1='\e[32;1m[ \u@\h ] \[\033[01;34m\]$(pwd -W | sed "s/\//\\\\\\/g")\[\033[00m\]\$ '
alias python="winpty -Xallow-non-tty python.exe"
alias wget="/c/Program\ Files\ \(x86\)/GnuWin32/bin/wget"
alias gcc="/c/mingw/bin/gcc.exe"
alias g++="/c/mingw/bin/g++.exe"

function man {
    if [[ $1 == "blerp" ]]; then
        sleep 0.5; less -P"\man page for blerp" ~/blerp.txt; return 0
    fi

    local section=all
    if [[ "$1" =~ ^[0-9]+$ ]]; then section="$1"; shift; fi
    local doc="$(curl -v --silent --data-urlencode topic="$@" --data-urlencode section="$section" http://man.he.net/ 2>&1)"
    local ok=$?
    local pre="$(printf '%s' "$doc" | pandoc -f html -t plain)"
    [[ $ok -eq 0 && -n "$pre" ]] && printf '%s' "$pre" | less --prompt="\man page for $1" || printf 'Got nothing.\n' >&2
    return $ok
}

alias nano="nano -b -M --guidestripe=100 -l -L -ET4 --nowrap"
alias xmlpp="python ~/xmlpp.py"
alias xmlfilt="python ~/xmlfilt.py"
[ -f ~/bin/win-sudo/s/path.sh ] && source ~/bin/win-sudo/s/path.sh
alias tmasm="python ~/tma-16/tma_16_assembler.py"
alias htop="powershell ntop"
function tux {
    cat ~/.tux.txt;
}
alias screenfetch="powershell screenfetch"
alias make="/c/MinGW/bin/mingw32-make.exe";
export PATH=/c/mingw/bin:"$PATH"
export PATH=/c/Users/dfalzone/.cargo/bin:"$PATH"
export PATH=/c/Program\ Files/LLVM/bin:"$PATH"
export PATH=/c/Program\ Files/Pandoc:"$PATH"
export PATH=/c/Users/dfalzone/AppData/Local/Packages/PythonSoftwareFoundation.Python.3.7_qbz5n2kfra8p0/LocalCache/local-packages/Python37/Scripts:"$PATH"
export PATH=/c/Program\ Files\ \(x86\)/clisp-2.49/:"$PATH"

# Alias for the C# compiler
alias csc="/c/Windows/Microsoft.NET/Framework/v4.0.30319/csc.exe"

function gitsync {
    git add --all;
    git commit -m "$1";
    git push origin master;
}

alias mpl="python ~/ncndi/mpl_interpreter.py"

source ~/foo.sh; source ~/browser.sh;

# Function allowing you to run single commands through CMD.EXE
function cmdc {
    printf "$1\r\nexit\r\n" | CMD.EXE;
}

# Alias to output readable Assembly
alias gccasm="gcc -g -masm=intel -S -fverbose-asm"
