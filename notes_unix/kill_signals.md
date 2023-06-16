| Signal | Number | Description |
|--------|--------|-------------|
| SIGTERM | 15 | Requests a graceful termination of the process. |
| SIGKILL | 9 | Forces an immediate termination of the process. |
| SIGINT | 2 | Interrupts the process, similar to pressing Ctrl+C. |
| SIGQUIT | 3 | Quits the process, similar to pressing Ctrl+\. |
| SIGSTOP | 19 | Stops the process, preventing it from running or consuming resources. |
| SIGCONT | 18 | Continues the process if it was stopped by a SIGSTOP or SIGTSTP signal. |
| SIGTSTP | 20 | Stops the process, similar to pressing Ctrl+Z. |
| SIGHUP | 1 | Hangs up the process, usually when the controlling terminal or process dies. |
| SIGALRM | 14 | Alarms the process, usually after a timer expires. |