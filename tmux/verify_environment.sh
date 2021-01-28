#!/bin/bash

verify_environment(){
    if [ $HOSTNAME == saru-cf-rz ]; then
	tmux source ~/dot/tmux/tmux_win.conf
	exit
    else
	tmux source ~/dot/tmux/tmux_default.conf
    fi
}

verify_environment
