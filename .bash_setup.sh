# .bash_setup.sh -- gets called from .bashrc, which gets sourced by both login and non-login shells

# Herald
echo "Running $(echo "${SHELL}")"

# Java
export JAVA_HOME="$(which javac | xargs -r readlink -f | xargs -r dirname | xargs -r dirname)"
echo "JAVA_HOME=${JAVA_HOME}"

# Prompt
export COLOR_GRAY=0
export COLOR_RED=1
export COLOR_GREEN=2
export COLOR_YELLOW=3
export COLOR_BLUE=4
export COLOR_MAGENTA=5
export COLOR_CYAN=6
export COLOR_WHITE=7
function colorClrEol() {
    echo -e '\e[K'
}
function colorStop() {
    echo -e '\e[0m'
}
function colorBg() {
    echo -e '\e[10'"$1"'m'
}
function colorFg() {
    echo -e '\e[9'"$1"'m'
}
function promptColor() {
    local color="$1"
    local text="$2"
    echo -e '\['"$(colorFg $color)"'\]'"$text"'\['"$(colorStop)"'\]'
}
function echoExitLine() {
    local exitCode="$1"
    local exitLineBg="$COLOR_GREEN"
    local exitLineFg="$COLOR_GRAY"
    if [ "$exitCode" -ne "0" ]; then
        exitLineBg="$COLOR_RED"
        exitLineFg="$COLOR_WHITE"
    fi
    echo -e "$(colorBg $exitLineBg)""$(colorFg $exitLineFg)""$exitCode""$(colorClrEol)""$(colorStop)"
}
export PS1='\n$(x="$?"; echoExitLine "$x" 2>/dev/null || echo "$x")\n'
export PS1="$PS1"'['"$(promptColor $COLOR_CYAN '\u')"
export PS1="$PS1"'@'"$(promptColor $COLOR_MAGENTA '\h')"
export PS1="$PS1"':'"$(promptColor $COLOR_YELLOW '\w')"']\n'
export PS1="$PS1"'['"$(promptColor $COLOR_BLUE '\D{%F %T}')"']$ '
export PS1="$PS1""$(echo -e '\[\e]2;Terminal: \w\a\]')"

