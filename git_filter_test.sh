echo "Файли, які пройдуть фільтр:"; find ~/storage/downloads/natsuko -maxdepth 1 -type f -iname "*.json" -o -iname "*.docx" -o -iname "*.sh" -size -10M -print
