# Path to zsh config directory
ZSH=$HOME/.zsh
# exec main zsh configs
source $ZSH/source.sh
source $ZSH/config.sh
# Zsh Theme
source $ZSH/themes/equk.zsh-theme
# Set plugins
plugins=(git github archlinux python virtualenv)
