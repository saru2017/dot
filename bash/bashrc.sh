alias sl='ls'

cd ~

#export PS1="$ "
if [ -n "$WSLENV" ]; then
   echo "WSL"
   export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ "
   export DISPLAY=localhost:0.0
elif [ `curl -m 5 -qf http://169.254.169.254/latest/meta-data/instance-id 2>/dev/null | grep "i-" | wc -l` -gt 0 ]; then
   echo "AWS"
   export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;31m\]\w\[\033[00m\]\n\$ "
   export DISPLAY=localhost:0.0    
elif [ `grep "model name" /proc/cpuinfo |grep Intel | wc -l` -gt 0 ]; then
   export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]\n\$ "
   export DISPLAY=localhost:0.0    
else
   export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;32m\]\w\[\033[00m\]\n\$ "
fi

export PATH=~/bin:$PATH

alias clip="xsel -b"
alias explorer="explorer.exe"

# Black       0;30     Dark Gray     1;30
# Red         0;31     Light Red     1;31
# Green       0;32     Light Green   1;32
# Brown       0;33     Yellow        1;33
# Blue        0;34     Light Blue    1;34
# Purple      0;35     Light Purple  1;35
# Cyan        0;36     Light Cyan    1;36
# Light Gray  0;37     White         1;37
