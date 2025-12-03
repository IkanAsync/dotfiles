source /usr/share/cachyos-fish-config/cachyos-config.fish

# Jika sedang tidak di dalam tmux, otomatis start tmux
if status --is-interactive
    # Cek apakah tmux sudah berjalan
    if not set -q TMUX
        # Cek apakah session default ada, jika tidak buat
        tmux attach -t default 2>/dev/null || tmux new -s default
    end
end

alias l='eza -lh --icons=auto'                                         # long list
alias ls='eza -1 --icons=auto'                                         # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto'                                       # long list dirs
alias lt='eza --icons=auto --tree'                                     # list folder as tree
alias fastfetch='fastfetch --logo-type kitty'

# Directory navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias nv=nvim
alias hms="home-manager switch --flake ~/dotfiles"
alias hm="home-manager"
alias ga="git add"

fish_add_path ~/.cargo/bin
fish_add_path ~/.nix-profile/bin
fish_add_path /home/ikanasync/.nix-profile/etc/profile.d/hm-session-vars.sh
set -x GOPATH $HOME/go

set -x PATH $GOPATH/bin $PATH
set -gx XDG_DATA_DIRS $HOME/.nix-profile/share $XDG_DATA_DIRS
zoxide init fish --cmd cd | source
