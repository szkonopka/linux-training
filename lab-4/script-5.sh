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
  maxCpu = 0
  maxMem = 0

  for(user in users)
    {
      if(usercpu[user] > maxCpu)
        {
          maxCpu = usercpu[user]
          maxCpuUser = user
        }

      if(usermem[user] > maxMem)
        {
          maxMem = usermem[user]
          maxMemUser = user
        }
    }

  print "Biggest CPU usage: " maxCpuUser " with " maxCpu "%"
  print "Biggest memory usage: " maxMemUser " with " maxMem "%"
}'
