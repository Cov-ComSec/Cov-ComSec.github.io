# CUEH ComSec Website
Welcome to the offical website for Coventry University's Ethical Hacking Society. We wish to use this as a platform to document and share what we do! For more information, have a look at our site https://cov-comsec.github.io

## Mistakes/Suggestions
Unfortunately we are ethical hackers, and not graphics designers (we are used to spending 90% of our time in terminals), so if you have a suggestion to improve our content, let us know! We are also only human, so there is a high likelihood that we have made a syntax error  on a webpage or presentation or have a bug in a piece of code or challenge.
If you spot an error in our site/or have a suggestion, please either:
 - [Fork the repository](https://github.com/Cov-ComSec/Cov-ComSec.github.io), correct the error & create a pull request.
 - Create an [issue on GitHub](https://github.com/Cov-ComSec/Cov-ComSec.github.io/issues).
All editors will be credited (unless you wish to remain anonymous).

# Development
The rest of this readme file will detail the technical documentation on how to develop the site.

## Branches
- **gh-pages** - the hosted html version of the site (never attempt to push to this branch)
- **main** - the mcdocs version of the live site (note that this branch has an automation task - see below) (has branch protection - must submit pull requests)

## Automation
A GitHub pages automation task has been setup:
- **Runs:** whenever anything is commited to the main branch
- **What it does:** runs mkdocs, & exports the html version of the site to gh-pages (which are then hosted live)

For further information, please refer to /CONTRIBUTING.md