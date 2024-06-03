#!/usr/bin/env bash

# sets up arguments
FILENAME="$1"
NUMRECORDS="$2"
i=0

# clears the file just in case
> "$FILENAME"

# defines new function
gendataset()
{
    # uses awk to generate random signed 32-bit ints
    # and generate ascii strings one character at a time
    awk -v num_records="$2" '
        BEGIN {
            srand()
            for (i = 0; i < num_records; i++) {
                col1 = int(rand() * 2147483648)
                col2 = int(rand() * 2147483648)
                str = ""
                for (j = 0; j < 100; j++) {
                    str = sprintf("%s%c", str, int(rand() * 94 + 32))
                }
                print col1, col2, str
            }
        }' > "$1"

    # double check line/record count
    lines=$( wc -l < $1 )
    echo "$lines records created. "
}
#exports function so it can be called
export -f gendataset

# uses nohup to run in background without interruption
nohup bash -c "time gendataset $FILENAME $NUMRECORDS" &