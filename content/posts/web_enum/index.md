---
title: "Web Enumeration "
date: 2020-10-22T12:40:28+01:00
lastmod: 2021-05-30T12:40:28+01:00
draft: false

tags: ["reconnaissance", "enumeration", "Nmap", "Web Shells" ]
categories: ["Academic Year 2020-21"]

author: "Jack Orcherton" 
authorLink: "https://jackorcherton.github.io"

---

In this session, we will look at website enumeration and exploitation. This is what we'll cover in further detail:

- What is Enumeration?
- Directory Brute Forcing
- Checking Comments & Common Files
- Directory Traversal
- Google Dorking (basics)
- Server Fingerprinting & Other Tools
- Web Shells

### Resources
- [Presentation Slides](webEnumeration.pdf) 
- [Live Session Recording](https://www.twitch.tv/videos/779063041) 

## What is Enumeration?
Enumeration is the process of going through a list, one by one in order to find information. This is used in hacking to find information to leverage an attack.

### Directory Enumeration
This is when you use a wordlist to try to 
guess the names of web pages/directories. The reason for this is:

- It allows you to build a sitemap/understand layout
- Find hidden directories

Popular tools include: Dirb/Dirbuster, nmap's http-enum script. 


## Code Comments & Common Files
It can be surprising, the kind of comments that can make it into a product:
- Credentials
- API keys
- Software Versions
- infrastructure layout & the occasional bit of profanity!

All this information can then all be helpful in the exploitation phase. 

Common files (as defined by RFC rules) are locations where useful information about a website is stored
- **.well-known/** - normally contains information regarding software, such as PGP keys. Also, many sites have a text file stored on .well-known/security.txt which tells you how to report security flaws. 
- **robots.txt** - this is a very good place to check and is used by webmasters to tell search engines which pages not to index - this can intern reveal the location of admin portals. For an example check this [sites robots.txt](/robots.txt)
- **Sitemap.xml** - another way to improve SEO - it shows the layout of a website - check [ours here](/sitemap.xml). 
- **/wp-admin/** - shows the website runs WordPress, so you can check out vulnerabilities related to this platform. 

Also make sure that you check any interesting results from website enumeration, like pages with http authentication.

## Google Dorking
This is where you use the magic of Google do all the work for you. This is because you can use the following keywords to find out information from websites:

- site: specify domain
- filetype: specify a file extension, good files to look for are pdf, docx and database extensions as they can leak personal information 
- inurl: search for URLs which contain a keyword
- intext: search for pages with keywords in the body
- insite: search for pages with keywords in the body & headers
- intitle: search for pages with a keyword in the title
- cache: view Google archived versions of the page
- “search term” – search for that exact    word or phrase

## Another Type of Search Engine
Shodan & ZoomEye:
- Searches and indexes devices on the internet (from IoT to web servers)
- Attempts to see what services devices are running
- Tests to see if they are running default credentials

WARNING: these services can give credentials on how to access devices – please don’t do this without permission of the owner as it can be classed as hacking!

## Server Fingerprinting & Other Tools
Can be used to find out about the software a server is running:
- Nikto
- Nessus
- Zap
- Burpsuite
- Wappalyzer

## Exploitation
We won't delve deep into exploitation phase this week, however we will look into the following concepts (and they may be helpful in this week's challenges hint hint)

### Directory Traversal
This is an age old attack, found on PHP servers. It occurs when you see addresses like https://example.com?file=test.txt and is used to fetch files and render them in your browser.

So what could be the problem? Well the above is just a file path, so as long as you know a valid file path, you may be able to fetch any file. So examples are:
- https://example.com?file=.. /.. /.. /etc/passwd - can be used to find usernames
- https://example.com?file=.. /.. /root/flag.txt - can be used to find root flag files

### Web Shells 
Probably one of the most useful ways to exploit a webserver and is where you can upload a shell - allowing command execution. This can be done by either file upload or via uploading to an anonymous FTP server (but there are also other methods). 

There are two main webshells that I recommend the first being p0wny@shell:~#. This is the friendlier of the two as you can access it via a Web page, however it has less features (but are more than adequate for this weeks challenge). 

The second of the two is my favourite and is the Pentest Monkey Reverse TCP shell. The downside to this is that you have to edit the file to include your attacking IP address and port number, as well as setting up a netcat feature. The benefits of this though is that you can react with it through your command line.

## The Challenge
- Open Kali Terminal
```sh
sudo docker run --name csw1 --rm cuehcomsec/2-webenumeration
```
- Find web server port using nmap (the port will change everytime
you run it!)
- There are 8 flags to find & submit them on [Ctfd](https://cueh-comsec.ctfd.io/) format cueh{flag#sometext}
- To end the docker type 
```sh
docker kill csw1
```

The writeup will be released next week. 

## Extra Challenges
If you would like more challenges related to this week's topics, we recommend:

- [Google Dorking (THM)](https://tryhackme.com/room/GOOGLEDORKING)
- [RootMe (THM)](https://tryhackme.com/room/rrootme) 
