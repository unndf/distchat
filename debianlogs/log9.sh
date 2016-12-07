<omi>   Hello, I'm trying to make debian boot from iscsi root. It works when I manually add ISCSI target AND manually specify the machine's IP in the kernel boot command. BUT dhcp doesn't work from the kernel when doing ip=dhcp. YES, DHCP server works as it gives it lease twice to do pxe booting (and other hosts dhcp fine too) Any ideas why ip=dhcp just doen'st do anything? DHCPD log says that it offered the lease as before, but
<omi>   kernel doesn't do anything with it.
<omi>   http://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/8.6.0+nonfree/amd64/iso-cd/
<omi>   This is useful for installing firmware for network cards and such
<omi>   you need AMD driver.
<omi>   https://wiki.debian.org/ATIProprietary
<omi>   note that it may have issues with gnome they say.
<omi>   yeah I had fked up monitor, so AMD driver didn't work out of the box right away. but NVIDa proprietary I never had issues.
<omi>   but AMD nice cards :D
<omi>   Can anyone help with my kernel ip=dhcp issue?
<omi>   After several iterations, IP Config: No response after __ seconds
<omi>   dhcpd log says that the lease was offered.
<omi>   jm_ what do you mean 'relevant'?
<omi>   jm_ everything works provided I specify the IP manually in the kernel parameter. But that's one thing I would rather not do to keep the image generic. I want to be able to boot multiple hosts (and them get IP address as needed through dhcp settings rather than doing it)
