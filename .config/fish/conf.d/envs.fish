# Environment variables
set -gx EDITOR nvim
set -Ux PYTHONHISTFILE /dev/null
set -gx DOTNET_ROOT $HOME/.dotnet

# Paths
set -gx PATH \
    $HOME/.dotnet \
    $HOME/.cargo/bin \
    $HOME/.local/bin \
    /usr/sbin \
    /usr/local/bin \
    /usr/bin

# Etc
set -e LS_COLORS
set -e EZA_COLORS
