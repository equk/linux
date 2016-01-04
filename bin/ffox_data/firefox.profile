# Firejail profile

# Profile For Custom Mozilla Firefox Profile
# Sandbox also enables seccomp

# Do Not Blacklist Custom Profile Path
noblacklist ${HOME}/.ffox_profiles/default
# includes
include /etc/firejail/disable-mgmt.inc
include /etc/firejail/disable-secret.inc
include /etc/firejail/disable-common.inc
include /etc/firejail/disable-devel.inc

caps.drop all
seccomp
protocol unix,inet,inet6
netfilter
noroot

# profile
whitelist ${HOME}/.ffox_profiles/default
# download location
whitelist ${HOME}/Downloads

# blacklist
blacklist /boot
blacklist /mnt
blacklist /root
blacklist /srv

# common
whitelist ${HOME}/.fonts
whitelist ${HOME}/.fonts.d
whitelist ${HOME}/.fontconfig
whitelist ${HOME}/.fonts.conf
whitelist ${HOME}/.fonts.conf.d
