#!/usr/bin/bash

for i in word1 word2 word3; do
  echo $i
done

for i in "$@" ; do
  echo $i
done


select brand in Samsung Sony iphone symphony Walton
do
  echo "You have chosen $brand"
done
