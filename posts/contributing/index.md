# How to Contribute


If you are a member of ComSec, we would love you to contribute to our site; and as a reward we will display your name as the article's author.

The type of articles we would like is anything hacking related; this could be from discussing a topic to a walkthrough to a CTF challenge.

## Getting Started

Firstly you will need to fork this repository. This can be done through GitHub by visiting our [repository](https://github.com/Cov-ComSec/Cov-ComSec.github.io) and by clicking fork in the top right corner. **NB:** you must be logged into GitHub to do this!

Now that you have forked the repository, you will need to use the following commands to download the repository and the related git submodules:

```
git clone --recursive https://github.com/<your GitHub username>/<your forked repo name>
```

## Installing Hugo

The website uses the [Hugo engine](https://gohugo.io) to build the markdown pages into a website, although this step is not required, as the website is compiled by a GitHub Action. To view it locally run:

```
hugo serve
```

The website should then be hosted locally on port 1313.

## Creating Posts

To create a post, firstly head into the posts folder. Now create a new folder.

**NB:** this is used to generate the posts URL, so please ensure that it is short, descriptive and contains no spaces and/or special characters.

Once the folder is created, enter it and create a file named 'index.md' - this will be where you write your text.

### Storing Files
If you wish to add files (such as images, pdf files, etc.) please place them in this folder. Again please call them a sensible name as it will be used to generate the URL.

### Writing Posts
Now that we have sorted all the necessary files, we can begin writing posts - so now open index.md in your favourite text/markdown editor.

#### Front Matter
To set up the blog post, you must use front matter to set the settings, you must add the following, modifying the values to suit.

```
---
title: "Add Post Title "
date: 2021-05-07T14:50:28+01:00
draft: false
description: "describe your article"
tags: ["tag1", "tag2", "etc. "]
categories: ["Big Category "]

author: "Your Name/alias" 
authorLink: "https://example.com"

---
 ```

#### Write Content
After you have added the front matter, and added the three dashes, you can write your content using standard markdown. If you are new to markdown, I recommend that you read [this guide](https://www.markdownguide.org/cheat-sheet/) and look at other posts on this website to get an idea. 

#### Adding Images/Linking Files
To add a photo that you have placed in the same folder as above use:

```
![<add alternate text>](imageName.png)
```

To add a file, you must add a hyperlink - this is done by:

```
[text to display](filename.extension)
```

## Save Changes
Once you are happy, you must commit and upload your work to the GitHub server:

```
git add *
git commit -am "meaningful commit message" 
git push 
```

### Pull Request
You now need to raise a pull request to ask for permission to merge with our site - here one of the committee will read your post and hopefully approve it! 

