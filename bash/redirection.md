# Redirection

## Jump to:
[grep](https://github.com/anesta95/how_to_data_journalism/bash/redirection.md#grep)

## grep
Search text files for specific character sequences.

### Basic search
```bash
grep _pattern_ _filename_
```
When grep encounters a "pattern" in the file, it prints out the lines containing it.

Example: Find all files in our list of programs that had the word _zip_ embedded in the name.

```bash
ls /bin /usr/bin | sort | uniq | grep zip
```
Options for grep:
* `-i`, which causes grep to ignore case when performing the search (normally searches are case sensitive)
* `-v`, which tells `grep` to print only those line which do not match the pattern.

### Print to a file
Search for a string with quotes and output all lines to a file
```bash
grep "\"DUKES\",\"MICHAEL\",\"TYLER\"" absentee.csv > dukes.csv
```
### Recursively search a directory of files, first line only
Combining `head` and `grep` with a pipe allows you to chain commands, and the `-B1` flag allows you to output the file name.
```bash
head -1 ./*/*|grep -B1 'Hospital overall rating' > variable.txt
```

[▲ BACK TO NAV](https://github.com/anesta95/how_to_data_journalism/bash/redirection.md#jump-to)

