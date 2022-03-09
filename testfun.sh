aa="aaaaaa"
function log_msg {
  local aa="bbbbbbb"
  echo "[`date '+ %F %T'` ]: $@"
  echo "${aa}"
}
log_msg "fuck!"
echo "${aa}"

food[0]=0
food[1]=1
food[4]=4
food[5]=''
food[6]=6
echo ${#food[@]}
echo "Bye"
