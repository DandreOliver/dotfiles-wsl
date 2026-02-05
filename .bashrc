# This shit is WSL .bashrc bro
# ─────────────────────────────────────────────
# Prevent double sourcing
[[ -n "$BASHRC_LOADED" ]] && return
export BASHRC_LOADED=1

# ─────────────────────────────────────────────
# PATH tweaks (ORDER MATTERS)
export PATH="$HOME/.cargo/bin:$PATH"
[[ -d "$HOME/bin" ]] && export PATH="$HOME/bin:$PATH"
export PATH="$PATH:/mnt/c/Windows/System32"

# ─────────────────────────────────────────────
# History
export HISTSIZE=5000
export HISTFILESIZE=10000
shopt -s histappend

# ─────────────────────────────────────────────
# Fastfetch command
FASTFETCH_CMD="fastfetch --file /mnt/c/Users/c0mrade/Downloads/ascii_berzerk.txt"

# ─────────────────────────────────────────────
# Aliases
alias ll='ls -lah --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'

alias gohome='cd "/mnt/c/Users/c0mrade"'
alias gowsl="cd '/home/c0mrade007'"

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gd='git diff'

alias ..='cd ..'
alias ...='cd ../..'

# Windows executable example
alias journal='/mnt/c/Users/c0mrade/journal_locker/dist/journal_lock.exe'

# Fastfetch alias
alias ff='fastfetch --file /mnt/c/Users/c0mrade/Downloads/ascii_berzerk.txt'

# ─────────────────────────────────────────────
# Git branch helper
parse_git_branch() {
  git symbolic-ref --short HEAD 2>/dev/null
}

# ─────────────────────────────────────────────
# Prompt (dark + transparent friendly)
PROMPT_DIRTRIM=3
PS1='\[\e[38;5;81m\]\u\[\e[38;5;245m\]@\[\e[38;5;39m\]\h\[\e[38;5;245m\]\
\[\e[38;5;214m\]\w\
\[\e[38;5;168m\]$(git_branch=$(parse_git_branch); [[ $git_branch ]] && echo "  $git_branch")\
\[\e[0m\] \
\[\e[38;5;39m\]❯ \[\e[0m\]'

# ─────────────────────────────────────────────
# Show WSL distro name (e.g. [FEDORA])
if grep -qi microsoft /proc/version 2>/dev/null; then
    if [[ -f /etc/os-release ]]; then
        . /etc/os-release
        PS1="[${ID^^}] $PS1"
    else
        PS1="[WSL] $PS1"
    fi
fi

# ─────────────────────────────────────────────
# Fastfetch only once per shell session
if [[ -z "$FASTFETCH_SHOWN" ]] && command -v fastfetch &>/dev/null; then
    export FASTFETCH_SHOWN=1
    eval "$FASTFETCH_CMD"
fi

#. "$HOME/.cargo/env"


. ~/.nix-profile/etc/profile.d/nix.sh




