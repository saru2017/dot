#!/bin/bash

verify_environment(){
    if [ -n "$WSLENV" ]; then
	tmux source ~/dot/tmux/tmux_win.conf
	exit
    elif [ `curl -m 5 -qf http://169.254.169.254/latest/meta-data/instance-id 2>/dev/null | grep "i-" | wc -l` -gt 0 ]; then
	tmux source ~/dot/tmux/tmux_aws.conf	
	exit
    elif [ `grep "model name" /proc/cpuinfo |grep Intel | wc -l` -gt 0 ]; then
	tmux source ~/dot/tmux/tmux_arm.conf	
	exit
    else
	tmux source ~/dot/tmux/tmux_default.conf
	exit
    fi
    
}

verify_environment
