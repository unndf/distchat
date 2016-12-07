<Echoz> dozer: What model is it?
<Echoz> dozer: I might have one here
<Echoz> dozer: I don't have one here, but I did run debian on that same model with absolutely no problems
<Echoz> for a few months
<Echoz> dozer: Yeah, what graphics does it have, the one I used had intel graphics in a Xeon E3-something
<Echoz> dozer: Ah, I see. Are you able to get a live environment with a command line up?
<Echoz> dozer: Does it have integrated graphics, so you could try that instead?
<Echoz> jm_: Amazon reviews say it works "pretty well" with CentOS 6.3, jessie kernel isn't that old, is it?
<Echoz> dozer: Okay. Seeing as this isn't a particularly high end card, do you by any chance have any spare cards around that you could use instead?
<Echoz> Or if not use, just test to see if it's even related to the graphics card
<Echoz> dozer: I know there's some AMD graphics firmware that's required in certain cases. I'll try to find out whether this is included in the firmware image
<Echoz> dozer: It seems some AMD cards require firmware-linux-nonfree, which is included in the firmware image
<Echoz> dozer: Are you experiencing the same problems both with the graphical and curses installers?
<Echoz> dozer: You could try booting into live and running the installer from there
<Echoz> I don't remember the name of the executable, let me see. I have a live environment running in the other room
<Echoz> dozer: it's "debian-installer-launcher"
<Echoz> dozer: It'll run in the same framebuffer as the console did, so if live works well, then this should be the same
<Echoz> dozer: try booting with consoleblank=0
<Echoz> that should prevent the screen from turning off after a while
<Echoz> dozer: if that works you should probably add that to the kernel parameters in grub after installation, too
<Echoz> Yeah, if running from the live environment you could maybe try setterm -blank 0 -powerdown 0 -powersave off
<Echoz> Ouroboros: If running the default installer it won't be using X
<Echoz> dozer: Oh boy
<Echoz> try without consoleblank=0, then and instead run that command inside
<Echoz> Ouroboros: can you tell me the names of two packages, one that does and one that doesn't and I might be able to tell you
<Echoz> Would hardly be blanking, it should happen only afte 10 minutes of inactivity
<Echoz> This card only has a DMS-59 plug doesn't it
<Echoz> dozer: Do you have another computer in the same network?
<Echoz> dozer: If you run from the live environment, you may be able to start sshd and run the installation from there
<Echoz> dozer: Yup, the newt installer should run just fine inside a terminal emulator on your other computer
<Echoz> Speaking of that I really wonder why I didn't do this while I was setting up a small NFS server at home yesterday...
<Echoz> dozer: Ouroboros is right
<Echoz> it has sudo rights, so just do sudo debian-installer-launcher, or sudo su ...
<Echoz> Yeah, it sets up your first interface automatically
<Echoz> hmm, interesting, gonna do a port scan on the live environment i have running here in the office
<Echoz> it seems login with password is disabled though, don't know if you were able to log in, dozer?
<Echoz> dozer: Yeah, of course you can change the settings, though
<Echoz> Ouroboros: They did, but it was easily changed the same way you would on an installed system
<Echoz> so I was able to log in now
<Echoz> dozer: no, ssh user@hostname
<Echoz> and then the password
<Echoz> probably replace hostname with the IP address
<Echoz> jm_: to install debian, the screen goes blank and won't wake when he uses the installer, even if launched from the console
<Echoz> jm_: is there any advantage to this as opposed to just using ssh in the live environment?
<Echoz> dozer: If you get authentication failure (publickey) let me know and I'll guide you through changing the ssh settings. of course this requires half a minute of access with the keyboard and display...
<Echoz> Ouroboros: true, i could probably do it without with vim
<Echoz> user<return>live<return>sudo su<return>vi /etc/ssh/sshd<tab><return>/PasswordAuth<return>3fndwayes<escape>:wq<return>systemctl restart sshd<return>
<Echoz> that would enable password auth from the login prompt, no need for a display
<Echoz> Ouroboros: some of the init scripts are kept for backwards compatibility, but in Jessie systemd is default
<Echoz> works really well, i use it on almost all of my computers, except my raspberry pi that sits behind my TV with some XBMC distro
<Echoz> Jessie, that is
<Echoz> im getting lunch so i'll be away for a short while
<Echoz> dozer: are you using a live distro with or without a GUI?
<Echoz> dozer: might be easier to use the live image without a GUI, if you lose the display and have to use only keyboard
<Echoz> pdo_fn14: do you have gstreamer?
