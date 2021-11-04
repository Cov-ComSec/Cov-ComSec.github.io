# Scanning and Enumeration


In this session we will begin to look at scanning and enummeration, and start to look at some of the associated tools.

## Warm Up - Getting help in the Terminal
Ever forgotten a command or switch in linux - here's two great ways to find help; all from the comfort of your terminal!

### --help
Virtually all commands in linux have built-in help, all you need to do is append `--help` to the end of your command. So for help with nmap, you would use

```sh
nmap --help
```

Now this can produce a lot of text output, so you may wish to add the grep command to filter the output. So for example, I wish to find out how to detect an operating system in a nmap scan

```sh
nmap --help | grep "OS "
```

### Man Pages
Man pages, short for manual, is a well manual for a specific command - to use it just type `man <command>`. This will generally display more information the --help. For example, to view the manual for nmap, type:

```sh
man nmap
```

To search the file press '/' and then enter your search term.

## Scanning
- Scanning is an essential tool in ethical hacking, and great for intelligence gathering.
- Allows us to gain an ‘image’ of what is happening.
- There are multiple types of scanning – Directory, Vulnerability, Network, Port, etc.
- This week we will focus of network and port scanning using Nmap (but please note there are alternatives).

### Legal
Scanning is seen as a form of an attack (as there are no other reasons why you would scan a device). This means that if you scan a device you do not have written or prior permission to use you could be convicted under the **Computer Misuse Act 1990**. Advice:
- Only scan IPs that you have prior written permission to scan.
- Only scan private IP’s as defined in RFC 1918.
- When using a VM use host-only networking - as this will prevent you from scanning external IPs.

### Networks and Why Scan?
A network is a group of interconnected computers, which are assigned an IP address. The whole point of scanning a network is to discover which IP addresses are in use across the network (so we can target them in the port scanning phase).
There are a few ways to go about this, each with pro’s and con’s:
- Wire-tap
    - Can be done by plugging a device into the network, or the functionality can be emulated by software like wireshark
    - Records each packet that passes it
    - Main advantage to this method it is quiet, hence useful for red teaming situations
    - Main disadvantage is that it can be slower and miss devices
- ARP Scan
    - The Address Resolution Protocol is used to find the MAC address of a computer on a local subnet
    - Main advantage of ARP is that it cannot be disabled in IPv4 and you can find out the manufacturer of each device
    - Main disadvantage is that you can only find devices on your local subnet
- Ping Sweep
    - This sends an ICMP request to every device on the network
    - If there is a response, a machine is at that address
    - As it is a layer 3 protocol, it can reach devices on other subnets (hence finding more)
    - Main disadvantage is that more and more devices will not respond to ping requests (so that they will not be discovered), for example this behaviour is blocked by default in Windows 10.

### Ports and Why Scan?
- Ports are used to separate network traffic between different - applications.
- There are two types of ports TCP & UDP
- There are 65535 & standards define what they normally do:
    - 0 – 1023 Well Known
    - 1024 – 49151 Assigned Ports
    - 49152 + Dynamic Ports 
- You can find ports that are open (and not blocked by the firewall)
- You can attempt to determine the software/application running that port and research associated vulnerabilities
- You can try to discover the hosts operating system

#### Types of Scan
- TCP Stealth Scan - `sudo nmap –sS {ip}`
- TCP Connect Scan - `nmap –sT {ip}`
- Ping Sweep - `nmap –sn {ip}`
- UDP Scan - `sudo nmap –sU {ip}`
- ARP Scan - `arp-scan {ip-network}`

## Challenge
Head to CTFd for this week's challenge and complete the Scanning and Enumeration section.

{{< admonition type=tip title="Write-Up" open=true >}}
To view the write-up for this week's challenge, please refer to the Nmap 2 challenge, on [this post](../welcome_nmap_writeup/#nmap-2)
{{< /admonition >}}

