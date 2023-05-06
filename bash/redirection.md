# Redirection

## Jump to:
[grep](https://github.com/anesta95/how_to_data_journalism/blob/main/bash/redirection.md#grep) | [uniq](https://github.com/anesta95/how_to_data_journalism/blob/main/bash/redirection.md#uniq) | [wc] (https://github.com/anesta95/how_to_data_journalism/blob/main/bash/redirection.md#wc) | [head] (https://github.com/anesta95/how_to_data_journalism/blob/main/bash/redirection.md#wc)

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

[▲ BACK TO NAV](https://github.com/anesta95/how_to_data_journalism/blob/main/bash/redirection.md#jump-to)

## uniq
### Report or Omit Repeated Lines
`uniq` accepts a sorted list of data from either standard input or a single filename arguement and, by default, removes any duplicates from the list.

```bash
ls /bin /usr/bin | sort | uniq | less
```

`-d` flag will list duplicates instead.

[▲ BACK TO NAV](https://github.com/anesta95/how_to_data_journalism/blob/main/bash/redirection.md#jump-to)

## wc
### Print Line, Word, or Byte Counts

Default prints out three numbers: lines, words, and bytes. The `-l` option limits its output to report only lines.

```bash
ls /bin /usr/bin | sort | uniq | wc -l
```

[▲ BACK TO NAV](https://github.com/anesta95/how_to_data_journalism/blob/main/bash/redirection.md#jump-to)

## head
### Print First/Last Part of Files

The `head` command prints the first 10 lines of a file and `tail` the last 10 lines. The number of lines can be adjusted with the `-n` flag.

Using the `-f` flag allows `tail` to monitor a file and when new lines are appended, they immediately appear on the display.

```bash
tail -f /var/log/messages
```
[▲ BACK TO NAV](https://github.com/anesta95/how_to_data_journalism/blob/main/bash/redirection.md#jump-to)

