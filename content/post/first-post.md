+++
date = "2017-03-30T00:00:00"
draft = false
tags = ["GitHub", "Wordpress"]
title = "The Burnination of the Wordpress"
summary = """
Why I switched from Wordpress to Github Pages
"""
math = false
+++

I'm currently in the process of moving my blog to GitHub pages. I'm
doing this for several reasons: 

# (1) Ease of creating/publishing posts 
On my first few Wordpress posts I typed content directly in Wordpress.
I didn't mind this at the time, but eventually I started using Emacs
`org-mode` for all writing, including research papers, blog posts,
etc. After a semi-debacle of copying an html-exported `org` file into
Wordpress, I never posted again. This manual labor approach did not
appeal to me. I discovered that I could host a blog through GitHub
pages and simply push a `.md` file to a repository (much like I was
already doing with code repositories) to create a post. This is much,
much easier than what I was doing with Wordpress before. I'm still in
the process of figuring out how to use `org-mode` on here, but I'll be
there soon :)

# (2) Version control
I have the unfortunate habit of nuking everying I do pretty regularly,
and git makes me forgive myself exceedingly quicker than before.

# (3) Less corporate control/profit/whatever
No more ads. More control for me. No longer do I get sick when I inadvertently
see options to _pay_ for Wordpress themes thinking about all the innocent people
who have willingly done this (now that I know about Jekyll). **EDIT**: So I
found out that there are plenty of Jekyll themes you can pay for too. But I can
still avoid seeing this easier on GitHub pages. And I have more control this way.

# (4) Easier to reflect changes to my CV
Nothing wrong with a little self-promotion on a personal blog, right? With
Wordpress I had to upload my new CV through the web interface _every time_ I
made a change (which is quite often). I'm still working on this, but I plan on
creating a symbolic link from my CV repository here, so all I'll have to do is
push the changes to this repository when I update my CV.
**EDIT**: I'm now doing this with hard links. Setting it up was pretty easy.
