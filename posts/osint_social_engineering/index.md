# OSINT & Social Engineering



This week, I gave an introductory talk on open-source intelligence (OSINT) and social engineering. We also delved into the theories of why social engineering can be a successful attack and why humans are vulnerable to it!

### Resources
- [Presentation Slides](SocialEngineering.pdf)

## OSINT 
Open-Source Intelligence is the art of finding information from publicly available sources. This is crucial in pen testing (as the more you know about the company you are hacking – the easier it can become).

The main benefit of OSINT is that it is a form of passive reconnaissance (so legal) as all information is already in the public domain.


{{< admonition warning >}}
Although it is legal to access documents in the public domain, you must be wary of stalking rules and people's right to a private life (see the [Human Rights Act 1998 Article 8](https://www.legislation.gov.uk/ukpga/1998/42)).
{{< /admonition >}}

### Good Places
- Google
- Social Media
- Electoral-role
- Companies House
- Wayback Machine
- GitHub Repositories
- Sherlock
- Maltego

## Image Metadata
What is in the image can provide useful information, like:

- Employee badge number
- Signs (to tell location)
- Confidential documents
- What is on their computer screen (may give away confidential information/IT programs & systems they use)
- Faces (can you identify anyone?)

An image can paint a thousand words, well at least the metadata can; the sort of thing you can find is:
- Location data
- Device type
- Dates

### Viewing Metadata
To view metadata in Linux, I recommend using exiftool:

```
exiftool image.png
```

Or on Windows you can view the image properties (but please note this will not always show all the metadata fields).

## Old Websites & GitHub Repositories
Ever accidently published private information to a website – well 
it may have been cached by either Google or Wayback Machine.

Ever done the same to GitHub? Check old Git commit history!

## Social Engineering - Hacking the Mind

This is the art of tricking people into trusting you or doing things that they would not normally do. It normally involves you making people believe you have authority (hi Vis Test - see below).

This is because we like to be trusting and helpful to others (generally). For example, if someone helps you, you are more likely to help them.

### Why
The reason why this works is because humans are creatures of habit and have a cognitive bias. This means that our brains will make subconscious decisions for us. Below are some of the theories around this topic if you would like to find out more:

- Stereotyping
- ‘Going with the Group’
- Bias Blindness
- Matching
- Social
- Resistiveness
- Confirmation Bias

### Uses in the Real World 
- Scams
- Phishing
- Gaining unauthorised access (tailgating)

### Uniform
One joke for social engineers is that you will need a Hi Vis jacket, but why is that the case?

Many believe that Hi Vis jackets make people look more authoritative and official - therefore they are more likely to listen to them. To prove this point comedian and scientist Eline van der Velden donned a jacket and clipboard; then asked random people to complete ridiculous requests - see the results below.

{{< youtube 4jcleVvgchs >}}

#### The Milgram Experiment
The above was done to prove a point and builds on more historic research.

In 1963 Stanley Milgram investigated the difference between obedience and free will. The main reason for this was at the time the Nuremberg War Criminal trials were taking place; and many people argued they carried out genocides as they were just following orders.

The experiment worked by attaching someone to an electric shock machine. Then a volunteer had to ask that person questions; if they got one wrong, they would have to administer an electric shock - each one progressively worse. If the volunteer declined, they were told they must by an authoritative figure.

In a similar experiment, Milgram repeated it with people wearing uniform - one was with the authoritative figure wearing a grey lab coat and one wearing plain clothes. 20% more people would listen to the person wearing the lab coat.

For more information about this experiment, I recommend you read my source - [an article written by Saul McLeod on Simply Psychology](https://www.simplypsychology.org/milgram.html)


## The Challenge
This week's challenges can be found on the [CTFd server](https://cueh-comsec.ctfd.io/challenges) - there are two sections to complete:
 - OSINT
    - OSINT the picture
    - Identify the device that took the pictures
    - Find the flag hidden in GitHub, hidden in the ComSec website repo
- Complete the Office Space challenges on CTFd

## Go Further
- Research more cognitive biases
- Look at [TraceLabs](https://www.tracelabs.org/)
- Complete the [OSINT room on TryHackMe](https://tryhackme.com/room/ohsint)

