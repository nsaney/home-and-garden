# Herald
echo "Running `echo $SHELL`"

# Prompt
COLOR_GRAY=0
COLOR_RED=1
COLOR_GREEN=2
COLOR_YELLOW=3
COLOR_BLUE=4
COLOR_MAGENTA=5
COLOR_CYAN=6
COLOR_WHITE=7
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
PS1='\n$(echoExitLine "$?")\n'
PS1="$PS1"'['"$(promptColor $COLOR_CYAN '\u')"
PS1="$PS1"'@'"$(promptColor $COLOR_MAGENTA '\h')"
PS1="$PS1"':'"$(promptColor $COLOR_YELLOW '\w')"']\n'
PS1="$PS1"'['"$(promptColor $COLOR_BLUE '\D{%F %T}')"']$ '  
PS1="$PS1"`echo -e '\[\e]2;Terminal: \w\a\]'`

