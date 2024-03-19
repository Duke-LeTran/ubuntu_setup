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

# IP Address

Note: The "Limited Broadcast" row does not have a specific pattern as it represents a special broadcast address for network discovery and service announcement.

This table provides a concise summary of the mentioned IP address types and their corresponding ranges or patterns.

| IP Address Class/Notation | IP Address Range           | Common Patterns       |
|---------------------------|----------------------------|-----------------------|
| Class A                   | 1.0.0.0 - 126.255.255.255 | 1.X.X.X               |
| Class B                   | 128.0.0.0 - 191.255.255.255 | 128.X.X.X, 172.16.X.X to 172.31.X.X |
| Class C                   | 192.0.0.0 - 223.255.255.255 | 192.168.X.X, other ranges |
| CIDR Notation             | Varies                     | Varies based on CIDR notation (e.g., 192.0.2.0/24) |
| IPv6 Addresses            | Varies                     | Alphanumeric patterns (e.g., 2001:0db8:85a3:0000:0000:8a2e:0370:7334) |
| Loopback Address          | 127.0.0.0 - 127.255.255.255 | 127.X.X.X                   |
| Private Local Networks    | 192.168.0.0 - 192.168.255.255 | 192.168.X.X                 |
|                           | 10.0.0.0 - 10.255.255.255   | 10.X.X.X                     |
| Automatic Private IP Addressing (APIPA) | 169.254.0.0 - 169.254.255.255 | 169.254.X.X           |
| Limited Broadcast         | 255.255.255.255            | N/A                         |
| Public IP Addresses       | Varies                     | Varies based on class or CIDR notation (e.g., 1.X.X.X, 128.X.X.X, 192.0.2.0/24) |


Please note that the CIDR Notation column represents a flexible range of addresses, and the actual patterns will depend on the specific CIDR notation used.

Keep in mind that this table provides a general overview, and IP address patterns can have variations based on regional allocations, network setups, and specific requirements.

| IP Address Type           | IP Address Range           | Common Patterns             |
|---------------------------|----------------------------|-----------------------------|
| Loopback Address          | 127.0.0.0 - 127.255.255.255 | 127.X.X.X                   |
| Private Local Networks    | 192.168.0.0 - 192.168.255.255 | 192.168.X.X                 |
|                           | 10.0.0.0 - 10.255.255.255   | 10.X.X.X                     |
| Automatic Private IP Addressing (APIPA) | 169.254.0.0 - 169.254.255.255 | 169.254.X.X           |
| Limited Broadcast         | 255.255.255.255            | N/A                         |
| Public IP Addresses       | Varies                     | Varies based on class or CIDR notation (e.g., 1.X.X.X, 128.X.X.X, 192.0.2.0/24) |

Classful IP Addressing:

Class A: Public IP addresses in Class A range from 1.0.0.0 to 126.255.255.255. The pattern is usually 1.X.X.X.
Class B: Public IP addresses in Class B range from 128.0.0.0 to 191.255.255.255. The pattern is often 128.X.X.X or 172.16.X.X to 172.31.X.X (reserved for private networks).
Class C: Public IP addresses in Class C range from 192.0.0.0 to 223.255.255.255. The pattern is commonly 192.168.X.X (reserved for private networks) or other ranges.
CIDR Notation: Classless Inter-Domain Routing (CIDR) allows for more flexible allocation of IP addresses. Public IP addresses in CIDR notation may have varying patterns based on the network size and allocation scheme. For example:

/24: 192.0.2.0/24 represents a range of 256 addresses from 192.0.2.0 to 192.0.2.255.
/16: 203.0.113.0/16 represents a range of 65,536 addresses from 203.0.113.0 to 203.0.113.255.
IPv6 Addresses: IPv6 introduces a new addressing scheme with much larger address space. Public IPv6 addresses follow a different pattern, which includes alphanumeric characters. For example:

2001:0db8:85a3:0000:0000:8a2e:0370:7334