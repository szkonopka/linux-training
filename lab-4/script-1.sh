ps aux | awk '
{
  print "User " $1 " has been running " $2 " (CPU = " $3 ", MEM = " $4 ")"
}
'
