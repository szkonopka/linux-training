# create symlinks to specified files in dir directory


if [ -e dir ]
then
  rm -rf dir
fi

mkdir dir
mkdir dir/a
mkdir -p dir/a/b
mkdir -p dir/a/e
mkdir -p dir/c/d

echo "test1" > dir/a/b/plik1
echo "test2" > dir/a/b/plik2
echo "testA" > dir/c/d/plikA
echo "testB" > dir/c/d/plikB

ln -s ../b/plik1 dir/a/e/link_plik1
ln -s ~/Pulpit/lab2/dir/a/b/plik1 lab2/a/e/link_plik1_bez

ln -s ../../c/d/plikA dir/a/e/link_plikA
ln -s ~/Pulpit/lab2/dir/c/d/plikB dir/a/e/link_plikB_bez

ln -s ../b/plik2 dir/a/e/link_plik2
ln -s ../../c/d dir/a/e/link_do_d

cat dir/a/e/link_plik1
cat dir/a/e/link_plik1_bez
cat dir/a/e/link_plikA
cat dir/a/e/link_plikB_bez
cat dir/a/e/link_plik2
ls -a dir/a/e/link_do_d
