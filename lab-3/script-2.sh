#! /bin/bash
# lists realpath and current date of five found executable files (maximum depth directory is set to 2), whose
# size is less than 64 bytes, moreover save result to file result3-2
# transform all lines from file by reversing them, moreover in current date signature
# transform . character to -

echo "You executed $0."
if [ $# -ne 1 ]
then
  echo "Wrong params amount."
  exit 1
fi

if [[ ! -d $1 ]]
then
  echo "$1 is not a directory."
  exit 1
fi

# find executable files which
rm -f $1/result3-2
touch $1/result3-2

find $1 -maxdepth 2 -type f -size -64c -executable -perm -111 -print | head -n5 | while read file
do
  path=`realpath $file`
  cur_date=`date '+%Y.%m.%d'`
  cur_time=`date '+%H:%M:%S'`
  result="$path | $cur_date | $cur_time"
  echo $result
  echo $result >> result3-2
done

while read -r name divider cur_date divider cur_time
do
  echo $cur_date | tr '.' '-'
  echo $cur_time
  echo $name
done < $1/result3-2
