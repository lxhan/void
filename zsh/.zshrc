export ZSH=$HOME/.oh-my-zsh

# start gui
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	exec startx
fi

# theme
ZSH_THEME="agnoster"

# to remove name from prompt
DEFAULT_USER=$USER

# plug
plugins=(
    git
    compleat
    cp
    copyfile
    copydir
    extract
    history
    colored-man-pages
    colorize
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# aliases
alias v="nvim"                                                                                                     
alias py="python3"                                                                                                
alias pip="pip3"
alias xi="sudo xbps-install -S"
alias xq="sudo xbps-query -R"
