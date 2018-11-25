+++
date = "2018-11-25T00:00:00"
draft = true
tags = ["Emacs", "Emacs lisp"]
title = "Some useful things with Emacs lisp"
summary = "A beginner's (or lurker's) guide to extending the ultimately extendable... operating system"
math = false
comments = true
+++

I'm writing this post to demonstrate some useful things I've been doing with
Emacs lisp lately. This is aimed at beginners and those interested in how Emacs
can be extended to automate some simple tasks. Advanced users will probably have
more elegant (or more fully featured solutions) than what I have
here<sup>1</sup>, so with that in mind I will focus more on the motivations,
thought processes, and progressions I've gone through with these functions. I
also talk about some future directions and how these functions could be improved.

About a year ago I made a point to complete the built-in Emacs lisp tutorial.
For those looking for a good place to start with Emacs lisp, this is undoubtedly
it. It's one of the best programming tutorials I've ever gone through, and it
was something I thoroughly enjoyed. While navigating the tutorial, I created a
`.org` file with subsections for each chapter and individual code blocks for
each part. I frequently find myself going back here to find things, and often
this is more effective than Googling<sup>2<sup>.

These functions are all in my dotfile which you can find in
[this](https://github.com/mhaffner/dotfiles) repo.

# open-html-firefox

I created this function since I often render `.org` and `.Rmd` files into
`.html` files within Emacs. Then, I use something like this

`:! firefox my-newly-rendered-file.html` 

to view the file in a browser. Once the `.html` file is open, it can simply be
refreshed to reflect any changes. But, I often use Emacs as a navigation tool
(`SPC f f`; i.e. `lazy-helm/spacemacs/helm-find-files`), open the .org or .Rmd
in Emacs, then open the .html in a browser with a command like the one above. I
could open the .html file in Emacs instead and then use

`:! firefox %`

but the .html files created by `org-reveal` (a very nice package) are quite
large and cause Emacs to hang. So, I sought to create something that would (a)
get the full file path but strip the extension, (b) slap ".html" to the end of
this file path, \(c) open the file in Firefox, and (d) assign this whole
procedure to a keybinding. Here is what I came up with:

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
and consists of mainly two things: creating a variable called
`file-string`<sup>3</sup> and then opening this string (which is an .html file)
in Firefox.

Originally I was using 

    (setq file-string (replace-regexp-in-string "\.Rmd" ".html" (buffer-file-name)))
    
to create the string, but this obviously only works for .Rmd files and not .org.
Also, I was originally not aware of the `file-name-sans-extension` function
which turned out to be much easier than what I was doing anyway.

The two `add-hook`'s just assign `open-html-firefox` to keybindings in
`markdown-mode` and `org-mode`. The reason why I use lambdas is because the
internet told me to;<sup>4</sup> lo and behold, is doesn't work without lambdas,
so the internet's perfect streak of being right in everything programming
remains unbroken. It may (must?) be possible to assign this function to a global
keybinding, but I don't want to override other keybindings. Something like `C-c
f` is common enough that I assume it's being used in other modes.

# add-src-elements

This function adds the text 

    #+BEGIN_SRC
    #+END_SRC
    
to the current buffer and places the cursor in this code block. This block
structure is used to embed code .org files. For example, a block may contain
something like

    #+BEGIN_SRC python
    import numpy
    import scipy
    
    x = 'Emacs Rocks' # i hope this phrase isn't trademarked
    #+END_SRC

Typing `#+BEGIN_SRC...`, etc. etc. is tedious, so I basically created a function
and keybinding to automate this. Here it is:

    (defun add-src-elements ()
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
                  
My dotfile looks a little different since I have more `org-mode` hooks, but this
is the gist of it. Again, the internet insists I use
`with-eval-after-load`<sup>4</sup>, so I obey. This could be made better by
looking back (i.e. `search-backward`) for a previous codeblock (if one exists)
in the current buffer, getting the language used if it's listed (Python in my
example) and inserting this just after `#+BEGIN_SRC`.

# Elisp strats
      
When using Emacs lisp, I've occasionally had difficultly locating proper
functions to do simple things. For example, in my second function,
`add-src-elements` I utilize `forward-line -1`, which serves to move the cursor
to the previous line. This is something we do all the time in text editors. As a
Spacemacs user, I use `j`/`k` to navigate between lines. One beautiful feature
of Emacs is `describe-key`, which will show the function called by a certain
keybinding. To find out what function is called by `k` (which navigates to the
previous line in `evil-mode`), I use `C-h k` to call`describe-key`, and then I
simply press `k`. 

The function appearing in the help buffer is called `evil-previous-line`. While
this isn't what I used in the function, this process helped me find the function
to use. 

# Conclusion

# Footnotes

<sup>1</sup> Please do share if you have better solutions!

<sup>2</sup> Which is baffling.

<sup>3</sup> Using `let` would probably be a better approach than `setq`.

<sup>4</sup> A Spacemacs requirement?
