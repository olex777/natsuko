#!/data/data/com.termux/files/usr/bin/bash

cd ~/storage/downloads/natsuko || exit 1

# Очистити stage
git reset

# Додати лише дозволені файли
for file in *; do
    if [[ -f "$file" ]]; then
        case "$file" in
            *.json|*.sh|*.txt|*.docx)
                git add "$file"
                ;;
            *)
                echo "Пропущено: $file"
                ;;
        esac
    fi
done

# Створити index.txt
ls -lh --time-style=long-iso | awk '{if (NF>=9) print $9, $5}' > index.txt
git add index.txt

# Закомітити та запушити
git commit -m "Автоматичне оновлення з фільтром" && git push

