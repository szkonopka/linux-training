# lists realpath of found files with symlinks
# copy file given in specified symlink to new t dir

links_dir="./lab2/a/e"
links_list=`ls $links_dir`
link_plik1="/home/samzon/Pulpit/$links_dir/../b/plik1"
link_plikA="/home/samzon/Pulpit/$links_dir/../../c/d/plikA"
sym_link_plikB_bez="link_plikB_bez"
new_dir="./lab2/t"

for file in $links_list
do
  content=`realpath $links_dir/$file`
  if [ -L $file ] || [[ $content -ef $link_plikA ]] || [[ $content -ef $link_plik1 ]]
  then
    echo $content
  fi

  if [ "$sym_link_plikB_bez" = "$file" ]
  then
    rm -rf ./lab2/t
    mkdir ./lab2/t
    cp -d "$links_dir/link_plikB_bez" $new_dir
  fi

  if [[ $content -ef $link_plikA ]]
  then
    cp $content $new_dir
  fi
done
