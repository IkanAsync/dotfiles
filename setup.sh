#!/usr/bin/env bash

cd ~/dotfiles/symlink || exit

BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y-%m-%d_%H-%M-%S)"
mkdir -p "$BACKUP_DIR"

for pkg in */; do
  pkg=${pkg%/}

  echo "==> Processing $pkg"
  while read -r line; do
    rel="${line#"$HOME"/}"
    if [ "$rel" = "$line" ]; then
      rel="$line"
    fi

    full="$HOME/$rel"

    if [ -e "$full" ] && [ ! -L "$full" ]; then
      echo "Backup: $full → $BACKUP_DIR/$rel"
      mkdir -p "$BACKUP_DIR/$(dirname "$rel")"
      mv "$full" "$BACKUP_DIR/$rel"
    fi
  done < <(stow -nv ~ "$pkg" 2>&1 | grep "existing target" | awk '{print $NF}')

  stow ~ "$pkg"
done

echo
echo "📌 Semua konflik dibackup ke: $BACKUP_DIR"
echo "📌 Semua dotfiles berhasil di-symlink secara aman"
