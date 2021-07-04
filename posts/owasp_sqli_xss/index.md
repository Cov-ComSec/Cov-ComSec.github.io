# Web Exploitation & OWASP


This week we will begin to look at website exploitation, using the OWASP top 10. The main areas we will cover are:
- Good notes, and their importance 
- Making notes with Markdown
- What is website exploitation?
- Introduction to OWASP top 10
- SQL Injection
- Sqlmap
- Cross-Site Scripting (XSS)
- Sensitive Data Exposure

### Resources 
- [Presentation Slides](webExploit.pdf)

## Note Taking
Effective hacking requires a thorough and methodological approach. Additionally, in the workplace you will have to report findings to clients and be able to work with others. Finally, they are useful as a point of reference in the future.

They don't have to be long and laborious - short and sweet can be best (such as recording command outputs). For an example of good note checking, [have a look at this by Dan](https://github.coventry.ac.uk/CUEH/DansALLNotes).

## Markdown
All three of the ComSec committee uses Markdown - this is a simplistic language great for taking notes. Personally, I prefer it to other options because of code fences with syntax highlighting and, as it is open source, many programs can display it in its formatted form. Finally, it is easy to export Markdown to different formats, e.g. All the content on this website has been exported to HTML from Markdown.

### Editor Choice
As said above, you can open/use multiple programs to edit ComSec articles. Here are some of our favourites:
- Joplin - Martin's and my favourite 
- Obsidian.md - Tiago's favourite 
- Visual Studio Code - great for making changes for files or don't want them stored in a central location. I also use VS Code to write assignments in Markdown

### Markdown Syntax

```
• (Mostly) The same syntax as Discord/GitHub (due to slightly different implementations)
• # Make a Heading
• ## Make a smaller header (can use up to six #)
• *make this italic*
• **make this bold**
• ***make this bold & italic***
• [Enter text](enter hyperlink)
• ![Image name](image hyperlink)
• Inline embed: `test`
• ```python 
print("Format this code like Python")
```Example of code fences
```



## Web Exploitation 
Website exploitation is when you can make a website act in a way it shouldn't; typically, with the aim of gaining access to the underlying system or 'protected information'.

### OWASP
The Open Web Application Security Project (OWASP) is a non-profit organisation that, every four years, releases a list named The OWASP Top 10.  This list shows the most critical flaws that can be found in websites. The current list, released in 2017 is:

1) Injection
2) Broken Authentication
3) Sensitive Data Exposure
4) XML External Entities
5) Broken Access Control
6) Security Misconfigurations
7) Cross Site Scripting (XSS)
8) Insecure Deserialization
9) Using components with known vulnerabilities
10) Insufficient Logging and Monitoring

These are important to look for when creating/pen testing websites as they can lead to easy targeting.

## Injection Attacks
This is the most critically rated website vulnerability and is where an attacker can convince a user input box to run a command/code. The most common form of injection attacks target SQL databases.

### SQL Injection
SQLi (SQL Injection) is a form of attack which allows you to carry out commands on an underlying database. This can be dangerous, especially when the database contains private information.

So, let's examine some SQL that you may use for a login page

```SQL
SELECT * FROM userTable WHERE username=userinput
```

For normal usage this would be fine, as this is what would be formed during normal usage:

```SQL
SELECT * FROM userTable WHERE username="jack" 
```

And if a database entry is found, you could log in. The problem occurs when a malicious payload is entered, like `" OR 1=1; - -`. This would form the following:

```SQL
SELECT * FROM userTable WHERE username="" OR 1=1; --";
```

This would print out the whole table as 1=1 equates to true and -- comments out the rest of the statement.

There are also further payloads that can be used, but we'll cover this another time, as we must move on.

### Sqlmap
As great as exploiting manually is, sometimes it is best to use prebuilt tools to automate the process; the most notable being sqlmap. The general command is

```sh
sqlmap –a –u ‘http://example.com’
```

This runs all scripts against an URL. For more granular control, use `--help ` to find the right flags.

## Cross Site Scripting (XSS)
This is when clients can inject html commands into an input field. The problem with this is that they can use this to execute JavaScript code. 

This type of exploit can typically be found on web forums. The easiest way to test this is to attempt to create an alert box.

```html
<script>alert("demo XSS exploit") </script>
```

There are also more ways to run JavaScript as it can sometimes be possible to bypass XSS protections. The best way to check is to a fuzzer and the XSS payload list from Seclists.

### More than just a popup?
With JavaScript you can do more evil things:
- Steal cookies & send them to a remote server (could lead to session hijacking)
- Deface websites (E.g., create tech support scam pop-ups)
- Preform actions on behalf of the user (such as transactions)
- Create iframes – this can allow you to embed different webpages into one
another. One use of this could be to spoof a login page (so instead of logging in they send credentials to your server) – great for phishing!
- Capture keystrokes
- Read all the data on a victim's webpage (could reveal sensitive information).

Please note that this was a quick intro to a larger topic, if you wish to find out more, I recommend [this article](https://pentest-tools.com/blog/xss-attacks-practical-scenarios/).

## Sensitive Data Exposure
This is when websites accidently expose/leak sensitive data. This could be:
- In transit – using HTTP/unencrypted communication. 
- Having public S3 buckets/insecure databases. 
- Leaving keys in Git repositories / view previous website archives. 
- Using unprotected/default passwords
- Leaving API keys/admin credentials in code comments

So, in essence it is anywhere where private data can be exposed.

## Challenge
This week's challenge is to:

- use [DVWA](https://dvwa.co.uk/) – this can be run locally or on [THM (need an account)](https://tryhackme.com/room/dvwa) 
- Start hacking the SQL & XSS challenges
- Enter flags you find on the ComSec CTFd

## Further Challenges

- [THM OWASP Room](https://tryhackme.com/room/owasptop10)
