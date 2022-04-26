#!/usr/bin/bash
arr=([5]=a [9]=b [23]=c)
# arr[5]=a arr[9]=b arr[23]=c
for ((i = 0; i < ${#arr[@]}; i++)); do
    echo ${arr[$i]}
done
