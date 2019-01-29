+++
date = "2018-11-25T00:00:00"
draft = false
tags = ["Emacs", "Emacs Lisp"]
title = "Doing useful things with Emacs Lisp"
summary = "A beginner's (or lurker's) guide to extending the ultimately extensible text editor"
math = false
comments = true
+++

I wrote this post to demonstrate how I'm using Emacs Lisp to do some useful
things. This is post aimed at beginners and those interested (e.g., Vim users
potentially) in how Emacs can be extended to automate some simple tasks.
Advanced users will probably have more elegant (or more complete) solutions than
what I have here,<sup>1</sup> so with that in mind I will focus more on the
motivations, thought processes, and progressions I've gone through with these
functions. I also discuss some future directions and how these functions could
be improved.

About a year ago I made a point to complete the built-in Emacs Lisp tutorial.
For those looking for a good place to start with Emacs Lisp, this is undoubtedly
it. It's one of the best programming tutorials I've ever gone through, and I
thoroughly enjoyed it. While navigating through the tutorial, I created a .org
file with subsections for each chapter and individual code blocks for each set
of examples/exercise. I frequently go to this file to find snippets, and I often
find this more effective than Googling solutions.<sup>2</sup>

The functions below and all associated code are in my dotfile which can be found
in [this repo](https://github.com/mhaffner/dotfiles). Note that I'm using
Spacemacs, hence the associated keybindings and Vim-like conventions.

# open-html-firefox

I created this function since I often render .org and .Rmd files into .html
files within Emacs. Then, I use the command

    :! firefox my-newly-rendered-file.html

to open the file in a browser. Once the .html file is open, it can simply be
refreshed to reflect any changes. But, I often use Emacs as a navigation tool
(e.g., `SPC f f`; i.e. `lazy-helm/spacemacs/helm-find-files`) by first opening a
.org or .Rmd in Emacs, then opening the .html in a browser with a command like
the one above. This becomes tedious since most materials I create for courses
(syllabi, assignments, handouts, discussion questions, etc.) are served as .html
files, and I have to open these all the time. I could open the _.html_ file in
Emacs instead and then use

    :! firefox %

but the .html files created by `org-reveal` (a very nice package) are quite
large and cause Emacs to hang. So, I sought to create something that would (a)
get the full file path to the current buffer and strip the extension, (b) slap
".html" to the end of this string, \(c) open the file in Firefox, and (d)
assign this function to a keybinding. Here is what I came up with:

```
(defun open-html-firefox ()

  (interactive)

  ; create the new string of the file to open
  (setq file-string (concat (file-name-sans-extension (buffer-file-name)) ".html"))

  ; execute command
  (shell-command (concat "firefox " file-string)))


  ; assign this function to a keybinding in markdown mode
  (add-hook 'markdown-mode-hook
    (lambda ()
      (local-set-key (kbd "C-c f") 'open-html-firefox)))

  ; assign this function to a keybinding in org mode
  (add-hook 'org-mode-hook
            (lambda ()
              (local-set-key (kbd "C-c f") 'open-html-firefox)))
```

In my dotfile, the function has documentation, but I removed it for this post
since I'm explaining everything in detail. The function itself is quite short
and consists of mainly two things: (a) creating a variable called
`file-string`<sup>3</sup> and (b) opening this string (which is an .html
file) in Firefox with a command.

Originally I was using 

{{<highlight elisp>}} (setq file-string (replace-regexp-in-string "\.Rmd" ".html" (buffer-file-name)))
{{</highlight>}}
    
to create the string, but this obviously only works for .Rmd files. Also, I was
not initially aware of the `file-name-sans-extension` function which turned out
to be much easier than what I was doing anyway.

The two `add-hook`'s just assign `open-html-firefox` to keybindings in
`markdown-mode` and `org-mode`. The reason why I use lambdas is because the
internet told me to;<sup>4</sup> lo and behold, it doesn't work without lambdas.
It is possible to assign this function to a global keybinding, but I don't want
to override keybindings on other modes. Something like `C-c f` is common enough
that I assume it's being used elsewhere.

What would be even better (and simpler) is a function/keybinding that opens a
file under point directly from `helm-find-files`.

# add-src-elements

This function adds the text 

    #+BEGIN_SRC
    #+END_SRC
    
to the current buffer and places the cursor just after "#+BEGIN_SRC". This block
structure is used to embed code .org files, which I use to create presentations.
For example, a block may contain something like

    #+BEGIN_SRC python
    import numpy
    import scipy
    
    x = 'Emacs Rocks' # i hope this phrase isn't trademarked
    #+END_SRC

Manually typing `#+BEGIN_SRC...`, etc. etc. is tedious, so I simply created a
function and keybinding to automate this. Here it is:

{{<highlight elisp>}}(defun add-src-elements ()
    "Make adding #+BEGIN/END _SRC elements easier"
    (interactive)
    (insert "#+BEGIN_SRC\n#+END_SRC")
    (forward-line -1)
    (evil-append-line 1)
    (insert " "))
    
  ; set it to a keybinding
  (with-eval-after-load 'org
    (add-hook 'org-mode-hook
              (lambda ()
                (local-set-key (kbd "C-c s") 'add-src-elements)))
{{</highlight>}} 
                  
My dotfile looks a little different since I have other `org-mode` hooks, but
this is the gist of it. Again, the internet insists I use
`with-eval-after-load`,<sup>4</sup> so I obey. This could be improved by looking
for a previous codeblock (i.e. `search-backward`) in the current buffer if one
exists, getting the language used for the block if it's listed (Python in my
example), and inserting this language name just after `#+BEGIN_SRC`. In most
presentations I only demonstrate concepts in one language, so it would make
sense to use the previous source block's language if it is listed.

# Emacs Lisp programming strats
      
When using Emacs Lisp, I've often had difficultly locating proper functions to
do simple things. For example, in my second function, `add-src-elements`, I
utilize `(forward-line -1)`, which serves to move the cursor to the previous
line. This is something we do all the time in text editors manually. As a
Spacemacs user, for example, I use `j`/`k` to navigate between single lines.
This is where a beautiful feature of Emacs is exposed: `describe-key`, which
will show the function called by any keybinding. To find out what function is
called by `k` (which navigates to the previous line in `evil-mode`), I use `C-h
k` to call `describe-key`, and then I simply press `k`.

The function appearing in the help buffer is called `evil-previous-line`. While
this wasn't what I used directly in my custom function, this process often
points me to the function I need. Similar useful features include
`describe-function` and `describe-variable`. All of these `describe-` functions
contain links to the source code, which demonstrate what's going on under the
hood.

# Footnotes

<sup>1</sup> Please do share if you have better solutions!

<sup>2</sup> Which is baffling.

<sup>3</sup> Using `let` would probably be a better approach than `setq`.

<sup>4</sup> A Spacemacs requirement?
