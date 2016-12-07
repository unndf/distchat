<Ouroboros> is linux-image-* package the correct place to get the default .config for that package? ok, i guess that is a little circular
<Ouroboros> i mean, yeah, same thing
<Ouroboros> just kinda strange they dont have any default ones in the linux-source-* package
<Ouroboros> well, there are some in the source for linux-image, but they are pretty minimal
<Ouroboros> otoh, i am somewhat glad that 8-year olds are still aware of irc
<Ouroboros> video driver?
<Ouroboros> dozer: if live works, then clearly it *can* work, just need to get the right drivers in the right place at the right time
<Ouroboros> why would it die at that point? it should only start using the installed drivers after reboot?
<Ouroboros> or no?
<Ouroboros> live has an installer boot option too
<Ouroboros> not sure if thats any different than the normal installer
<Ouroboros> (it's gonna fail the exact same way as before :)
<Ouroboros> with the installer, or just in general?
<Ouroboros> yeah, its not a driver issue per se then, just monitor going to power save
<Ouroboros> i think i vaguely remember something like this before
<Ouroboros> dozer: also maybe something with 'xset dpms'
<Ouroboros> dozer: should be "xset -dpms" i guess
<Ouroboros> yeah
<Ouroboros> hm, why does installing a kernel image sometimes runs /etc/kernel/postinst.d/zz-update-grub, and sometimes not
<Ouroboros> i dont know, i cant find a pattern
<Ouroboros> well, whatever, not that important right now
<Ouroboros> dozer: have you tried unplugging it and plugging it back in again? ;)
<Ouroboros> (the video cable)
<Ouroboros> dozer: (i meant after it happens)
<Ouroboros> hehe
<Ouroboros> i always wonder why i am working on the actual console and not ssh
<Ouroboros> dozer: user:live ?
<Ouroboros> yes
<Ouroboros> (a ton of stuff is enabled)
<Ouroboros> random weird network daemons that you probably dont want :)
<Ouroboros> Echoz: works for me, but its squeeze
<Ouroboros> maybe they disabled it (which might be a good idea, heh)
<Ouroboros> whats the actualy correct thing to blacklist a module on the kernel command line, i tried nouveau.blacklist=1, that succeeded in not loading it because: nouveau: Unknown parameter `blacklist'; i also saw suggested nouveau.blacklist=yes and modprobe.blacklist=nouveau
<Ouroboros> i guess the last one?
<Ouroboros> which man page
<Ouroboros> ok, i will try that, unless this module is not loaded via modprobe
<Ouroboros> Echoz: technically, you dont need the display
<Ouroboros> well, time to recompile the kernel.... again
<Ouroboros> heh
<Ouroboros> is there no more init.d ?
<Ouroboros> i really should get a newer livecd
<Ouroboros> never seen it yet
<Ouroboros> sounds vaguely similar to solaris smf
<Ouroboros> good, i like smf
<Ouroboros> starting to get a bit old though
<Ouroboros> are you bringing back enough for everyone?
<Ouroboros> dozer: but if live also has the issue, it might be easier to debug it on live first?
<Ouroboros> yes
<Ouroboros> but you might as well figure it out on live first so that you can cleanly apply the fix later
<Ouroboros> since presumably it will also happen on the installed version
<Ouroboros> nah, that would more likely cause a kernel panic or similar
<Ouroboros> the video card could be broken though
<Ouroboros> maybe compare what video driver ubuntu is using?
<Ouroboros> also, if you ssh into live after it happens
<Ouroboros> perhaps there is something in the logs
<Ouroboros> dozer: and the installer you used... is it X or curses?
<Ouroboros> well, the curses installer is the one with the pseudo-graphical blue menus
<Ouroboros> (i am not sure if there even exists an X installer)
<Ouroboros> ok
<Ouroboros> dozer: (0) wait until live blanks (2) ssh in, get the logs (3) try running 'xset -dpms' or 'xset dpms force on' in ssh or on command line
<Ouroboros> or 'vbetool dpms on' if not in X
<Ouroboros> doubt any of that will work, but who knows
<Ouroboros> or just have terminal open and type those in
<Ouroboros> shrug
<Ouroboros> different kernel, drivers, settings, who knows
<Ouroboros> dozer: dunno, but it is here: https://en.wikipedia.org/wiki/Debian_version_history#Release_table
<Ouroboros> dozer: is the screen off?
<Ouroboros> not black or something
<Ouroboros> ok
<Ouroboros> so it could be in power save, or something crashed, or ...
<Ouroboros> and it completely works in some other OS right now?
<Ouroboros> well, try some of those ideas ^^
<Ouroboros> the installer was also in X?
<Ouroboros> i think we really need to see the logs
<Ouroboros> figure out how to ssh in there
<Ouroboros> dpkg -i *.deb ?
<Ouroboros> ..
<Ouroboros> dozer: did you figure it out
<Ouroboros> man, the way gcc package versions are done is incredibly annoying
<Ouroboros> specifically e.g. the 'gcc' metapackage that creates links to gcc-*; what if i want an older version? then i have to manually fix all those links
