# Text Processing

## Jump to:
[cat](https://github.com/anesta95/how_to_data_journalism/blob/main/bash/text_processing.md#cat) | [sort](https://github.com/anesta95/how_to_data_journalism/blob/main/bash/text_processing.md#sort) | [wc] (https://github.com/anesta95/how_to_data_journalism/blob/main/bash/text_processing.md#uniq)


## cat

### Print (concatenate) contents of a file
```bash
cat filename.txt
```

### Write contents of subsequent terminal input to text file
```bash
cat > foo.txt
```

### Print output of file with linenumbers and surpress multiple blank lines
```bash
cat -ns foo.txt
```

## sort

`sort` sorts the contents of standard input, or one or more files specified on the command line, and sends the results to standard output.

### Sort the contents of standard input or a file

```bash
sort foo.txt
```

### Merge multiple files into a single sorted file

```bash
sort file1.txt file2.txt file3.txt > final_sorted_list.txt
```

### Sort options

* -r = sort in reverse order
* -f = make sorting case-insensitive
* -n = perform sorting based on the numeric evaluation of a string
* -m = treat teach arg as the name of a presorted file. Merge multiple files into a single sorted result without performing additional sorting
* --output=_file_ = send sorted output to _file_ rtaher than standard output
* --field-separator=_char_ = define the field-separator character. By default fields are separated by spaces or tabs
* -b = ignore leading spaces in lines and calculates sorting based on the first non-whitespace character on the line.
* --key=_field1[,field2]_ = sort based on a key field located from _field1_ to _field2_ rather than the entire line

## uniq