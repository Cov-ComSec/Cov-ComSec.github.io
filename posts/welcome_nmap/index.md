# ComSec Introduction


This week is the first session of the academic year, and we will cover:

- What is ComSec?
- Network Scanning with Nmap
- Introduction to TryHackMe

### Resources

- [Presentation Slides](nmap.pdf)
- [Live Session Recording](https://www.twitch.tv/videos/772154140) 
- Docker-Compose Challenges
    - [Challenge 1](c1/docker-compose.yaml)
    - [Challenge 2](c2/docker-compose.yaml)

## What is ComSec? 
Firstly, welcome to ComSec, we are the university's unofficial ethical hacking society. This year the club will be led by second year students Jack Orcherton, Martin Schon and Tiago Pascoal.

As a society, our main aims are to:
- Learn & practise new cybersecurity/ethical hacking skills
- Organise and compete CTF competitions on an international stage (we do this under the team name ethical slackers and have previously taken part in RuCTFe among others) 
- Create a warm and welcoming environment which is beginner and pro friendly and to share our skills from people across the University.

### Interested in Joining? 
It is free to join our society, to join just drop ComSec or one of the committee leaders an email (look us up in your university contacts). From there, we can provide you with more information.

Unfortunately, due to Covid restrictions, we are unable to meet in person - so, for the foreseeable future, all ComSec meetings will be held at 18:30 every Wednesday on Discord.

Cannot join us then? Do not worry! We aim to record sessions and provide materials here. Also, hacking challenges normally take place over the weekend - so it is still worth joining to keep in the loop.

Any further questions? Just drop us an email!

## Legal 
As I am sure you will have heard by now, there are some rules when it comes to hacking:
- These courses are to be **used only for ethical purposes**
- **Do not attack anything**, unless you have written consent from the owner
- If you are **unsure if you’re allowed to do something – you probably aren’t!** So ask someone beforehand

Please note we accept no liability, and you are responsible for your own actions. If in doubt, please consult the Computer Misuse Act 1990 or view your local equivalent.

## Hacker Mindset
To be successful at hacking, you must know how to think like hacker - below shows their thought process when targeting a machine:

- **Reconnaissance** - where you find information out about a target within the public domain.
- **Scanning and Enumeration** - finding more detailed information by scanning the target. 
- **Exploitation** - after finding a weakness in the above stages - you use it to gain access to a target. 
- **Maintaining Access** - now you need to ensure that no one can remove your access to the target. 
- **Covering Tracks** - finally, hackers do not wish to be caught so will attempt to remove evidence by deleting logs, etc. 

## Scanning and Enumeration 
Scanning and enumeration is a form of active reconnaissance and is used to find detailed information on a target - to find ways to exploit it. 

### Port Scanning 
One popular scan is a port/network scan. The point of this is to be able to identify targets IP addresses and their open ports (from this you can gleam some of the services/software a server uses). The most popular tool to do this is named Nmap. 

#### Why Port Scan? 

- First step on most challenges
- Find programs running on devices
- Find program versions and find associated vulnerabilities
- OS detection
- Easy to do

The main disadvantage is that it can be ‘loud’ and detected by IDS/IPS. 

#### Types of Scans
Due to different types of technologies, there are multiple ways to scan targets, the main ones are described below:

##### TCP Stealth Scan
TCP is a connection-oriented method used by most protocols (e.g., SSH, HTTP, HTTPS). It has the following stages known as a handshake:
- Syn – client device initiates and attempts to establish connection
- Syn-ack – server acknowledges receipt of syn
- Ack – client acknowledges receipt of syn-ack, and communication will start
- Fin – terminates connection

A TCP scan uses this to its advantage, it sends a syn packet and if a syn-ack packet is received, the port is open. The connection is then dropped, before the host fully recognises the connection. 

##### Ping Scan
Sends an ICMP packet to specified hosts, if there is a response, you know it is up.

##### UDP Scan
Sends UDP packet, if there is a response it is open, if there is no response it is open or filtered. If the port is unreachable, it is closed.

##### ARP Scan
Sends an ARP request and waits for responses.

##### Listening
Just listens to network traffic and can detect which devices are communicating.

## Nmap
Nmap is the most popular network scanner and installed on Kali by default. Here I will teach you the basics of how to use it.

### Common Arguments
- -A – runs OS detection, version detection, script scanning & traceroute.
- -T – set timing 0-5 (higher is faster but runs risk of being detected).
- -v/-vv – verbose mode – displays progress info in the terminal.
- -pn – skip host discovery – sometimes useful when devices will not respond to ICMP.
- -p – port selection (use –p- for all ports).
- -sV – find service & version running on the port.
- -F – fast mode, scans fewer ports compared to a normal scan.
- -O – OS detection.

For more options – run `man Nmap`.

Out of habit when I am hacking, I typically use the following command:

```
nmap -A -T4 -p- targetIP -vv
```

This means that it will scan all ports and enumerate everything.

### Today's Challenge
This week we will be using Docker - to run the challenges, firstly download them both from the resources area at the top - then do the following:

```sh
sudo apt install docker-compose
cd /location/of/downloaded/file
docker-compose up
```

Now complete the first challenge, then once completed type ctrl + c and repeat instructions for the second challenge. We will release a walk through later in the week.

## TryHackMe 
TryHackMe is an online platform aimed towards beginners & gives 
guided walkthroughs on challenges (if you are more advanced you 
may want to try HTB, more on this in the future).

Go to [TryHackMe](https://tryhackme.com/) & create the free account!

As a final challenge, try and complete the [nmap room](https://tryhackme.com/room/furthernmap).

