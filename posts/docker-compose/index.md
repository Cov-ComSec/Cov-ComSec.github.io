# How-To: docker-compose


This year we will be using a lot of docker machines. They are like virtual machines, however slimed down, therefore using less resources and have smaller file sizes. We recommend running docker on your Kali Linux machine (or Debian based distribution), even though it can run on Windows, it can be temperamental at times. Therefore, this is a guide for Linux only.

## Installation
Firstly, ensure your system is fully up to date, then install the necessary packages.

```sh
$ sudo apt update && sudo apt upgrade
$ sudo apt install docker.io docker-compose
```

Now all the required software should be downloaded.

## Demonstration
Next you will need a docker-compose file - this just instructs docker on how to load the correct image. For this demonstration, we will use the file from the first week.

Below, we firstly create a new folder, download a docker-compose file then run it.

```sh
$ mkdir testDocker
$ cd testDocker
$ wget https://cov-comsec.github.io/posts/welcome_nmap/c1/docker-compose.yaml
$ sudo docker-compose up
Starting testdocker_ftp_1  ... done
Starting testdocker_ssh_1  ... done
Starting testdocker_smtp_1 ... done
Starting testdocker_web_1  ... done
Attaching to testdocker_ssh_1, testdocker_web_1, testdocker_smtp_1, testdocker_ftp_1
ftp_1   | Starting Pure-FTPd:
ftp_1   |   pure-ftpd  -c 30 -C 10 -l puredb:/etc/pure-ftpd/pureftpd.pdb -j -R -P localhost -p 30000:30059
web_1   | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 192.168.42.3. Set the 'ServerName' directive globally to suppress this message
web_1   | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 192.168.42.3. Set the 'ServerName' directive globally to suppress this message
web_1   | [Sun Jun 20 23:10:50.635898 2021] [mpm_prefork:notice] [pid 1] AH00163: Apache/2.4.25 (Debian) PHP/7.3.4 configured -- resuming normal operations
```
{{< admonition warning >}} 
Do not close this terminal window (otherwise docker will stop) – just open a new terminal 
window.
{{< /admonition >}}

### Finding the Right IP
Normally docker should assign itself to localhost (127.0.0.1), however this is not always the case – just have a look at the output from the docker-start command, and it should show you (see the demo above). To be able to attack all services, to complicate matters, you will have to change this IP – change the end number to a 1. E.g., 192.168.42.4 -> 192.168.42.1

### Shutting Down Docker
When you have finished & found all the flags (congratulations) go back to the terminal window running docker – press CTRL + C simultaneously. Sometimes this takes a minute or two – wait until all the machines say 'done'.

```sh
^CGracefully stopping... (press Ctrl+C again to force)
Stopping testdocker_web_1  ... done
Stopping testdocker_smtp_1 ... done
Stopping testdocker_ftp_1  ... done
Stopping testdocker_ssh_1  ... done
```

## Troubleshooting/Common Errors
Docker is an amazing piece of software - when it works! Unfortunately, it is prone to errors; here's how to fix the most common:
- **Error** - `E: Package 'python3-pip' has no installation candidate`
Answer: ensure pip is installed `apt install pip`.
- **Error** - `Pool overlaps with other one on this address space`
Answer: this means that another docker machine/service on your PC is using the same port. This problem can be solved by turning off said docker machine/service and running `sudo docker network prune`.

### General Advice/Tips
- Run the command as sudo.
- Ensure a file named 'docker-compose.yaml' exists in your present working directory.
- Restart docker machines - `sudo docker-compose restart` (must be run in the same folder as the docker-compose file).
- Run `sudo docker-compose kill` (must be run in the same folder as the docker-compose file) to force shutdown a machine.
- Try resetting IP addresses - `sudo docker network prune`.
- Restart VM – surprising what a reboot can do!
- Google the error or look at the man pages (`man docker-compose`).

