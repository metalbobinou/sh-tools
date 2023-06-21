#! /bin/sh

ls -1 ./*jpg | xargs -L1 -I {} img2pdf {} -o {}.pdf

pdftk *.pdf cat output combined.pdf

### Add OCR text
#pypdfocr combined.pdf
## OR
#ocrmypdf combined.pdf combined_ocr.pdf#
