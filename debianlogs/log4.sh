<dozer> Anyone encountered a random black screen during installation of debian on dell towers?
<dozer> dell precision t1700 mini tower
<dozer> @Echoz Tried several boot options (vga=normal fb=false got me the furthest) and debian releases.. Weird thing is that ubuntu and lubuntu full CD works and installs just fine. Not Debian however - neither full CD nor netinst for several releases. ubuntu minimal install also fails. Yes, that's also strange - the computer had been running Debian, although a corrupt one, for some time
<dozer> Echoz: Ati firepro something
<dozer> Echoz: Sorry, that's AMD FirePro 2270
<dozer> Echoz: Yep, works just fine with live CD
<dozer> Echoz: I believe it only has the AMD graphics
<dozer> Also tried testing; both the regular and the one w/ extra firmware.
<dozer> Echoz: No, unfortunately.
<dozer> Echoz: Thank you!
<dozer> I'm baffled over how the previous guy got Debian on this machine...
<dozer> Echoz: If by cursers installer you mean the graphical installer then yes - both. Really random where the screen 'looses' its signal. However vga=normal and fb=false as boot parameters gets me the furhtest. Right up until installing grub, which is one of the final steps.
<dozer> Ouroboros: Yep, my thoughts as well
<dozer> jm_: Sometimes it seems like the installation continues, however no reaction to keyboard inputs.
<dozer> Echoz: I'll try that as well
<dozer> Echoz: Thanks
<dozer> Going with live failsage then just to be sure
<dozer> that's failsafe =)
<dozer> Echoz: thanks
<dozer> Echoz: Let's hope so
<dozer> ...
<dozer> sorry guys, same thing happened within the live environment. went black after a while. maybe I didn't run it long enough yesterday
<dozer> Ouroboros: With the live-CD within the live GUI
<dozer> jm_: Nothing happens w/ mouse or keyboard inputs
<dozer> jm_: sorry. Can reload to see if that makes any difference?
<dozer> jm_: at this point I might as well..
<dozer> Echos: I'll give it a go
<dozer> Echoz: Ok. I'll try with 'xset dpms' later if consoleblank=0 doesn't work
<dozer> Echoz: Sweet - I'll try that as well
<dozer> ...
<dozer> Echoz: Died even before I got to the terminal to type 'setterm -blank 0 -powerdown 0 -powersave off'
<dozer> Echoz: ok
<dozer> Thanks for taking the time
<dozer> Echoz: I'm not fast enough to type in the setterm cmd before it 'dies'
<dozer> Ouroboros: Several times
<dozer> Ouroboros: Even switching between DVI and VGA
<dozer> Echoz: Even tried disabling some deep-sleep in the BIOS settings along with some ASPM setting to no avail. Yep, correct
<dozer> Echoz: A DMS-59 and VGa
<dozer> Ouroboros: Yes, tried disconnecting and re-connecting the video cable after it happens
<dozer> Echoz: yes
<dozer> Echoz: so ssh into the Dell precision from another computer and run the installation from the 'other' computer
<dozer> Echoz: ?
<dozer> Echoz: Is there a default hostname/ credentials for the live environment to use w/ ssh?
<dozer> Ouroboros: Thanks.
<dozer> Will DHCP be enabled when starting live then?
<dozer> ok
<dozer> Echoz: Need to locate another computer to use first, and might need to use the cable on this machine
<dozer> Echoz: You tried ssh into a live you have in your office?
<dozer> ok, thanks
<dozer> Echoz: so ssh live@somethingsomething, and user: user, password: live?
<dozer> Echoz: thanks
<dozer> Ouroboros: Sorry for the absence. Would need ssh then as the live goes black fairly quickly.
<dozer> Ouroboros: yes, not sure yes if I'll have a spare computer on the network that I can use
<dozer> yet*
<dozer> Any chance the memory could be corrupt? Although, then the ubuntu should've failed also?
<dozer> Ouroboros: Ok
<dozer> Echoz: Live with gui.
<dozer> Echoz: Sorry, on my personal comp?
<dozer> Ouroboros: Not sure - how can I tell?
<dozer> Ouroboros: Ah. Well, I've used both the non-graphical (pseudo-graphical blue menus) and the graphical one. Not sure if it's X
<dozer> Ouroboros: No, the installer failed around writing to the hdd. But was running ubuntu 14.04 LTS yesterday for a longer period of time (where I could wake it up again after going into sleep)
<dozer> interesting. Got so far in failsafe to set xset -dpms and xset dpms force on (definately X) - and I'm runnning the installer now
<dozer> and it died!
<dozer> Ouroboros: That I don't know. Just said xterm something when I tried to setterm -blank 0 etc..
<dozer> *hate the fact that ubuntu works and debian doesn't on this dell precision
