# remove .txt files and copy files with given extension to selected directory

import sys
import os
import re
import shutil

if len(sys.argv) < 3:
    sys.exit()

source_dir = sys.argv[1]
extension = sys.argv[2]
destination_dir = sys.argv[3]

here = os.path.dirname(os.path.realpath(__file__))

txt_file_reg = r'^.*?\.txt$'
my_ext_file_reg = r'^.*?\.%s$'

current_dir_list = os.listdir(source_dir)

files = filter(os.path.isfile, current_dir_list)

for f in files:
    if re.match(txt_file_reg, f):
        os.remove(f)
    if re.match(my_ext_file_reg % extension, f):
        shutil.copyfile(f, os.path.join(here, destination_dir, f))
