# ~/.zshrc file for zsh interactive shells.
# see /usr/share/doc/zsh/examples/zshrc for examples

setopt autocd              # change directory just by typing its name
#setopt correct            # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word

# hide EOL sign ('%')
PROMPT_EOL_MARK=""

# configure key keybindings
bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^U' backward-kill-line                   # ctrl + U
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action
# enable completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
# Preview de directorios con cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always $realpath'

# Preview de archivos con cat/bat (si tenés bat instalado)
zstyle ':fzf-tab:complete:*:*' fzf-preview 'bat --color=always --style=numbers --line-range=:50 $realpath 2>/dev/null || ls --color=always $realpath 2>/dev/null'
# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
#setopt share_history         # share command history data

# force zsh to show the complete history
alias history="history 0"

# configure `time` format
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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

configure_prompt() {
    prompt_symbol=@
    # Skull emoji for root terminal
    #[ "$EUID" -eq 0 ] && prompt_symbol=💀
    case "$PROMPT_ALTERNATIVE" in
        twoline)
            PROMPT=$'%F{%(#.blue.blue)}┌──${debian_chroot:+($debian_chroot)─}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))─}(%B%F{%(#.red.blue)}%n'$prompt_symbol$'%m%b%F{%(#.blue.blue)})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.blue)}]\n└─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} '
            # Right-side prompt with exit codes and background processes
            #RPROMPT=$'%(?.. %? %F{red}%B⨯%b%F{reset})%(1j. %j %F{yellow}%B⚙%b%F{reset}.)'
            ;;
        oneline)
            PROMPT=$'${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%B%F{%(#.red.blue)}%n@%m%b%F{reset}:%B%F{%(#.blue.blue)}%~%b%F{reset}%(#.#.$) '
            RPROMPT=
            ;;
        backtrack)
            PROMPT=$'${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%B%F{blue}%n@%m%b%F{reset}:%B%F{blue}%~%b%F{reset}%(#.#.$) '
            RPROMPT=
            ;;
    esac
    unset prompt_symbol
}

# The following block is surrounded by two delimiters.
# These delimiters must not be modified. Thanks.
# START KALI CONFIG VARIABLES
PROMPT_ALTERNATIVE=twoline
NEWLINE_BEFORE_PROMPT=yes
# STOP KALI CONFIG VARIABLES

if [ "$color_prompt" = yes ]; then
    # override default virtualenv indicator in prompt
    VIRTUAL_ENV_DISABLE_PROMPT=1

    configure_prompt

    # enable syntax-highlighting
    if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
 # enable syntax-highlighting
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
   
    # Elementos básicos
    ZSH_HIGHLIGHT_STYLES[default]=none
    ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,underline
    ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=blue,bold        # if, then, else, etc
    ZSH_HIGHLIGHT_STYLES[arg0]='fg=31,bold'             # Comandos principales (ls, cd, etc)
   
    # Aliases y precomandos
    ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
    ZSH_HIGHLIGHT_STYLES[global-alias]=fg=blue,bold
    ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline     # sudo, time, etc
   
    # Separadores y rutas
    ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=cyan,bold    # ; && || |
    ZSH_HIGHLIGHT_STYLES[path]=fg=208                     # Rutas de archivos
    ZSH_HIGHLIGHT_STYLES[path_pathseparator]=fg=cyan
    ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=blue,underline
   
    # Opciones y argumentos
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=208     # -a, -l, -r
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=208     # --help, --version
   
    # Strings y argumentos
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=green
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=green
    ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=green
   
    # Expansiones y sustituciones
    ZSH_HIGHLIGHT_STYLES[globbing]=fg=magenta,bold         # *.txt, ?.log
    ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold   # !!, !$
    ZSH_HIGHLIGHT_STYLES[command-substitution]=none
    ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
    ZSH_HIGHLIGHT_STYLES[process-substitution]=none
    ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
   
    # Variables y asignaciones
    ZSH_HIGHLIGHT_STYLES[assign]=fg=yellow
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=yellow,bold
    ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=yellow,bold
    ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=yellow,bold
   
    # Redirecciones y descriptores
    ZSH_HIGHLIGHT_STYLES[redirection]=fg=cyan,bold         # >, <, >>
    ZSH_HIGHLIGHT_STYLES[named-fd]=none
    ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
   
    # Comentarios
    ZSH_HIGHLIGHT_STYLES[comment]=fg=240,bold              # Gris para comentarios
   
    # Brackets y paréntesis (colores en niveles)
    ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=cyan,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=green,bold
    ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
fi
    fi
else
    PROMPT='${debian_chroot:+($debian_chroot)}%n@%m:%~%(#.#.$) '
fi
unset color_prompt force_color_prompt

toggle_oneline_prompt(){
    if [ "$PROMPT_ALTERNATIVE" = oneline ]; then
        PROMPT_ALTERNATIVE=twoline
    else
        PROMPT_ALTERNATIVE=oneline
    fi
    configure_prompt
    zle reset-prompt
}
zle -N toggle_oneline_prompt
bindkey ^P toggle_oneline_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*|Eterm|aterm|kterm|gnome*|alacritty)
    TERM_TITLE=$'\e]0;${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%n@%m: %~\a'
    ;;
*)
    ;;
esac

precmd() {
    # Print the previously configured title
    print -Pnr -- "$TERM_TITLE"

    # Print a new line before the prompt, but only if it is not the first line
    if [ "$NEWLINE_BEFORE_PROMPT" = yes ]; then
        if [ -z "$_NEW_LINE_BEFORE_PROMPT" ]; then
            _NEW_LINE_BEFORE_PROMPT=1
        else
            print ""
        fi
    fi
}

# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    export LS_COLORS="$LS_COLORS:ow=30;44:" # fix ls color for folders with 777 permissions

    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'

    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

    # Take advantage of $LS_COLORS for completion as well
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# enable auto-suggestions based on the history
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # change suggestion color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#4a90e2'
fi

# enable command-not-found if installed
if [ -f /etc/zsh_command_not_found ]; then
    . /etc/zsh_command_not_found
fi

alias ls='lsd'
alias cat='batcat --paging=never'
alias nano='micro'
export JAVA_HOME=/opt/temurin/jdk-21.0.7+6
export PATH=$JAVA_HOME/bin:$PATH

# ------------------------------------------------------------------------------
# Description
# -----------
#
# sudo or sudoedit will be inserted before the command
#
# ------------------------------------------------------------------------------
# Authors
# -------
#
# * Dongweiming <ciici123@gmail.com>
# * Hagen Graf - added vicmd binding
#
# ------------------------------------------------------------------------------

sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == sudo\ * ]]; then
        LBUFFER="${LBUFFER#sudo }"
    elif [[ $BUFFER == $EDITOR\ * ]]; then
        LBUFFER="${LBUFFER#$EDITOR }"
        LBUFFER="sudoedit $LBUFFER"
    elif [[ $BUFFER == sudoedit\ * ]]; then
        LBUFFER="${LBUFFER#sudoedit }"
        LBUFFER="$EDITOR $LBUFFER"
    else
        LBUFFER="sudo $LBUFFER"
    fi
}
# Generate CPG from binary
gencpg() {
    local binary="${1}"
    local output="${2:-./cpg.bin.zip}"
    local memory="${3:-3964m}"
    
    # Colors
    local GREEN='\033[0;32m'
    local RED='\033[0;31m'
    local YELLOW='\033[1;33m'
    local NC='\033[0m' # No Color
    
    if [ -z "$binary" ]; then
        echo -e "${RED}[!]${NC} Usage: gen_cpg <binary> [output] [memory]"
        return 1
    fi
    
    echo -e "${YELLOW}[*]${NC} Generating CPG for: ${GREEN}${binary}${NC}"
    echo -e "${YELLOW}[*]${NC} Output: ${output}"
    echo -e "${YELLOW}[*]${NC} Memory: ${memory}"
    
    /opt/joern/joern-cli/c2cpg.sh -J-Xmx${memory} "$binary" --output "$output"
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}[✓]${NC} CPG generated successfully"
    else
        echo -e "${RED}[✗]${NC} Error generating CPG"
        return 1
    fi
}

# Run Joern script on CPG
rjoern() {
    local cpg_file="${1}"
    local script="${2}"
    local output="${3:-output.txt}"
    local memory="${4:-100G}"
    
    # Colors
    local GREEN='\033[0;32m'
    local RED='\033[0;31m'
    local BLUE='\033[0;34m'
    local CYAN='\033[0;31m'
    local NC='\033[0m'
    
    if [ -z "$cpg_file" ] || [ -z "$script" ]; then
        echo -e "${RED}[!]${NC} Usage: run_joern <cpg_file> <script> [output] [memory]"
        return 1
    fi
    
    if [ ! -f "$cpg_file" ]; then
        echo -e "${RED}[✗]${NC} CPG file not found: ${cpg_file}"
        return 1
    fi
    
    if [ ! -f "$script" ]; then
        echo -e "${RED}[✗]${NC} Script not found: ${script}"
        return 1
    fi
    
    echo -e "${BLUE}[+]${NC} Running analysis..."
    
    joern --param cpgFile="$cpg_file" \
          --param outputFile="$output" \
          --script "$script" \
          -J-Xmx${memory}
    
    if [ $? -eq 0 ]; then
        echo ""
        echo -e "${GREEN}[✓]${NC} Analysis completed successfully"
        echo -e "${GREEN}[✓]${NC} Results saved to: ${CYAN}${output}${NC}"
    else
        echo ""
        echo -e "${RED}[✗]${NC} Error running analysis"
        return 1
    fi
}

export JAVA_HOME=$HOME/java/jdk-21.0.8+9
export PATH=$JAVA_HOME/bin:$PATH
eval "$(zoxide init zsh)"

alias gares='/home/eclypsium/.scripts/decompiler.sh'
alias rlfx='/home/eclypsium/.scripts/rlfx.sh'
alias bariants='/home/eclypsium/.scripts/build_variants.sh'
alias ghidra='/home/eclypsium/Documents/ghidra/ghidra_12.0_PUBLIC_20251205/ghidra_12.0_PUBLIC/ghidraRun'
alias pyghidra='/home/eclypsium/Documents/ghidra/ghidra_11.4.2_PUBLIC/support/pyghidraRun'
alias joerncpg='/opt/joern/joern-cli/c2cpg.sh -J-Xmx3964m'


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.local/bin:$PATH"
eval "$(starship init zsh)"
# Transient prompt
zle-line-init() {
    emulate -L zsh
    [[ $CONTEXT == start ]] || return 0

    while true; do
        zle .recursive-edit
        local -i ret=$?
        [[ $ret == 0 && $KEYS == $'\4' ]] || break
        [[ -o ignore_eof ]] || exit 0
    done

    local saved_prompt=$PROMPT
    local saved_rprompt=$RPROMPT
    PROMPT="%F{#38608f}%F{#bbc7db}❯%f "
    RPROMPT=""
    zle .reset-prompt
    PROMPT=$saved_prompt
    RPROMPT=$saved_rprompt

    if (( ret )); then
        zle .send-break
    else
        zle .accept-line
    fi
    return ret
}
zle -N zle-line-init
eval "$(zellij setup --generate-auto-start zsh)"

# opencode
export PATH=/home/eclypsium/.opencode/bin:$PATH
export OLLAMA_HOST=http://localhost:11434

ollama-local() {
  export OLLAMA_HOST=http://localhost:11434
  echo "Ollama now using local at $OLLAMA_HOST"
}

ollama-remote() {
  export OLLAMA_HOST=http://172.16.20.253:11434
  echo "Ollama now using remote at $OLLAMA_HOST"
}
