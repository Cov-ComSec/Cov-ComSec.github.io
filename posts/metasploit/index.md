# Metasploit


Today, we will look at Metasploit; a widely used pen testing framework. Metasploit is a massive product and today we will focus on:
- What is Metasploit?
- What is msfconsole?
- What is Metasploitable2?
- Using Nmap in msfconsole
- Running an exploit using Metasploit

### Resources
- [Presentation Slides](metasploit.pdf)

{{< admonition tip >}}
In the examples, I run exploits against Metasploitable 2 (a deliberately vulnerable VM). You can download it [here](https://sourceforge.net/projects/metasploitable/files/Metasploitable2/).
{{< /admonition >}}

## What is Metasploit?
Metasploit is the world’s most used penetration testing framework made by 
Rapid7. It is installed by default on Kali Linux and has many different features/modes aimed at different areas (like 
msfvenom) but today we will be focusing on msfconsole.

The pro version is even better (but sadly priced outside a student’s budget).

## msfconsole
Msfconsole is the main command used to access the majority of Metasploit. Msfconsole is split into six core modules:
- Exploit – holds exploitation scripts. 
- Payload – holds shellcodes/other scripts handy after exploitation. 
- Auxiliary – mainly for scanning/checking a machine is vulnerable to an 
exploit. 
- Post – used after exploitation for privilege escalation/pivoting/maintaining access. 
- Encoder – used to hide payloads to avoid antivirus signature detection. 
- NOP – used for buffer overflow and ROP chain attacks. 

{{< admonition note >}} 
NB: not every module is installed by default – use `load <module>`. 
{{< /admonition >}}

## Metasploitable 2
Metasploitable 2 is a virtual machine made by Rapid7 (creators of Metasploit).  It is deliberately vulnerable and is used as a training resource.

Metasploitable is also packed full of other training programs like DVWA, which is a great way to practice website exploitation.

### Demo
I will now demonstrate how to use Metasploit by targeting the Metasploitable VM - so launch it as well as Kali.

#### Starting Metasploit 
To start Metasploit use the following:
```sh
msfdb init
msfconsole 
```

Remember if you get stuck you can type `?` at any time. 

#### Port Scanning
Let's discover what services are running on the Metasploitable machine. We will do this by scanning it with Nmap in msfconsole. To do this you must use `db_nmap` - then you can use all the usual Nmap flags. 

```sh
db_nmap -sV -vv machineIP
```

Let's start with the top service, FTP.

#### Searching
Now we have identified a service, let's use the search command to find an associated exploit.

```sh
search vsftpd
```

As there is only one exploit, let's select it and view the documentation.

```sh
use 0
view
```

#### Setting Up and Running Exploits 
Now we have viewed the documentation, we must set the following variables:
- RHOST - this sets the IP address of the target
- RPORT - this sets the port for the target (this only needs to be changed if the FTP server is running on a non-standard port). 

So, let's now set the variables and launch the exploit:

```sh
set RHOSTS machineIP
run
```

You should now receive a remote shell - congratulations you have just carried out your first exploit through Metasploit. 

## Challenge
This week, we have only looked at the scanning & exploitation process - next week we will look at post exploitation. But for today, return to the Nmap scan and pick a different port and try to gain access.

## Further Challenges
Have a go at completing the [Metasploit room on TryHackMe](https://tryhackme.com/room/rpmetasploit).

