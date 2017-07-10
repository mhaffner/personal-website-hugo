---
layout: post
title: Why I'm Using Arch Linux
---

Like everyone else, when I first started using GNU/Linux I gravitated
toward Ubuntu. Ubuntu has some good things going for it, and I do
still hold some reverence for it as my first true GNU/Linux
experience. While using Ubuntu, I sought to try other distributions
and briefly used Fedora, Elementary OS, and Debian. With all of these
distributions -- including Ubuntu -- I came across a very similar
problem: having to manually add software repositories to get programs
that were more up-to-date than the package manager's defaults. With
this comes the difficulty of deriving reproducible, purely command
line solutions to installing many of my staple programs. Building
packages from source is not the end of the world, but if there was a
distribution/package manager that had a workable version (for my
purposes) of all the packages I needed, wouldn't that be worth
pursuing?

Enter Arch Linux. Since using Arch, I'm not sure I've had to build
anything from source; I've installed everything with a simple
one-liner with `pacman` or `yaourt`. As mentioned in other posts, I
have a bad habit of nuking my system (both accidentally and not
accidentally), so I really like having an easy method of installing
various packages. Aside from this, my distribution of Arch Linux has
other really nice features that make it indispensable to me.

**Warning:** _This is an opinionated piece, and there are certainly
shortcomings to my approach of installing software/troubleshooting
issues. Nevertheless, Arch Linux has seemed much more straightforward
to me, and at its core, I believe it's more user-friendly. If I'm
being unfair to Ubuntu and you know of solutions to my problems, I'd
love to hear about it!_


Installing multiple packages can be accomplished
with `pacman` by using

    pacman -S package1 package2 package3
    
for example. This can, of course, be replicated with `apt-get` on Ubuntu with

    apt-get install package1 package2 package3
    
but if you have to manually add a PPA, a key, etc., this process becomes several
lines long for each package. This could be automated in a script, but the key
and repositories can change. Further, removing packages seems to be much easier
with `pacman` using 
    
    pacman -R package
    
On the other hand `apt-get` uses a combination of `purge` and `remove`. I'm not
really sure which comes first or why, and I'm not really sure what these
commands fundamentally do. I've so often received errors with `apt-get update`
after removing packages that I'm left wondering if I've ever used these commands
correctly.

Certainly the argument in favor of Ubuntu (and against Arch Linux) is that
packages are more stable. This is probably true a package-to-package basis, but
I've had more difficulty with keeping the OS as whole stable with Ubuntu than
with Arch Linux. A large part of this has to do with distribution upgrades,
which have been a pain for me on Ubuntu but **don't exist** in Arch Linux which
operates on a rolling release, so using the command `pacman -Syu` upgrades on
packages on the system, meaning that you have the mo taking the time tost current version of the
operating system possible once packages finish upgrading. Arch Linux users are
encouraged to do this regularly, and I do it several times a week.

This feature in Arch Linux (or the lack thereof in Ubuntu) was the ultimate
tipping point for me. A few months ago my graphics card died, so I bought a new
one. I could not _for the life of me_ get it working in Ubuntu. It's an AMD
card, (the RX 470), and these don't always play nice with GNU/Linux in general.
But after trying a plethora of solutions, I decided that upgrading from 14.04 to
16.04 might be my best shot. Aside from not solving my graphics card issue,
this upgrade resulted in a whole host of packages not working correctly. At this
time, I decided to try Arch Linux which has a reputation of working with some of
the latest hardware.

To be precise, I'm using Manjaro which is an Arch Linux derivative. There are
plenty of other spin-offs from Arch Linux including Antergos, Apricity, and
ArchBang. Pure Arch Linux is a bit too stripped down for my liking; Manjaro
seems like a good balance between a highly configurable system and one that
allows you to hit the ground running. Aside from the simplicity of `pacman`,
Manjaro has some other nice features as well. It is _very_ easy to install and
remove kernels (which ended up being part of the solution to using my new GPU on
GNU/Linux). 

Over time, I've come to the conclusion that no GNU/Linux distribution is
perfect. I still have issue with Manjaro from time to time, and recently I was
wondering if I really gave Ubuntu a fair shot. Did I really exhaust all possible
solutions in getting the RX 470 to work? Is there a easier method to installing
packages that I'm just missing? And is `apt` or `aptitude` or whatever it's
called really as cryptic as I'm making it out to be? A recent adventure has
confirmed my suspicions.

I recently released a tool called `shp2nosql` (I wrote about it
(here)[https://mhaffner.github.io] and it's on GitHub
(here)[https://github.com/mhaffner/shp2nosql]), which, in a nutshell,
is designed to insert spatial data into NoSQL databases. I did all of
my initial testing on local machines running Manjaro. Before pushing
the code to a public repository on GitHub, I decided to do some
testing on other GNU/Linux distributions so ensure that it would be as
portable as possible. I started with a clean instance of Ubuntu in a
virtual machine and installed software from the ground up to ensure
everything would work. Below is the code I used to install
dependencies:


    sudo add-apt-repository universe # for gdal
    sudo add-apt-repository ppa:webupd8team/java # for java
    sudo apt-get update
    sudo apt-get install git gdal-bin curl oracle-java8-installer vim
    cd ~
    git clone https://github.com/mhaffner/shp2nosql
    PATH=$PATH:~/shp2nosql
    
    wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
    sudo apt-get install apt-transport-https
    echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list
    sudo apt-get update && sudo apt-get install elasticsearch
    sudo systemctl enable elasticsearch.service
    sudo systemctl start elasticsearch
    
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
    echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
    sudo apt-get update
    sudo apt-get install -y mongodb-org
    cp ~/shp2nosql/development/mongodb.service /etc/systemd/system/mongodb.service
    sudo systemctl start mongodb

What a challenge! And the first time I did this I had to manually
alter `elasticsearch.yml` and `mongodb` because the defaults were not
sufficient. Compare this to what I needed for Manjaro:

    sudo pacman -Syu elasticsearch mongodb vim
    sudo systemctl start elasticsearch
    sudo systemctl start mongodb
    git clone https://github.com/mhaffner/shp2nosql
    PATH=$PATH:~/shp2nosql
    # add code here

Now some of this difference is due to the suite of pre-packaged
software that comes with Manjaro; it comes with `curl` and `java`
whereas Ubuntu does not. This is somewhat counter-intuitive because
Arch Linux in general takes a DIY approach - The developers seek to
create an non-bloated experience, making design decisions that don't
force users down a specific path. The mere concept of an Arch-based
distribution deviates from this approach, but if developers make
mostly good design decisions that work for me, that I can change if I
want, and that help me get a system up and running much faster than a
bare bones installation, then I'm ok with this. Now it's also likely
that other Arch Linux distributions would need something slightly
different than what I have above, but the point still stands: many one
liners with Arch are multi-step processes with Ubuntu (this includes
installation of `QGIS`, `R`, and `Emacs` - all of which are staple for
me). One solution to the dependency problem is something like
(Docker)[link], but I doubt we'll ever reach the point at which
everything is installed through such services.

With the confusion I've endured with Ubuntu, I simply don't think I
can recommend it anymore, especially to new users. In this piece I
focused mostly on package installation, but there are other design
decisions of Manjaro (or other Arch-based distributions) vs. Ubuntu
that are worth mentioning here: 
- `systemd` (which does not require root access) vs. `pm-utils` (which
  does require root and is not installed by default) for
  suspend/reboot/etc. operations.
    - To be fair, Ubuntu 16+ now comes installed with `systemd` by
      default)
- KDE vs. Unity: 
    - To be fair again, Manjaro comes with two DE options: XFCE and
      KDE, and XFCE is actually the "flagship" DE. Also, installing a
      DE after installation is not tremendously difficult, and Ubuntu
      derivatives like Kubuntu come with KDE as well.
- Documentation: the Arch Wiki is incredible, and 90%+ of the time I
  go no farther than it when needing to help with anything Arch
  related. I cannot say the same for Ubuntu.
- Less bloated-ness: Manjaro just feels less bloated than Ubuntu (no
  Software Center, for instance)
      

Some of the problems I still have find with Manjaro:
- **Managing my desktop settings.** I can't stand point and click
  menus. I want my desktop version controlled through a single config
  file, just like my `.spacemacs` and `.vimrc`. I've heard that i3 is
  a solution to this, but I don't think I want a tiling window
  manager. I like to stack windows on top of one another and switch as
  I need. Spacemacs' window control features are already great, and I
  like Spacemacs to be fullscreen anyway. That's how I like it. A
  different, simple desktop could work, but I desperately need a
  launcher (which is not available on LXDE, LXQT, and XFCE from my
  understanding), so that I can launch programs with `Super`.
- **Integration of `pacman` and `yaourt` package management**
  Upgrading packages with `pacman` is easy, but `yaourt` seems more
  difficult to me. Is it possible to integrate these? 
- **Breakage of `yaourt` packages** This only happened to me once, but
  it was enough to make me reconsider the viability of an Arch Linux
  production  server. After a system upgrade, QGIS (installed via
  `yaourt`) broke. A forum user came up with a combination of
  downgrades that got QGIS working, but downgrades are not officially
  supported, and I couldn't upgrade `pacman` packages after this
  downgrade. 

- Other nice Manjaro features: kernel upgrades are really easy (GPU
  issue)
- Things just work (WOW private server)
- Demonstration with my software package installation
- My personal experience and impressions

- Up-to-date packages 
- Easier to install packages
- Rolling release


