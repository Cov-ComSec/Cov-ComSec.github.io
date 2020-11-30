
# CUEH Website
The official site for Coventry University Ethical Hacking Computer Security Society (CUEH ComSec), find our latest presentations, videos & announcements! [Click here to view our site!](https://cov-comsec.github.io/)

## Viewing Materials
If you wish to view the presentations, either head to the [website](https://cov-comsec.github.io/) or go to the /docs folder.

## Mistakes/Suggestions
Unfortunately we are ethical hackers, and not graphics designers (we are used to spending 90% of our time in terminals), so if you have a suggestion to improve our content, let us know! We are also only human, so there is a high likelihood that we have made a syntax error  on a webpage or presentation or have a bug in a piece of code or challenge.
If you spot an error in our site/or have a suggestion, please either:
 - [Fork the repository](https://github.com/Cov-ComSec/Cov-ComSec.github.io), correct the error & create a pull request.
 - Create an [issue on GitHub](https://github.com/Cov-ComSec/Cov-ComSec.github.io/issues).
 - Contact us on the [Discord Server](https://discord.gg/7SF7NKG).
All editors will be credited (unless you wish to remain anonymous).

# Development
The rest of this readme file will detail the technical documentation on how to develop the site.

# Branches
- **gh-pages** - the hosted html version of the site (never attempt to push to this branch)
- **main** - the mcdocs version of the live site (note that this branch has an automation task - see below) (has branch protection - must submit pull requests)
- **dev**- development version of the site (not hosted), able to push directly to this branch, or create new branches and pull to this one

# Automation
A GitHub pages automation task has been setup:
- **Runs:** whenever anything is commited to the main branch
- **What it does:** runs mkdocs, & exports the html version of the site to gh-pages (which are then hosted live)

## MkDocs.yaml & MkDocs.yml
Both same file, but both must be kept updated, as .yaml is used locally & .yml is used by the GitHub action

## Building and publishing
 - MKDocs does most of the work
 - Keep your pages in `./docs`
 - All requirements can be installed in a venv 
   - `make venv`
   - `. ./csm_venv/bin/activate`
   - `make prereqs` (You only need to do this once, the previous
     commands set up a new shell when working with the repo)
 - Use `make serve` and go to <http://localhost:8008/> to see the site preview
   - This will update *live* as you change config files or page contents
 - When you're ready, commit your changes to the relevant branch