#! /bin/bash
# delete all files with "~" character in name, which were created 0 - 2 minutes ago
# lists realpath of five found executable files (maximum depth directory is set to 2)

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

# deleting ~ files, which were created at least 2 minutes ago
find $1 -iname "*~" -type f -cmin -2 -delete

# find executable files which
find $1 -maxdepth 2 -type f -executable -print | head -n5 | while read file
do
  echo `realpath $file` | tr '/' '\\'
done
