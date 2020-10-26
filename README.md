
# ComSecMaterials

## This is an mkdocs/github pages repo

The URL for rendered material is:

If you're here to read about ComSec, go there.

The rest of this document is about how the repo is organised.



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
 - When you're ready, commit your changes then use `make publish` to render and push the content to the pages branch. 
