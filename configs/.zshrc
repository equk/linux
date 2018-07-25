# Path to zsh config directory
ZSH=$HOME/.zsh
# exec main zsh config
source $ZSH/config.sh
# startx if no session
if [ "x$DISPLAY" = "x" ]; then
    exec startx
fi
# load everything in lib
for config_file ($ZSH/lib/*.zsh); do
  source $config_file
done
