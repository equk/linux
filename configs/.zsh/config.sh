###

# Set Defaults
export EDITOR="vim"
#export BROWSER="firefox"
export BROWSER="google-chrome"
export HISTCONTROL="ignoredups"

# Set Aliases
alias update='yaourt -Syu'
alias clean='sudo sh ~/scripts/pacclean.sh'
alias mem='free -mot; sync && echo -n 3 | sudo tee /proc/sys/vm/drop_caches; free -mot'
alias diff='colordiff'
alias xorg='sudo subl /etc/X11/xorg.conf'
alias nano='nano -w'
alias ls='ls -hF --color=auto --group-directories-first '
alias df='df -h -T'
alias grep='grep -n --color=auto'
alias duf='du -skh * | sort -n'
# quick nmap scan over socks
alias pscan='proxychains nmap -sTV -PN -n -p21,22,25,80,3306,6667 '
# http server for testing static content
alias http='python2 -m SimpleHTTPServer 8080'
# minify style.css using cssutils from python
alias cssminify='cssparse -m style.css > style.min.css'
# start chrome with custom user without proxy for localhost testing (default setup but with livereload installed)
alias chromel='google-chrome --user-data-dir=$HOME/www/chrome_dev --no-proxy-server'

# Extract
extract () {
    if [ -f $1 ] ; then
case $1 in
            *.tar.bz2) tar xjf $1 ;;
            *.tar.gz) tar xzf $1 ;;
            *.bz2) bunzip2 $1 ;;
            *.rar) unrar x $1 ;;
            *.gz) gunzip $1 ;;
            *.tar) tar xf $1 ;;
            *.tbz2) tar xjf $1 ;;
            *.tgz) tar xzf $1 ;;
            *.tar.xz) tar xJf $1 ;;
            *.zip) unzip $1 ;;
            *.Z) uncompress $1 ;;
            *.7z) 7z x $1 ;;
            *) echo "'$1' cannot be extracted via extract()" ;;
        esac
else
echo "'$1' is not a valid file"
    fi
}

# Set path
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/dassault-systemes/draftsight/bin:/usr/bin/vendor_perl:/usr/bin/core_perl:~/.gem/ruby/2.0.0/bin:/opt/android-sdk/platform-tools
