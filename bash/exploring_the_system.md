# Exploring the System

## Jump to:
[file](https://github.com/anesta95/how_to_data_journalism/blob/main/bash/exploring_the_system.md#file) | [less](https://github.com/anesta95/how_to_data_journalism/blob/main/bash/exploring_the_system.md#less) 

## file

### Determining a file's type

Determining the filetype of a file titled `filename.jpg` in the current working directory.
```bash
file filename.jpg
```

## less

The `less` command is a program to view text files. 

```bash
less filename
```

### `less` Commands
* PAGE UP or b = Scroll back one page
* PAGE DOWN or space = Scroll forward one page
* Up arrow = Scroll up one line
* Down arrow = Scroll down one line
* G = Move to the end of the text file
* 1G or g = Move to the beginning of the text file
* /characters = Search forward to the next occurance of `characters`
* n = Search for the next occurance of the previous search
* h = Display help screen
* q = Quit less 