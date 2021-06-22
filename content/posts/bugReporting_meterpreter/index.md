---
title: "Bug Reporting & Meterpreter"
date: 2021-02-10T12:40:28+01:00
draft: false

tags: ["Metasploit", "Meterpreter", "Metasploitable2", "Bug Reporting"]
categories: ["Academic Year 2020-21"]

author: "Jack Orcherton" 
authorLink: "https://jackorcherton.github.io"

---

This week we will continue from the Metasploit session and explore Meterpreter, but firstly we will look at bug reporting.

### Resources
- [Presentation Slides](bug_meterpreter.pdf)

## Bug Reporting
Due to the current working at home predicament, it can be hard for lecturers and us to debug issues. Unfortunately receiving messages containing 'it doesn't work' is unhelpful and time wasting. Therefore, in this session we will cover how to bug report.

{{< admonition type=tip open=true >}} 
Remember, before asking for help to attempt to try and solve the problem yourself (such as reading documentation, trying our top 5 mistakes and Ducking for answers). 
{{< /admonition >}}

When completing a bug report, ensure you cover the 5w's and one h

### Who?
For this question think who wrote this code/who would be the best person to ask? Normally, you can find the author commented at the top of the code, otherwise contact the person that handed you the code.

Next think what the best way is to reach them. For example, most lecturers prefer contact via emails.

### What?
Normally, people have written loads of code and may not be able to tell what it is from a single screenshot; so explicitly state where you got the code from. E.g., the code from week 2, demo 3 for module 123CT does not work.

### Where?
State on which operating system you are trying to run the code on, such as Arch, Windows 10, Kali, Parrot, etc. also it will be helpful to mention how you are running the operating (is it bare metal, WSL, or a virtual machine).

Finally mention the interpreter or compiler that you are using (e.g., Python Interpreter 3.8).

### When?
For this one you need to answer, 'when does the error occur?'. For example, does the code crash as soon as you run it? Or is it after a particular input? (If it is, please share what you typed for the input).

### Why?
Why does the error occur? Here it would be useful to include the full error code/message and the area of the code that crashes. 

### How?
How have you tried to solve the issue? Did you try searching for solutions on the Internet, did you implement any of them? And what happened? 

## Top 5 Ethical Hacking Mistakes
We all make mistakes, which is fine, however being able to troubleshoot is an invaluable skill; so, before filing bug reports have a look at these top 5 mistakes:

1) **Spelling** - when coding, you must remember to spell variables in the same way. Another spelling error can occur due to inconsistencies between American and British spellings - this can then cause code not to function; an example of this is 'colour' and 'color'.
2) **Permissions** - when running some commands in Linux, you will need to run the command as an administrator (aka Super User). One example of this is you need to have admin permission to run anything on the common ports. Thankfully, this is a quick fix in Linux, and all you need to do is add `sudo` before the command or if you are using the fancy new Z shell, just type `sudo !!` and it will automatically run the last command as root.
3) **Networking & VM's** - a common issue when using virtual machines is choosing the right networking mode. If you wish to access the internet; we recommend that you use 'NAT' networking but be careful when typing IPs as you now run the risk of scanning the wrong machine (and if you do, you can face legal consequences from the owner). If you are trying to run a network between two VMs, you must ensure that they are both in the same networking mode.
4) **Python Version** - hackers seem to be increasingly turning to Python to run proof of concepts in Python - but you must ensure that you run it in the right version. Currently, there are two major branches of Python; Python2 (which is now deprecated) and Python3. Unfortunately, Python2 cannot run Python3 code and vice versa, therefore if the code will not run in one version, try it in the other. A quick way to tell the Python version is to look at the print statements; in Python3 print statements look like this `print("Hello World")` and in Python2 they are as follows `print "hello world"` (notice without brackets).
5) **Missing Python Module** - if you receive a 'submodule cannot be found error', then you probably will need to install it (have a look at using pip).

## Meterpreter
Meterpreter is an interactive shell, made specifically for hackers and contains useful features (more on this later). As it is a shell, you can use your typical Linux commands (even if the attackers machine runs Windows - but note all commands may not work). An example of some of these commands are:
- cd
- ls
- pwd
- ps
- cat

### Additional Commands
Meterpreter has also included some of its own commands, here are a few of them:
- **upload** - upload a file to target. 
- **download** - download a file from the target. 
- **search** - allows you to search the target PC.
- **getuid** - display the current user ID
- **getsystem** - automatically attempts to gain administrator access. 
- **hashdump** - dumps the hashed passwords for all users on a Windows system. 
- **clearev** - clears all the logs on a Windows System (helping to avoid detection/hiding actions you have carried).
- **idletime** - displays how long the user has been idle (so you can schedule intensive tasks when the user is not using the PC).
- **migrate** - allows you to change to a different process on the system.
- **webcam_snap** - attempts to grab a picture from the targets webcam and saves it in your pwd as a JPEG image.
- **shell** - drops you to the target systems default shell.

## Challenge
Today we will continue to use Metasploitable2 from the last session, try to use Meterpreter and have a go!

After practicing with Metasploitable, have a go at completing the [Ice Room on TryHackMe](https://www.tryhackme.com/room/ice).
