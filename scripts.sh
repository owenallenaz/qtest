#!/bin/bash

# checks if a program is running by exact match on executable name only
function program_is_running {
	echo $(_program_is_running x $1)
}

function program_is_running_fuzzy {
	echo $(_program_is_running f $1)
}

function _program_is_running {
	tmp=$(pgrep -$1 "$2" >/dev/null 2>&1; echo $?)
	if [ $tmp == 0 ]; then
		echo true
	else
		echo false
	fi
}

function program_is_installed {
	# set to 1 initially
	local return_=1
	# set to 0 if not found
	type $1 >/dev/null 2>&1 || { local return_=0; }
	# return value
	echo "$return_"
}
