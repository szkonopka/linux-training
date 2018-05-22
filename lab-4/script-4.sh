ps aux | awk '
BEGIN {
  usercpu[$1] = 0
  usercpu[$1] = 0
}
{
  users[$1]++
  usercpu[$1] += $3
  usermem[$1] += $4
}
END {
  for(user in users)
    { print "User: " user " - CPU: " usercpu[user] "% MEMORY: " usermem[user] "%" }
}'
