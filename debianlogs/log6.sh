<jm_>   try #debian-mentors
<jm_>   so perhaps try installing it with debootstrap and bpo kernel
<jm_>   Echoz: yeah centos probably has the 2.6 kernel
<jm_>   have you checked if system stops responding completely after that?
<jm_>   are you sure it's not screensaver killing it? tried to keep it alive by moving the mouse or whatever?
<jm_>   dozer: I mean before it goes off
<jm_>   dozer: up to you, it was just a wild idea
<jm_>   so it's probably not blanking then
<jm_>   as in https://wiki.debian.org/DebianInstaller/Remote
<jm_>   why would you ssh to live environment?
<jm_>   Echoz: yeah but the idea is to start sshd by the installer, that's what network-console preseed setting does and then one can ssh to the dell system from another computer
<jm_>   and install via that, assuming it's not a hard lock or whatever
<jm_>   Echoz: ahh sorry I get it now, yes it would be easier to configure using live that way
<jm_>   Ouroboros: man page says modprobe.blacklist=<module>
<jm_>   man modprobe
<jm_>   it is
<jm_>   judd kernels
<jm_>   please don't do that, we won't help with it either
<jm_>   how exactly do you think ubuntu deb will help then?
<jm_>   if you don't install them, then yes
<jm_>   omi: do debian kernels have relevant config options enabled?
<jm_>   omi: described in filesystems/nfs/nfsroot.txt
<jm_>   but I'll have to go now (should be CONFIG_IP_PNP* or somesuch)
