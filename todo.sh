#!/usr/bin/env bash
set -xe

TODO_EDITOR="${TODO_EDITOR:-/usr/local/bin/subl}"
TODO_LIST_DIR="${TODO_LIST_DIR:-$HOME/Documents/todo-lists}"
command -v "$TODO_EDITOR" >/dev/null 2>&1 || { echo >&2 "I require ${TODO_EDITOR} but it's not installed.  Aborting."; exit 1; }

monday() {
      date_binary_full_path=$(command -v date)
      date_binary=$(file -b "$date_binary_full_path")
      if [[ "$date_binary" =~ "Mach-O 64-bit executable x86_64" ]]; then
          date -v monday "$@"
      else
          date -d monday "$@"
      fi
}

friday() {
      date_binary_full_path=$(command -v date)
      date_binary=$(file -b "$date_binary_full_path")
      if [[ "$date_binary" =~ "Mach-O 64-bit executable x86_64" ]]; then
          date -v friday "$@"
      else
          date -d friday "$@"
      fi
}

# Create weekly to-do list from template
mkdir -p "$TODO_LIST_DIR"
pushd "$TODO_LIST_DIR"

FILE=to-do-$(monday '+%Y-%m-%d').txt
if [ -f "$FILE" ]; then
        echo "${FILE} already exists."
        "$TODO_EDITOR" "$FILE"
        exit 0
fi

MONDAY=$(monday +'%m/%d')
FRIDAY=$(friday +'%m/%d')

cat <<-EOF > "$FILE"
# To-do List $MONDAY - $FRIDAY
---
Active Projects:
-

Monday:
- [ ]

Tuesday:
- [ ]

Wednesday:
- [ ]

Thursday:
- [ ]

Friday:
- [ ]
EOF

"$TODO_EDITOR" "$FILE"

popd

