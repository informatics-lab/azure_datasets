#! /usr/bin/env bash
set -e

HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Upload 'LICENCE.txt'."
az storage blob upload \
    --account-name $BIG_4_STORAGE_ACCOUNT \
    --container-name $BIG_4_CONTAINER \
    --file "${HERE}/LICENCE.txt" --name LICENCE.txt \
    --sas-token $BIG_4_LICENCE_SAS \

echo "Parse README.md to HTML."
python $HERE/md2html.py --title "Read Me" \
    --markdown_file $HERE/README.md \
    --output_file $HERE/README.html

echo "Upload 'README.html'."
az storage blob upload \
    --account-name $BIG_4_STORAGE_ACCOUNT \
    --container-name $BIG_4_CONTAINER \
    --file "${HERE}/README.html" --name README.html \
    --sas-token $BIG_4_README_SAS \
    --content-type "text/html"

echo "Completed deployment."