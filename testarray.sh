#!/usr/bin/bash -x
arr=([5]=a [9]=b [23]=c)

# arr[5]=a arr[9]=b arr[23]=c
#i++ <=> i=i+1; i-- 等同于 i=i-1

for ((i = 0; i < ${#arr[@]}; i++)); do
    echo ${arr[$i]}
done

for j in  ${!arr[@]}  # ${!arr[@]} : 5 9 23
do
     echo ${arr[$j]}
done
