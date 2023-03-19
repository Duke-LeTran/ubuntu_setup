`sudo netstat -lpn | grep <port_number>` - checks which app is using that port
    * `-l` `--listening`: Show only listening sockets. (These are omitted by default.)
    * `-p`, `--program`: Show the PID and name of the program to which each socket belongs.
    * `-n`, `--numberic`: Show numerical addresses instead of trying to determine symbolic host, port or user names.

# Concepts
## TCP vs UDP
TCP (Transmission Control Protocol) and UDP (User Datagram Protocol) are two of the most commonly used protocols for transmitting data over the internet. The main difference between TCP and UDP is that TCP is a connection-oriented protocol, while UDP is a connectionless protocol12

TCP is more reliable than UDP because it guarantees the delivery of data packets to the destination. It also ensures that the packets are delivered in the correct order. However, this reliability comes at the cost of speed. TCP is slower than UDP because it has to establish a connection between the sender and receiver before transmitting data12

UDP, on the other hand, is faster than TCP because it does not establish a connection before transmitting data. This makes it ideal for applications that require speed over reliability, such as online gaming and video streaming. However, because it does not guarantee the delivery of data packets, some packets may be lost during transmission12

Let me know if you need more information on this topic.