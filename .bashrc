#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
alias ls='eza --icons always'
alias grep='grep --color=auto'
alias nv='nvim'
alias py='python3'
alias c='gcc'
alias cpp='g++'
alias rails="rails.ruby3.4"
alias ga='git add'
alias gc='git commit'
alias gp='git push'
PS1='[\u@\h \W]\$ '

##############################################################################

# Envs
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$DOTNET_ROOT:$PATH
export VISUAL=nvim
export EDITOR={$VISUAL}

##############################################################################

# starship
eval "$(starship init bash)"

# yazi
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}

# zoxide
eval "$(zoxide init --cmd cd bash)"

unset HISTFILE
export HISTSIZE=0
export HISTFILESIZE=0
set +o history
unset LS_COLORS
unset EZA_COLORS
