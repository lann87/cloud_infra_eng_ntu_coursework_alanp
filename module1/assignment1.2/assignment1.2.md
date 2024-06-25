## Assignment ### Brief

Use a Terminal Commands to answer the following questions. Your answer should consist the command you use and the output. You may simply copy and paste your terminal's content into the respective code blocks.

Question 1: Get the IP Address of `skillsunion.com`.

```sh
skillsunion.com has address 165.22.244.85
```

Question 2: Determine the network latency of `skillsunion.com`?

```sh
PING skillsunion.com (165.22.244.85) 56(84) bytes of data.
64 bytes from 165.22.244.85: icmp_seq=1 ttl=50 time=34.6 ms
64 bytes from 165.22.244.85: icmp_seq=2 ttl=50 time=34.8 ms
64 bytes from 165.22.244.85: icmp_seq=3 ttl=50 time=43.4 ms
64 bytes from 165.22.244.85: icmp_seq=4 ttl=50 time=39.5 ms
64 bytes from 165.22.244.85: icmp_seq=5 ttl=50 time=37.7 ms

--- skillsunion.com ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4007ms
rtt min/avg/max/mdev = 34.614/38.003/43.364/3.237 ms
```

Question 3: Identify all devices on the path between your computer to `skillsunion.com`.

```sh
tracepath skillsunion.com
 1?: [LOCALHOST]                      pmtu 1500
 1:  ip-172-20-10-1.ap-southeast-1.compute.internal        1.143ms 
 1:  ip-172-20-10-1.ap-southeast-1.compute.internal        0.872ms 
 2:  no reply
 3:  ip-172-20-27-113.ap-southeast-1.compute.internal     42.761ms 
 4:  169.246.65.202.unknown.m1.com.sg                     35.068ms 
 5:  ip-192-168-2-3.ap-southeast-1.compute.internal       34.270ms 
 6:  234.245.65.202.unknown.m1.com.sg                     39.835ms 
 7:  38.246.65.202.unknown.m1.com.sg                      38.836ms 
 8:  162.246.65.202.unknown.m1.com.sg                     37.859ms 
 9:  no reply

to: all displayed no reply

30:  no reply
     Too many hops: pmtu 1500
     Resume: pmtu 1500 

```

Question 4: Look up the DNS of `skillsunion.com` without using `nslookup`.

```sh
;; ANSWER SECTION:
skillsunion.com.	36	IN	A	165.22.244.85
```

Question 5: Find out the `whois` details of `skillsunion.com`.

```sh
Domain Name: skillsunion.com
Registry Domain ID: 2443102751_DOMAIN_COM-VRSN
Registrar WHOIS Server: whois.namecheap.com
Registrar URL: http://www.namecheap.com
Updated Date: 2023-09-14T03:50:23Z
Creation Date: 2019-10-13T04:16:35Z
Registry Expiry Date: 2026-10-13T04:16:35Z
Registrar: NameCheap, Inc.
Registrar IANA ID: 1068
Registrar Abuse Contact Email: abuse@namecheap.com
Registrar Abuse Contact Phone: +1.6613102107
Domain Status: clientTransferProhibited https://icann.org/epp#clientTransferProhibited
Name Servers:
  - dns1.registrar-servers.com
  - dns2.registrar-servers.com
DNSSEC: unsigned
```
 
