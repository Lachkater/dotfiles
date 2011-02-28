# ------------------------------------------------------
# file:     $HOME/.zshrc
# author:   Ramon Solis - http://cyb3rpunk.wordpress.com
# modified: February 2011
# vim:fenc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=sh:
# ------------------------------------------------------

# -------
# History
# -------
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=666
export SAVEHIST=$HISTSIZE

# ----------
# Completion
# ----------
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit
autoload -U incremental-complete-word
zmodload zsh/complist 

zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $HOME/.zshcache
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always
zstyle ':completion:*:pacman:*' force-list always
zstyle ':completion:*:*:pacman:*' menu yes select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# -----
# Paths
# -----
export PATH="/bin:/sbin:/usr/bin:/usr/sbin:$HOME/Scripts:$PATH"

# ------
# Colors
# ------
if [[ $TERM != "linux" ]]; then
export GREP_COLORS="38;5;230:sl=38;5;240:cs=38;5;100:mt=33;1;38;5;161:fn=38;5;197:ln=38;5;212:bn=38;5;44:se=38;5;166"
export LS_COLORS="*.tar.bz2=38;5;226:*.tar.xz=38;5;130:*PKGBUILD=48;5;233;38;5;160:*.html=38;5;213:*.htm=38;5;213:*.vim=38;5;142:*.css=38;5;209:*.screenrc=38;5;120:*.procmailrc=38;5;120:*.zshrc=38;5;10:*.bashrc=38;5;120:*.xinitrc=38;5;10:*.vimrc=38;5;120:*.htoprc=38;5;120:*.muttrc=38;5;120:*.gtkrc-2.0=38;5;120:*.fehrc=38;5;120:*.rc=38;5;120:*.md=38;5;130:*.markdown=38;5;130:*.conf=38;5;148:*.h=38;5;81:*.rb=38;5;192:*.c=38;5;110:*.diff=38;5;31:*.yml=38;5;208:*.pl=38;5;178:*.csv=38;5;136:tw=38;5;003:*.chm=38;5;144:*.bin=38;5;249:*.pdf=38;5;203:*.mpg=38;5;38:*.ts=38;5;39:*.sfv=38;5;191:*.m3u=38;5;172:*.txt=38;5;192:*.log=38;5;190:*.swp=38;5;241:*.swo=38;5;240:*.theme=38;5;109:*.zsh=38;5;173:*.nfo=38;5;113:mi=38;5;124:or=38;5;160:ex=38;5;197:ln=target:pi=38;5;130:ow=38;5;208:fi=38;5;006:so=38;5;167:di=01;5;33:*.pm=38;5;197:*.pl=38;5;166:*.sh=38;5;190:*.patch=38;5;37:*.tar=38;5;118:*.tar.gz=38;5;172:*.zip=38;5;11::*.rar=38;5;11:*.tgz=38;5;11:*.7z=38;5;11:*.mp3=38;5;173:*.flac=38;5;166:*.mkv=38;5;115:*.avi=38;5;114:*.wmv=38;5;113:*.jpg=38;5;66:*.jpeg=38;5;67:*.png=38;5;68:*.pacnew=38;5;33"
fi

# ----
# Mode
# ----
#bindkey -v                      # Set vi mode
bindkey -e                       # Set emacs mode

# -------
# Options
# -------
setopt extended_glob             # Extended glob 
setopt interactive_comments      # Allow comments in shells
setopt auto_cd                   # Change directory magic
setopt complete_in_word          # 
setopt no_beep                   # Don't beep on errors
setopt hist_ignore_all_dups      #
setopt hist_ignore_space         #
setopt hist_reduce_blanks        # Remove blanks from history
setopt correct_all               # Command correction in a line
setopt promptsubst               
setopt no_clobber                # Don't overwrite files when redirect
setopt always_to_end             # when complete from middle, move cursor

# --------
# ENV VARS
# --------
export EDITOR='/usr/bin/vim'       \
       VISUAL='/usr/bin/vim'       \
       BROWSER='/usr/bin/opera'    \
       SHELL='/bin/zsh'            \
       MANPAGER='/usr/bin/vimmanpager' \
       LANG='en_US.utf8'           \
       LC_ALL='en_US.utf8'         \
       LC='en_US.utf8'             \
       LESSCHARSET='utf-8'         \

# --------------------------
# Load aliases and functions
#---------------------------
[[ -r $HOME/.zsh_aliases    ]] && source $HOME/.zsh_aliases
[[ -r $HOME/.zsh_functions  ]] && source $HOME/.zsh_functions

# ------------
# Key bindings
# ------------
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\e[5D" backward-word
bindkey "\e[8~" end-of-line            # For rxvt
bindkey "\e[7~" beginning-of-line      # For rxvt
bindkey '^i' expand-or-complete-prefix # Completion in the middle of a line
bindkey '^z' undo                      # C-x-u is overkill
bindkey '^b' backward-word
bindkey ' ' magic-space                # Do history expansion on space
bindkey "^w" backward-delete-word
bindkey "^f" forward-word

# -----------------------
# Colors in TTY (Zenburn)
# -----------------------
if [[ $TERM == "linux" ]]; then
echo -en "\e]P01e2320" # zen-black (norm. black)
echo -en "\e]P8709080" # zen-bright-black (norm. darkgrey)
echo -en "\e]P1705050" # zen-red (norm. darkred)
echo -en "\e]P9dca3a3" # zen-bright-red (norm. red)
echo -en "\e]P260b48a" # zen-green (norm. darkgreen)
echo -en "\e]PAc3bf9f" # zen-bright-green (norm. green)
echo -en "\e]P3dfaf8f" # zen-yellow (norm. brown)
echo -en "\e]PBf0dfaf" # zen-bright-yellow (norm. yellow)
echo -en "\e]P4506070" # zen-blue (norm. darkblue)
echo -en "\e]PC94bff3" # zen-bright-blue (norm. blue)
echo -en "\e]P5dc8cc3" # zen-purple (norm. darkmagenta)
echo -en "\e]PDec93d3" # zen-bright-purple (norm. magenta)
echo -en "\e]P68cd0d3" # zen-cyan (norm. darkcyan)
echo -en "\e]PE93e0e3" # zen-bright-cyan (norm. cyan)
echo -en "\e]P7dcdccc" # zen-white (norm. lightgrey)
echo -en "\e]PFffffff" # zen-bright-white (norm. white)
fi

# ------
# Prompt 
# ------
function precmd {

    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 1 ))


    ###
    # Truncate the path if it's too long.
    
    PR_FILLBAR=""
    PR_PWDLEN=""
    
    local promptsize=${#${(%):---(%n@%m:%l)---()--}}
    local pwdsize=${#${(%):-%~}}
    
    if [[ "$promptsize + $pwdsize" -gt $TERMWIDTH ]]; then
        ((PR_PWDLEN=$TERMWIDTH - $promptsize))
    else
    PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize)))..${PR_HBAR}.)}"
    fi
}

setopt extended_glob
preexec () {
    if [[ "$TERM" == "screen" ]]; then
    local CMD=${1[(wr)^(*=*|sudo|-*)]}
    echo -n "\ek$CMD\e\\"
    fi
}


setprompt () {
    ###
    # Need this so the prompt will work.
    setopt prompt_subst

    ###
    # See if we can use colors.

    autoload colors zsh/terminfo
    if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
    fi
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
    done
    PR_NO_COLOUR="%{$terminfo[sgr0]%}"


    ###
    # See if we can use extended characters to look nicer.
    
    typeset -A altchar
    set -A altchar ${(s..)terminfo[acsc]}
    PR_SET_CHARSET="%{$terminfo[enacs]%}"
    PR_SHIFT_IN="%{$terminfo[smacs]%}"
    PR_SHIFT_OUT="%{$terminfo[rmacs]%}"
    PR_HBAR=${altchar[q]:--}
    PR_ULCORNER=${altchar[l]:--}
    PR_LLCORNER=${altchar[m]:--}
    PR_LRCORNER=${altchar[j]:--}
    PR_URCORNER=${altchar[k]:--}

}

if [[ $TERM != "linux" ]]; then
setprompt

    PROMPT='$PR_SET_CHARSET$PR_STITLE${(e)PR_TITLEBAR}\
$PR_CYAN$PR_SHIFT_IN$PR_ULCORNER$PR_CYAN$PR_HBAR$PR_SHIFT_OUT(\
$PR_BLUE%(!.%SROOT%s.%n)$PR_BLUE@%m:%l\
$PR_CYAN)$PR_SHIFT_IN$PR_HBAR$PR_CYAN$PR_HBAR${(e)PR_FILLBAR}$PR_CYAN$PR_HBAR$PR_SHIFT_OUT(\
$PR_GREEN%$PR_PWDLEN<...<%~%<<\
$PR_CYAN)$PR_SHIFT_IN$PR_HBAR$PR_CYAN$PR_URCORNER$PR_SHIFT_OUT\

$PR_CYAN$PR_SHIFT_IN$PR_LLCORNER$PR_CYAN$PR_HBAR$PR_SHIFT_OUT(\
%(?..$PR_LIGHT_RED%?$PR_CYAN:)\
${(e)PR_APM}$PR_YELLOW%D{%H:%M}\
$PR_LIGHT_CYAN:%(!.$PR_RED.$PR_WHITE)%#$PR_CYAN)$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_CYAN> '

    RPROMPT=' $PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_CYAN$PR_HBAR$PR_SHIFT_OUT\
($PR_YELLOW%D{%a,%b%d}$PR_CYAN)$PR_SHIFT_IN$PR_HBAR$PR_CYAN$PR_LRCORNER$PR_SHIFT_OUT$PR_NO_COLOUR'

    PS2='$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_BLUE$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT(\
$PR_LIGHT_GREEN%_$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT$PR_NO_COLOUR '
else 
    PROMPT=$'%{\e[0;34m%}%B[%b%{\e[0m%}%~%{\e[0;34m%}%B]%b%{\e[0;34m%}>%{\e[0m%} '
fi

################################# Based on http://bbs.archlinux.org/viewtopic.php?pid=549482#p549482 
