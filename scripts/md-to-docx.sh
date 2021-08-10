#!/usr/bin/env bash
# Requires pandoc and npm installed

npx liquidjs <"$1" |  # convert the liquid into normal markdown
    sed -E 's|(\!\[.*\]\(.*\))|\1\\\|g' |  # add a backslash behind images to prevent pandoc from adding figure captions
    sed -E 's|(\!\[.*\]\(.*\))|\1{ width=205px }|g' | # add width information
    pandoc -o "$(basename "$1" .md).docx" -L scripts/pandoc-html-to-docx.lua # use pandoc to convert the page


