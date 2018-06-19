# make a copy of given file in selected directory

import sys
import os

if len(sys.argv) < 3:
    sys.exit()

with open(sys.argv[1], 'r') as source:
    try:
        copy_amount = int(sys.argv[3])
    except ValueError:
        print("Third parameter should be an integer.")
        sys.exit()

    here = os.path.dirname(os.path.realpath(__file__))

    destination_dir = sys.argv[2]

    for i in range(0, copy_amount):
        new_file_name = str(i) + "-" + sys.argv[1]
        new_file_dest = os.path.join(here, destination_dir, new_file_name)
        source.seek(0)
        with open(new_file_dest, 'w') as destination:
            for line in source:
                if line:
                    destination.write(line)
            destination.close()

    source.close()
