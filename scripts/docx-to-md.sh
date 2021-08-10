#!/usr/bin/env bash

# Requires pandocd

name="$(basename "$1" .docx)"
filename="_tutorials/$name.md" 

cat << EOF > "$filename"
---
title: $name
layout: tutorial
lang: en
---

EOF


pandoc "$1" -t markdown_mmd --extract-media "./assets/images" | # use pandoc to convert docx into multimarkdown
    sed -E 's|<img src="(.*)" style=".*" alt="(.*)" />|![\2](\1)|g' | # convert <img> tags to markdown
    sed -E "s@\!\[(.*)\]\(\./assets/images/media/(.*)\)@![\1]({{ \"/assets/images/$name/\2\" | relative_url }})@g" >> "$filename" # convert image src to jekyll /assets/images/$name/xxx
    # perl -p0e "s/(\!\[.*?\]\(.*?\))\{.*?\}/\1/sg;" # use perl to remove the image width & height info

mv "assets/images/media" "assets/images/$name" # renamve the "media" folder to $name
    
