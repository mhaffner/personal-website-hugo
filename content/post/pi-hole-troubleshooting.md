+++
date = "2019-01-10T00:00:00"
draft = false
tags = ["Raspberry Pi", "Pi-Hole", "GNU/Linux"]
title = "Pi-hole troubleshooting: An overview of my recent installation"
summary = "Mostly for my own future reference, but this may benefit others too"
math = false
comments = true
+++

# Introduction

My first Pi-hole installation was a pain mostly due to self-inflicted
issues. That said there are a few disjointed steps, and my lack of
networking knowledge will necessitate a future reference to more a
in-depth guide than what's currently available. This post serves as
self-documentation on what went wrong so that I (or others) can avoid
problems in future installations.


# Network issues

After initial installation, I could not access the Pi-hole admin page
nor the internet. Soon after, I couldn't access wifi on any of my
devices. I'm not 100% sure what the problem was, but I have a hunch -
After installation I needed to access my router's configuration page,
but I couldn't remember how. This has happened before, and I just
needed to figure out my router's brand and Google "Access router
configuration for \<brand\>". When I did this, I think I may have hit
the wifi button on router (it doesn't help that my modem sits atop my
router) and unknowingly **turned the wifi off manually**.

After a couple hours of troubleshooting, I uninstalled Pi-hole only to
later discover that that the wifi button on the router had been
switched off. However, I still could not access the internet on my Pi!
Here is what ended up enabling me to connect to the internet again:

- From this [link](https://www.raspberrypi.org/forums/viewtopic.php?t=158142), I
  put the following in `/etc/network/interfaces`:

{{<highlight config>}}

    auto lo
    iface lo inet loopback
    
    auto eth0
    iface eth0 inet manual
    
    allow-hotplug wlan0
    iface wlan0 inet manual
        wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
    
    allow-hotplug wlan1
    iface wlan1 inet manual
        wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
{{</highlight>}} 

- And from this
  [link](https://www.raspberrypi.org/forums/viewtopic.php?t=158142), I put the
  following in `/etc/dhcpcd.conf`:

{{<highlight config>}}
    # A sample configuration for dhcpcd.
    # See dhcpcd.conf(5) for details.
    
    # Allow users of this group to interact with dhcpcd via the control socket.
    #controlgroup wheel
    
    # Inform the DHCP server of our hostname for DDNS.
    hostname
    
    # Use the hardware address of the interface for the Client ID.
    clientid
{{</highlight>}} 

Through the Pi-hole installation a bunch of options were inserted into
`/etc/dhcpcd.conf`, and I think this was the root of the issue (of not
being able to connect to the internet). 

-   After this I ran

{{<highlight Bash>}}

sudo ifdown wlan0
sudo ifup wlan0

{{</highlight>}} 

and I was able to connect to the web again. 

Yet, my re-install of Pi-hole failed, and I found a working solution
through an [issue on GitHub](https://github.com/pi-hole/pi-hole/issues/1919). I uninstalled a few things with

{{<highlight Bash>}}

    sudo apt-get remove lighttpd dnsmasq dnsmasq-base

{{</highlight>}} 

and removed `/etc/pihole/`, `/etc/.pihole`, and `/var/www/html/admin`.
I then re-installed Pi-hole successfully and confirmed that I could
still access wifi (both from my Pi and from other devices).


# Post installation

Next, I followed [Step 3](https://discourse.pi-hole.net/t/how-do-i-configure-my-devices-to-use-pi-hole-as-their-dns-server/245) from the official guide titled "How do I
configure my devices to use Pi-hole as their DNS server?", but my
DHCP/DNS settings look quite different from the guide. I have a
Netgear router, and from its configuration page I had to make changes
in two locations.

Since I did not modify the default static IP address during
installation and was met with a warning about potential IP address
conflicts, I had to add an address reservation under `ADVANCED -> LAN
Setup` for the Pi. In my case, this was `192.168.1.3`. Then, I had to
change the DNS from one automatically configured by the ISP to newly
reserved IP address of the Pi. From the "Domain Name Server (DNS)
Address" heading under `ADVANCED -> Setup -> Internet Setup`, I
checked the option titled "Use these DNS Servers" and the previously
list IP. I applied the settings, and the rest was gravy.


# Conclusion

Once I got a grip on what was going on, Pi-hole really was easy to
install (props to the creators for a seamless process with a nice
installer). I doubt that others' problems will be as self-inflicted as
mine, but judging by the number of posts addressing Pi-hole issues on
Raspberry Pi forums and Stack Exchange, it seems like issues do arise
from time to time. Well self, see you in a year or so! You owe me
(i.e. yourself) a beer for writing this up.
