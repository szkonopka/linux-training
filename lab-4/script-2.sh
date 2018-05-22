ps aux | awk '
{
  size = split($11,separated,"/")
  print "User " $1 " has been running " $2 " COMMAND - " separated[size]
}
'
