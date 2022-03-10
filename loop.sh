#!/usr/bin/bash
trap 'echo received int signal;exit 1' INT
trap 'echo received exit signal;exit 9' EXIT
while true
do
	echo "a"
	sleep 2
done
