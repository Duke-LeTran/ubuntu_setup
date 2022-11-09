# How to kill all processes run by a user on Linux

* https://www.xmodulo.com/how-to-kill-all-processes-run-by-user-on-linux.html

```
pgrep -u user | sudo xargs kill -15
```

List of kill signals:

```
https://unix.stackexchange.com/questions/317492/list-of-kill-signals
```
