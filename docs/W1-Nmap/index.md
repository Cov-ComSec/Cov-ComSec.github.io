# Week 1 - Nmap & THM
[Session Video](https://www.twitch.tv/videos/772154140) | [Presentation](/1-Nmap.pdf)

## Topics Covered
- What is comsec?
- Nmap, types of scans & common commands
- Intro to THM

## Welcome to ComSec!
Before starting this week, you will need to ensure that you have a virtual machine setup. We will be using Kali linux throughout the society, as it contains most of the tools that we will use. If you need a hand setting up your virtual machine, [view the guide](/vmSetup.pdf)

## This Weeks Challenges
This week we will be using Docker - if this is new to you, [view our guide & troubleshooting advice - Docker for Dummies!](/DockerforDummies.pdf)
### Challenge 1
In this challenge, you will learn to use Nmap to identify running services, then finding the 2 flags hidden within the machine.
#### Instructions
- Create a new suitable folder on your kali VM 
```bash 
mkdir filename
```
- Navigate to that folder 
```bash
cd filepath
```
- Run the following command to fetch the docker file 
```bash
wget https://Cov-ComSec.github.io/Week1-Nmap/d1/docker-compose.yaml
```
- To start the container, run:
```bash
sudo docker-compose up
```
- If you have issues refer to the in-depth guide above!
### Challenge 2
In this challenge, you will need to run Nmap to identify services, as they are running on more unusual ports. As well as this, you will need to gain access to the root account using a privilage esculation attack. This machine has **2 flags**, but note that the first flag is the same as the first challenge.
#### Instructions
- Follow steps above to create a new folder (note if you change the docker-compose file name this will not work)
- Run the following command to fetch the docker file 
```bash
wget https://Cov-ComSec.github.io/Week1-Nmap/d2/docker-compose.yaml
```
- Start the container

**Remember to submit your flags to the [CTFd server!](https://cueh-comsec.ctfd.io/)**