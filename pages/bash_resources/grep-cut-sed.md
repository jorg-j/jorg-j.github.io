## GREP

Used to find regex patterns in files

eg

    grep -i "foo" *.txt
    
Will locate all lines containing foo in all txt files


## SED

Stream Editor. Find/Replace

    sed -s "s/foo/baa/g" myfile.txt

Will find and replace foo with baa in myfile.txt

## Cut

Used to split lines by a delimiter. Note Delimiter is limited to 1 character

    cut -d"," -f2
    
Will cut the line at , and output field 2

