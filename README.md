# todo.sh
Create simple to-do lists for each new week.

# Installation
Drop the latest version into your $PATH.
```shell
sudo curl -o /usr/local/bin/todo -L https://github.com/tbordovsky/todo.sh/releases/download/v0.1.0-alpha/todo.sh && \
sudo chmod +x /usr/local/bin/todo
```

# Environment
You can point the script at whatever editor you prefer and whichever directory you want to write to.

| env           | default                      |
|---------------|------------------------------|
| TODO_EDITOR   | /usr/local/bin/subl          |
| TODO_LIST_DIR | "$HOME"/Documents/todo-lists |
