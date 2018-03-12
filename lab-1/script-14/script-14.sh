#! /bin/bash
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

for file in *
do
  echo $file
  if [ ! -d $file ] && [ -w $file ]
  then
    touch -m $file
  fi
done

ls -l > example_change
