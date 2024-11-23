for file in *annotated*.pdf; do
    mv "$file" "$(echo "$file" | sed 's/ annotated.*\.pdf/.pdf/')"
done
