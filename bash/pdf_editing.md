# PDF Editing

## Jump to:
[pdftk](https://github.com/anesta95/how_to_data_journalism/blob/main/bash/pdf_editing.md#pdftk) |

## pdftk
A power tool for processing and converting PDF files.

### Combine files
```bash
pdftk *.pdf cat output all_documents.pdf
pdftk doc01.pdf doc02.pdf cat output all_documents.pdf
```
Combine all the PDF files in the present directory into a single file. Or specify individual files *Note: check to make sure the capitalization of the filetype matches.*

### Split files by page number
```bash
pdftk blue_docs.pdf cat 1-700 output blue_docs01.pdf
pdftk blue_docs.pdf cat 701-end output blue_docs02.pdf
````
Specify the page number or use the `end` keyword to slice up a document.

### Split a PDF portfolio
```bash
pdftk doj_emails_portfolio.pdf unpack_files output doj_emails
```
PDF portfolios contain a bunch of individual files bound up in a filetype that needs a native PDF reader. Get around this by unpacking each file into a specific directory.

### Split a PDF portfolio with attachments
```bash
pdftk doj_emails_portfolio.pdf unpack_files output doj_emails;
IFS=$'\n'; set -f
for f in $(find ./doj_emails/ -name '*.pdf'); do pdftk "$f" unpack_files output ./doj_emails/; done
unset IFS; set +f
```
If your PDF portfolio has attachements within the individual PDF, you can use your terminal to unpack the portfolio into a directory, then set up a loop to unpack all of the PDFs in that directory on by one (Thanks to this [Stackoverflow thread](https://stackoverflow.com/questions/4638874/how-to-loop-through-a-directory-recursively-to-delete-files-with-certain-extensi) for tips on bash recursion and dealing with spaces in filenames.)

[▲ BACK TO NAV](https://github.com/anesta95/how_to_data_journalism/blob/main/bash/multimedia_editing.md#jump-to)