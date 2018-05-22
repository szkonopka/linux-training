ps aux | awk '
BEGIN {
  cpu=0
  memory=0
}
{
  cpu+=$3
  memory+=$4
} END {
  print "Total memory usage: " memory "\nTotal CPU usage: " cpu
}
'
