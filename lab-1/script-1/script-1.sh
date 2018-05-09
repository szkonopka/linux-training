#! /bin/bash
# updates names of the files in directory by adding .old at the end of a file name

clear
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

current_dir=`pwd`
echo "I will modify files in $current_dir/$1"
cd $1

rm *.old -f
for file in *
do
  if [ -w $file ] && [ "$file" != "script-1.sh" ]
  then
    mv $file $file.old
  fi
done
