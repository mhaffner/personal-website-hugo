+++
date = "2017-03-29T00:00:00"
draft = true
tags = ["Music", "wiki"]
title = "Six years of graduate college study music and the transition from blog to personal wiki"
summary = "Music that got me through graduate college"
math = false
comments = true
+++

Through a series of Reddit posts/comments I stumbled upon Abhinav Tushar's
[personal website](https://lepisma.github.io/2018/01/27/blog-to-wiki/) where he
explains the advantages of keeping a personal wiki versus a blog. I'm not going
to recite them all here since you can easily find them directly at the source,
but I think this post is well-suited for my inaugural wiki-style post. For a
long time I've wanted to compile a list of music that listened to through grad
school while working/writing/studying/programming in part to share this music
with others but also to have this list to fall back on myself. Inevitably, over
the years I find myself saying, "Wow! I forgot about that album!" perhaps
largely due to the fact that mostly listen to music online. The wiki approach
is nice because I can (and will) add to list as I find more good study music.

When studying, I typically prefer long instrumental playlists, and most are
either ambient, electronic, and/or metal with a few exceptions. I've attached a
date to these simply for a reference point though presently I still listen to
most occasionally if not often. The music I like is too obscure to be found on
Spotify, and similarly, Pandora's recommendations are lacking.

# Pre-2015

## Sithu Aye - Invent the Universe

## World of Warcraft - OST, Burning Crusade OST

## Modern Day Babylon - Travelers 

## Animals as Leaders - The Joy of Motion

In my book, Tosin Abasi is the best guitarist of all time. The track _Physical
Education_ from this album is one my all time favorites. Unfortunately, with
every release

# 2015

## Jakub Zyteki - Wishful Lotus Proof

## Hammock - Departure Songs, Oblivion Hymns

## Michael McCann - Dues Ex: Human Revolution OST

## Bulb - Best of Bulb

## Cloudkicker - The Discovery, Beacons, Let Yourself Be Huge, Fade, Subsume

## Modern Day Babylon - The Ocean Atlas

## Mestis

# 2016

## Ben Prunty - Faster than Light OST

## Jake Bowen - Isometric

## Polyphia - Inspire, Renaissance, Muse

## Pomegranate Tiger - Entities

## Wide Eyes - Terraforming, Samsara, Volume

## Stellardrone - Invent the Universe 

## Circle of Contempt - Structures for Creation

## Chon

# 2017

## Hammock - Everything and Nothing

## Jeremy Soule - Skyrim OST

## Arch Echo - Self Titled

## lux natura - howqa, light on the wild-wood stream, ephemerals, still life, into the fog

## Cloudkicker - Music is Tight

## Wide Eyes - Paradoxica

## The Algorithm - Brute Force

## David Maxim Micic - Who Bit the Moon

lux natura is defintely my favorite ambient artist, and its mindboggling that
they don't have more attention. Their albums are all super cheap on Bandcamp
(around $3), and I've purchased all of them. Every track and album name (even
the artist name) are all lowercase which makes for a pretty cool-looking style,
especially in ncmpcpp next to a glances (system monitor) window.

# 2018

## Hammock - (Full discography)

This is my go-to when I get home from work and I relax before dinner with the fam.

## Jeremy Soule - Skyrim Atmospheres

## Kyle Dixon and Michael Stein - Stranger Things OST

## Intervals - The Way Forward

I usually hate things that are popular, but the _Stranger Things_ series is
incredibly good that I can't dislike it. I don't like any of its 80s
pre-selected tracks (e.g., The Clash), but the OST is amazing. S u r v i v e 's
Kyle Dixon and Michael Stein did a fantastic job with it.


**EDIT: I've made several modifications to the original piece based on helpful
comments from reddit users _newworkaccount_, _iKnitYogurt_, _jprada_, and
_ThisTimeIllSucceed_ on the
thread
[here](https://www.reddit.com/r/ManjaroLinux/comments/6n6mao/why_i_switched_from_ubuntu_to_manjaro/).
View the original post in its full glory/shame
on
[Github](https://github.com/mhaffner/personal-website-hugo/blob/master/content/post/arch-linux.md).**

Like everyone else, when I first started using GNU/Linux I gravitated toward
Ubuntu.  While using Ubuntu, I sought to try other distributions and briefly
used Fedora, Elementary OS, and Debian. With all of these distributions --
including Ubuntu -- I came across a very similar problem: having to manually add
software repositories to get programs that were more up-to-date than the package
manager's defaults. With this comes the difficulty of deriving reproducible,
purely command line solutions to installing many of my staple programs. Building
packages from source is not the end of the world, but if there was a
distribution/package manager that had a workable version (for my purposes) of
all the packages I needed, wouldn't that be worth pursuing?

Enter the Arch Linux family. Since using Manjaro (technically an Arch Linux
derivative, not Arch Linux itself nor an Arch distribution; thanks to reddit
users _newworkaccount_ and _iKnitYogurt_ for clarifying this), I'm not sure I've
had to build anything from source manually; I've installed everything with a
simple one-liner with `pacman` or `yaourt`. For testing purposes (and for the
sake of (re)installing systems often) it's nice to have reproducible methods of
software installation. Aside from this, Manjaro has other really nice features
rendering it indispensable. Ubuntu has some good things going for it, and for it
I do still hold some reverence as my first true GNU/Linux experience. The purple
terminal sparks an incredible amount of nostalgia every time I see it on someone
else's system.

But I can't go back.

**Warning:** _This is an opinionated piece, and there are likely some solutions
to the problems I perceive with Ubuntu. Nevertheless, Manjaro has seemed much
more straightforward to me, and at its core, I believe it's more user-friendly.
I do not intend this piece to be authoritative; rather, it is a description of
my journey into the Arch-related world from Ubuntu (thanks to reddit user jprada
for pointing out how this could be clarified). If I'm being unfair to Ubuntu
and/or you know of solutions to my problems, I'd love to hear about it! Drop me
a comment<sup>1</sup>._

The package manager for Manjaro (and Arch Linux) is called `pacman`. Installing
multiple packages can be accomplished with

    pacman -S package1 package2 package3
    
for example. This can, of course, be replicated with `apt` on Ubuntu with

    apt-get install package1 package2 package3
    
but if you have to manually add a PPA, a key, etc., this process becomes several
lines long for each package. Multi-line solutions were common for me as I often
need bleeding edge packages, and most default package versions were not up to
date enough. This process could be automated in a script, but the keys and
repositories can change. I've never had to add a repository manually with
Manjaro since software in the community repositories (installed with `yaourt`)
have everything I need that the official repositories lack. Beyond this,
removing packages seems to be much easier with `pacman` through
    
    pacman -R package

Reddit user _ThisTimeIllSucceed_ actually suggests using 

    pacman -Rns package
    
which removes any dependencies not used by another package and any config files
for the package. On the other hand, `apt` uses a combination of `purge` and
`remove`. I'm not really sure which comes first or why, and I'm not really sure
what these commands fundamentally do. I've so often received errors with
`apt-get update` after removing packages that I'm left wondering if I've ever
used these commands correctly.

Certainly the argument in favor of Ubuntu (and against Arch Linux-like
derivatives) is that packages are more stable. This is probably true on a
package-to-package basis, but I've had much more difficulty keeping the OS
stable _as a whole_ with Ubuntu than with Manjaro. A large part of this has to
do with distribution upgrades, which have been a pain for me on Ubuntu but
**don't exist** in Manjaro, which operates on a rolling release. Using the
command `pacman -Syu` upgrades all on packages on the system, meaning that you
have the most up-to-date version of the OS once you upgrade packages.

This feature in Manjaro (or the lack thereof in Ubuntu) was the ultimate tipping
point for me. A few months ago my graphics card died, so I bought a new one, an
AMD RX 470. I could not _for the life of me_ get it working in Ubuntu 14. After
doing some research (after I bought the card, of course), I discovered that AMD
cards don't always work well with GNU/Linux. After trying a plethora of options,
I decided that upgrading from 14 to 16 might be my best shot. Aside from not
solving my graphics card issue, this upgrade resulted in a whole host of
packages not working correctly<sup>2</sup>. At this point I decided to try
various Arch Linux derivatives, which have a reputation of working with a wide
range of (and often newest) hardware.

There are plenty of other Arch Linux derivatives including Antergos, Apricity,
and ArchBang. Pure Arch Linux is a bit too stripped down for my liking; Manjaro
seems like a good balance between a simple, highly configurable system and one
that allows you to hit the ground running.

Over time, I've come to the conclusion that no GNU/Linux distribution is
perfect. I still have issues with Manjaro from time to time (explained at the
conclusion of the piece), and recently I was wondering if I really gave Ubuntu a
fair shot. Did I exhaust all possible solutions in getting the RX 470 to work?
Is there a easier method to installing packages that I'm just missing? And is
`apt` really as cryptic as I'm making it out to be? A recent adventure has
confirmed some of these suspicions.

In April I released a suite of tools called `shp2nosql` (I wrote about
it [here](https://mhaffner.github.io/post/shp2nosql) and it's on
GitHub [here](https://github.com/mhaffner/shp2nosql)). In a nutshell, it's
designed to insert spatial data into NoSQL systems. I conducted all of my
initial testing on local machines running Manjaro. Before pushing the code to a
public repository on GitHub, I decided to do some testing on other GNU/Linux
distributions to ensure portability. I started with a clean instance of Ubuntu
16 in a virtual machine and installed software from the ground up. Below is the
code I used to install dependencies:

    # install dependencies
    sudo apt-get update
    sudo apt-get install python-software-properties
    sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable
    sudo add-apt-repository ppa:webupd8team/java # for java
    sudo apt-get update
    sudo apt-get install git gdal-bin curl oracle-java8-installer vim
    cd ~
    git clone https://github.com/mhaffner/shp2nosql ~/git-repos/shp2nosql
    export PATH=$PATH:~/git-repos/shp2nosql/bin
    
    # install and start elasticsearch
    wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
    sudo apt-get install apt-transport-https
    echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list
    sudo apt-get update && sudo apt-get install elasticsearch
    ## edit /etc/elasticsearch.yml and uncomment cluster.name, node.name, and network.host to 0.0.0.0
    sudo systemctl enable elasticsearch.service
    sudo systemctl start elasticsearch
    
    # install and start mongodb
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
    echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
    sudo apt-get update
    sudo apt-get install -y mongodb-org
    sudo cp ~/git-repos/shp2nosql/development/ubuntu-16.04/mongodb.service /etc/systemd/system/mongodb.service
    sudo systemctl start mongodb

What a challenge! I also had to manually alter `elasticsearch.yml` and
`mongodb.service` (and then save these configs for future testing) because the
default configurations were not sufficient. Compare the above code to what I
needed in Manjaro:

    sudo pacman -Syu elasticsearch mongodb wget gdal vim
    sudo systemctl enable elasticsearch.service
    sudo systemctl start elasticsearch
    sudo systemctl start mongodb

Way easier. And I did not have to manually alter config files.

**Random rambling**: _Some of difference in installation of dependencies is due
to the suite of pre-packaged software that comes with Manjaro; it comes with
`curl` and `java` whereas Ubuntu does not. The inclusion of these extra packages
is an example of how Manjaro deviates from the pure Arch Linux philosophy, which
generally takes a DIY approach - The developers seek to create an non-bloated
experience, avoiding design decisions that force users down a specific path.
(This is not to suggest that Ubuntu would be expected to contain everything that
Arch Linux contains, of course). However, if Manjaro developers make (a) mostly
good design decisions, (b) that I can change if I want, (c) that help me get a
system up and running much faster than I could with a bare bones installation...
then I'm okay with this_.

It's possible that users of other Arch Linux derivatives would need something
slightly different to install dependencies for `shp2nosql`, but the general
point still stands: many one liners with `pacman` are analogous to multi-step
processes with `apt`. This includes the installation of `QGIS`, `R`, and
`Emacs` - all of which are staple programs for me.

With the confusion I've endured with Ubuntu, I simply can't recommend it
anymore, especially to new users. In this piece I focused mostly on package
installation, but there are other notable features of Manjaro (and other
Arch-based distributions) that are worth mentioning here:

- **Documentation**: the Arch Wiki is incredible, much of it applies to Manjaro,
  and 95%+ of my questions are answered here. I definitely cannot say the same
  for Ubuntu.

- **Kernel installation**: Installing and removing kernels is trivial through
  the System Settings Module (this ended up being part of the solution to using
  my new GPU).
  
- **Greater privacy/freedom**: Many Ubuntu users may not even realize that their OS
  contains
  ["surveillance code"](https://arstechnica.com/information-technology/2012/12/richard-stallman-calls-ubuntu-spyware-because-it-tracks-searches/).
  Searches in dashboard are transmitted to Canonical, and the company profits
  when a user buys a product from Amazon using the Amazon App.<sup>3,4,5</sup>
  
- **Less bloated-ness**: Manjaro (which is certainly more bloated than pure
  Arch) feels much less bloated than Ubuntu. It has no Software Center, for
  instance, and feels snappier. Knowing that Canonical transmits search data
  might explain some of this new found snappiness...
  
- **Other various things _just work_**: For a while, my test of a well-working
  GNU/Linux distribution was one with which I could install the `NSM3` library
  in `R`. This sounds ridiculous, of course, but I could never successfully
  install the library in Ubuntu or Fedora after many painstaking hours.
  Installation of `NSM3` was insignificant in Manjaro; it worked on the first
  try. I've played games on Manjaro - Hearthstone<sup>6</sup>, World of
  Warcraft, Faster than Light - that all basically work out of the box. These
  took much more additional configuration in Ubuntu.

# Some of the problems I still find with Manjaro

As previously noted, I still haven't found the perfect GNU/Linux distribution.
Here are problems I still find with Manjaro:

- **Managing my desktop settings.** I can't stand point and click menus knowing
  that I have to make changes manually across all of systems if I want
  consistency. I want my desktop settings (keybindings, background, etc.)
  version controlled through a single config file, just like my `.spacemacs` and
  `.vimrc`. I've heard that i3 is a solution to this, but I don't think I want a
  tiling window manager. I like to stack windows on top of one another and
  switch as I need. I really like my current Manjaro KDE setup, but it uses many
  different config files that seem to change arbitrarily, so VC is a pain. Some
  other simple DE could work for me, but I desperately need a launcher so that I
  can easily start programs with `Super` + `<program name>` (which, from my
  experience, is not available on LXDE, LXQT, and XFCE).

- **Integration of `pacman` and `yaourt` package management**: Upgrading
  packages with `pacman` is easy, but `yaourt` is more difficult. Is it possible
  to integrate these (i.e. install with `yaourt` but upgrade with `pacman`)?

- **Breakage of `yaourt` packages**: This only happened to me once, but it was
  pretty crippling. After a system update with `pacman`, QGIS (installed via
  `yaourt`) broke. A forum user came up with a combination of downgrades that
  got QGIS working, but downgrades are not officially supported, and I couldn't
  upgrade `pacman` packages after this downgrade.
  
<sup>1</sup> This way, all thrashings of the piece are logged in one place, and
I don't have to stumble upon them individually on Hacker News, various Reddit
pages, Twitter, and other sites!

<sup>2</sup> To be fair, Ubuntu does throw a very Windows-esque warning stating
the upgrade my ruin your entire system.

<sup>3</sup> This was true as of December 2012 but is probably still happening.

<sup>4</sup> This privacy violation is nothing compared to what Microsoft,
Apple, and other companies are probably doing.

<sup>5</sup> While more "libre" than Ubuntu, Arch Linux does not receive gold
stars from The Free Software Foundation

<sup>6</sup> I occasionally have issues with my GPU on Windows still. For a time
I was playing Hearthstone through Wine on Manjaro (an unsupported OS) while
could not play at all on Windows as the game would always unexpectedly crash.
It was laughable to me that I could play the game better on an unsupported OS
than on Windows.
