Home / #linode / 2016 / 12 / Next Day #linode IRC Logs for 2016-12-05
opened Mon Dec 05 11:49:57 2016
-!- mikegrb [~mikegrb@mikegrb.netop.oftc.net] has joined #linode
-!- Irssi: #linode: Total of 278 nicks [39 ops, 0 halfops, 0 voices, 239 normal]
-!- Irssi: Join to #linode was synced in 0 secs
-!- mode/#linode [+l 281] by ChanServ
-!- madbytes [~madbytes@27.58.130.215] has joined #linode
-!- madbytes is "madbytes" on #linode #tor
-!- mode/#linode [+l 282] by ChanServ
-!- acald3ron [~acald3ron@189.202.66.18] has joined #linode
-!- acald3ron is "realname" on #debian-next #debian-es #linode #debian-mx #debian
-!- mode/#linode [+l 283] by ChanServ
-!- scorche|sh [~scorche@squisch.net] has joined #linode
-!- scorche|sh is "scorche" on #linode-beta #linode
-!- mode/#linode [+l 284] by ChanServ
-!- smintiens [~quassel@2600:3c03::f03c:91ff:fe33:a2f] has left #linode [http://quassel-irc.org - Chat comfortably. Anywhere.]
-!- jas4711 [~jas4711@2001:9b0:104:42::17c] has quit [Ping timeout: 480 seconds]
-!- mode/#linode [+l 282] by ChanServ
-!- whallz [~whallz@177.36.41.106] has joined #linode
-!- whallz is "whallz" on #linode #awesome
-!- PappI [~Vale@7MPAAAFO7.tor-irc.dnsbl.oftc.net] has joined #linode
-!- PappI is "PeterRabbit" on #linode
-!- mode/#linode [+l 284] by ChanServ
-!- madbytes [~madbytes@27.58.130.215] has quit [Read error: Connection reset by peer]
-!- mode/#linode [+l 283] by ChanServ
-!- madbytes [~madbytes@27.58.132.0] has joined #linode
-!- madbytes is "madbytes" on #linode #debian
-!- mode/#linode [+l 284] by ChanServ
-!- frajan [~oftc-webi@117.222.193.252] has joined #linode
-!- frajan is "OFTC WebIRC Client" on #linode
-!- mode/#linode [+l 285] by ChanServ
-!- gbit [~gbenkenst@0001898a.user.oftc.net] has quit [Quit: leaving]
-!- mode/#linode [+l 284] by ChanServ
-!- frajan [~oftc-webi@117.222.193.252] has quit [Remote host closed the connection]
-!- mode/#linode [+l 283] by ChanServ
-!- sandeep [~sandeep@00018713.user.oftc.net] has quit [Quit: sandeep]
-!- mode/#linode [+l 282] by ChanServ
-!- madbytes [~madbytes@27.58.132.0] has quit [Quit: My MacBook has gone to sleep. ZZZzzz…]
-!- mode/#linode [+l 281] by ChanServ
-!- PappI [~Vale@7MPAAAFO7.tor-irc.dnsbl.oftc.net] has quit []
-!- mode/#linode [+l 280] by ChanServ
-!- Cromulent [~Cromulent@bcdd354f.skybroadband.com] has joined #linode
-!- Cromulent is "Cromulent" on #linode
-!- Rajesh [~oftc-webi@117.196.130.54] has joined #linode
-!- Rajesh is "OFTC WebIRC Client" on #linode
-!- mode/#linode [+l 282] by ChanServ
-!- Schaap [~Uniju@9O6AAAE4A.tor-irc.dnsbl.oftc.net] has joined #linode
-!- Schaap is "Lattyware" on #linode
-!- mode/#linode [+l 283] by ChanServ
<Rajesh>    Hi there, i wud like to go for Linode 4GB plan. some doubts - is cpanel available with linode?
-!- jas4711 [~jas4711@155.4.17.2] has joined #linode
-!- jas4711 is "Simon Josefsson" on #virt #tor #OSM.se #osm #mingw-w64 #linode @#gnutls #freedombox #debian-voip #debian.se #debian-reproducible #debian-qa #debian-next #debian-mentors #debian-live #debian-hurd #debian-gnome #debian-boot #debian #debconf #alioth
<grawity>   only if you buy and install it yourself
<Rajesh>    ok. IS the Linode manager free for all the linode users?
-!- mode/#linode [+l 284] by ChanServ
-!- AnMaster [~AnMaster@c83-253-244-64.bredband.comhem.se] has quit [Ping timeout: 480 seconds]
<grawity>   the linode manager is free, but it doesn't actually manage the *insides* of a VPS
-!- Guest691 is now known as mcintosh
<grawity>   (other than perhaps showing graphs/statistics via Longview)
-!- mode/#linode [+o mcintosh] by ChanServ
<Rajesh>    ohh.. so is there any other alternative tools available with linode for what cpanel does
-!- mode/#linode [+l 283] by ChanServ
<grawity>   linode only provides the server itself, really
-!- AnMaster [~AnMaster@c83-253-244-64.bredband.comhem.se] has joined #linode
-!- AnMaster is "AnMaster" on #linode
-!- mode/#linode [+l 284] by ChanServ
<Rajesh>    fine. how reliable is linode, were ther any shutdowns any recently?
<Rajesh>    how reliable is linode, were ther any shutdowns recently?
<csnxs> extremely reliable i'd say
<grawity>   mostly just scheduled reboots for patching up Xen
<grawity>   (like https://status.linode.com/incidents/6lqznlfwlv1r)
<csnxs> or the occasional host maintenance, but they warn you plenty of time ahead
<grawity>   can't remember any unplanned reboot
<grawity>   besides, new VPSes run on KVM anyways
<Rajesh>    okay. and one more. is there any chat support system to address any issues related to the server?
<grawity>   you're chatting on it
<grawity>   well, I guess it's not technically official – they prefer tickets for that
<csnxs> you could probably count on your two hands how many times linode had unplanned downtime in its 13 years of existing
<grawity>   but there *is* a bunch of Linode staff here
<Rajesh>    ho ho...cool. I thought that yhis is some community chat forum for linode users
<grawity>   officially, it is
<@nbrewer>  Rajesh: there's a ticketing system. Members of staff are often in this channel as well, but we can't look up your account details, etc via irc.
<grawity>   unless someone with a hat speaks ↑↑
<@nbrewer>  you can also call us 24/7.
<csnxs> if it's directly related to your linode or your account in particular, it's highly recommended you use the ticket system
-!- peaton [~user@00021c48.user.oftc.net] has quit [Remote host closed the connection]
<csnxs> I'd like to get wasted one night and call Linode and cry about being lonely
<csnxs> then again, I don't need to be wasted to do that
-!- peaton [~user@00021c48.user.oftc.net] has joined #linode
-!- mode/#linode [+o peaton] by ChanServ
-!- peaton is "unknown" on @#linode
-!- kronos003 [~kronos003@hub.hefnerlabs.com] has joined #linode
-!- kronos003 is "Kronos" on #linode
<Rajesh>    okay. thank you guys for the information. i'll most probably be a linode user soon.
-!- mode/#linode [+l 285] by ChanServ
<Rajesh>    bye
-!- Rajesh [~oftc-webi@117.196.130.54] has quit [Quit: Page closed]
-!- mode/#linode [+l 284] by ChanServ
-!- acald3ron [~acald3ron@189.202.66.18] has quit [Quit: Bye Bye, Adios.]
-!- mode/#linode [+l 283] by ChanServ
<csnxs> yay, I got food for my birthday.
-!- Schaap [~Uniju@9O6AAAE4A.tor-irc.dnsbl.oftc.net] has quit []
-!- mode/#linode [+l 282] by ChanServ
-!- newmember [~newmember@d137-186-198-159.abhsia.telus.net] has quit [Ping timeout: 480 seconds]
-!- seanh-corona [~Adium@2603:3024:1818:b2f0:5d8e:b85:6699:5cc4] has joined #linode
-!- seanh-corona is "Adium User" on #linode
<@alexf>    csnxs: I've worked overnight support, and that would not be the strangest call we've received.
<csnxs> i'm now intrigued what the strangest call was
<@alexf>    Maybe I'll tell you sometime.
-!- Karrde [alucard@kalenda.kiserai.net] has left #linode []
-!- mode/#linode [+l 281] by ChanServ
-!- Karrde [alucard@kalenda.kiserai.net] has joined #linode
-!- Karrde is "Talon Karrde" on #linode
-!- mode/#linode [+l 282] by ChanServ
<csnxs> I have doubts you will
-!- ZombieTree [~K3NT1S_aw@9O6AAAE6J.tor-irc.dnsbl.oftc.net] has joined #linode
-!- ZombieTree is "Spikey" on #linode
-!- mode/#linode [+l 283] by ChanServ
-!- blueness is now known as Guest709
<linbot>    New news from forum: Feature Request/Bug Report • Block storage <https://forum.linode.com/viewtopic.php?t=13918&p=72306#p72306>
-!- xxh9 [~xxh9@vpn.space150.com] has joined #linode
-!- xxh9 is "Chris R" on #linode
-!- mode/#linode [+l 284] by ChanServ
<jiggawattz>    Fuck those PM spammers
<jiggawattz>    linode doesn't deserve this B.S.
-!- TomasCZ [~TomasCZ@yes.tenlab.net] has joined #linode
-!- TomasCZ is "Unknown" on #tor @#tenlab #linode #debian #ceph
-!- mode/#linode [+l 285] by ChanServ
-!- Shentino [~Shentino@68-113-29-56.dhcp.knwc.wa.charter.com] has joined #linode
-!- Shentino is "John Doe" on #moocows #linode #oftc #lxde #kernelnewbies #mm #debian #qemu #tux3
-!- mode/#linode [+l 286] by ChanServ
-!- Shentino [~Shentino@68-113-29-56.dhcp.knwc.wa.charter.com] has quit [Remote host closed the connection]
-!- mode/#linode [+l 285] by ChanServ
-!- ZombieTree [~K3NT1S_aw@9O6AAAE6J.tor-irc.dnsbl.oftc.net] has quit []
-!- fergtm [~fergtm@hq-guanatos-01.nilhwk.net] has joined #linode
-!- fergtm is "Fernando" on #linode
-!- kronos003 [~kronos003@hub.hefnerlabs.com] has quit [Ping timeout: 480 seconds]
-!- mode/#linode [+l 284] by ChanServ
-!- kronos003 [~kronos003@hub.hefnerlabs.com] has joined #linode
-!- kronos003 is "Kronos" on #linode
-!- mode/#linode [+l 285] by ChanServ
-!- marshmn [~matt@marshmn.plus.com] has joined #linode
-!- marshmn is "Matt Marsh" on #linode
-!- mode/#linode [+l 286] by ChanServ
-!- Cromulent|2 [~Cromulent@bcdd354f.skybroadband.com] has joined #linode
-!- Cromulent|2 is "Cromulent" on #linode
<DrJ>   linode needs to check the clock on the server running the forum
-!- mode/#linode [+l 287] by ChanServ
<DrJ>   eh, nvm
<cruxeternus>   I think you're right
<DrJ>   it's weird
<cruxeternus>   I'm showing a caker post at 2:28 PM
<millisa>   or someone needs to stop meddling in the future
<cruxeternus>   It's 2:21 ET
<DrJ>   yea, but now it's showing 1:28 after I refreshed
<cruxeternus>   Maybe caker is just ahead of us
<DrJ>   or should say, after I responded
<DrJ>   and mine shows 2:22 or so
<cruxeternus>   DrJ: Your post shows 3:21 PM here.. I'm in CT
<nate>  Worth noting I believe it adjusts time based on your own system
<DrJ>   :)
<cruxeternus>   Yes, but it's adjusting... incorrectly somehow
<nate>  Have you checked to make sure -your- system isn't out of sync?
-!- rnowak_ [~rnowak@argon.sciencia.se] has joined #linode
-!- rnowak_ is "Robert A. Nowak" on #moocows #linode #oftc
-!- wraeth_ [~wraeth@wraeth.id.au] has joined #linode
-!- wraeth_ is "wraeth" on #linode
<nate>  Oh nevermind DrJ is saying the same thing
<nate>  I thought he was saying it looked normal for him
-!- Netsplit magnet.oftc.net <-> helix.oftc.net quits: xinming_, neo^, jas4711, azaghal, eju, rnowak, eagle, SNy, pavlushka, grawity, (+7 more, use /NETSPLIT to show all of them)
<@alexf>    I think it's on purpose, to demonstrate that time is both relative and subjective to the person experiencing it.
<cruxeternus>   The time apparently changes after a reload
<cruxeternus>   which is... odd
<DrJ>   yea, same happened for me cruxeternus
<nate>  Judging from the fact that DrJ's time states 3:21PM to me, I'm guessing the forum is set to a GMT-4 for some reason
<millisa>   no no no, I think it means I get an extra hour for lunch
<DrJ>   originally said 2:28
<DrJ>   then changed to 1:28
-!- mode/#linode [+l 272] by ChanServ
<millisa>   2 extra hours for lunch then
<@alexf>    That's a lunch break I can get behind.
<nate>  either that or it handled DST poorly
<nate>  Or apparently it handles no timezones properly, the timezone dropdown in the board settings is blank
<nate>  lol
<@mcintosh> DrJ: fixed, thanks!
<DrJ>   mcintosh, so there was a problem?
-!- Netsplit over, joins: jiggawattz
<nate>  mcintosh: Still looks broke to me, board looks to be defaulting TZ w/ DST with no config options
<linbot>    New news from forum: Feature Request/Bug Report • Block storage <https://forum.linode.com/viewtopic.php?t=13918&p=72307#p72307>
-!- Netsplit over, joins: AnMaster
-!- rnowak_ is now known as rnowak
-!- Netsplit over, joins: eagle
<@mcintosh> nate: wasn't what I fixed, not sure why that's happening though
-!- mode/#linode [+l 275] by ChanServ
-!- RumpledElf [~textual@node-ttn52ryvq5v6f.syd-elf.v6.for-no-reason.net] has joined #linode
-!- RumpledElf is "Textual User" on #linode
-!- Netsplit over, joins: neo^
-!- neo^ is "neo" on #linode #debian-next #debian-live #debian
<nate>  mcintosh: Did you guys modify the theme? Check your language/en_US/common.php file, make sure the TZ declarations are set :P
<nate>  or is it language/en/common.php, I forget
-!- mode/#linode [+l 277] by ChanServ
<@mcintosh> nate: noted... I can change yours in the meantime if you'd like :)
-!- SNy [c57d65187a@bmx-chemnitz.de] has joined #linode
-!- SNy is "Marko Friedemann" on #g7 #xbox-linux #linode #uml
-!- Netsplit over, joins: rollingWolf
*   csnxs eats chocolate
-!- xinming [~hyy@115.221.44.34] has joined #linode
-!- xinming is "Unknown" on #linode
<@mcintosh> DrJ: the problem was that caker was revealing our secret time traveling technology :P
<DrJ>   ah
<DrJ>   I knew it
<@alexf>    SSSSHHHHHH
-!- mode/#linode [+l 280] by ChanServ
<nate>  been a while since I messed with phpBB3
*   csnxs eats another chocolate
<nate>  mcintosh: nah I'm cool, I don't use the forum much lol
-!- Bromine [~Wijk@4JHAAAF4V.tor-irc.dnsbl.oftc.net] has joined #linode
-!- Bromine is "mog_" on #linode
-!- mode/#linode [+l 281] by ChanServ
<nate>  also I guess I should be amused that a freenode netsplit just hung my client up worse than that 600~ privmsg spam net did lol
*   csnxs gives himself diabeetus
-!- pavlushka [~pavlushka@00021abb.user.oftc.net] has joined #linode
-!- pavlushka is "Pavel Sayekat" on #debconf #debconf16-menzies-10 #debconf16-menzies-12 #debconf16-menzies-9 #oftc #OpenBSD #debian-printing #debian-offtopic #debian-mozilla #debian #alioth #linode #tor-project #ubuntu-expats
-!- jas4711 [~jas4711@2001:9b0:104:42::17c] has joined #linode
-!- jas4711 is "Simon Josefsson" on #linode #mingw-w64 #osm #OSM.se #tor #virt
-!- mode/#linode [+l 283] by ChanServ
-!- eju is "Eivind Uggedal" on #debian
-!- eju [~eju@00021893.user.oftc.net] has joined #linode
-!- grawity [grawity@virgule.cluenet.org] has joined #linode
-!- marshmn [~matt@marshmn.plus.com] has joined #linode
-!- grawity is "Mantas Mikulėnas <grawity@gmail.com>" on #debian-next #debian #linode #debian-systemd
-!- marshmn is "Matt Marsh" on #linode
-!- mode/#linode [+l 286] by ChanServ
-!- larsdesigns [~larsdesig@c-73-34-30-85.hsd1.co.comcast.net] has joined #linode
-!- larsdesigns is "larsdesigns" on #linode
-!- monokrome [~monokrome@54.88.139.115] has quit [Quit: Well, I'm pretty sure that was a mistake...]
-!- whallz [~whallz@177.36.41.106] has quit [Quit: leaving]
-!- mode/#linode [+l 285] by ChanServ
-!- Shentino [~Shentino@68-113-29-56.dhcp.knwc.wa.charter.com] has joined #linode
-!- Shentino is "John Doe" on #moocows #linode #oftc #lxde #kernelnewbies #mm #debian #qemu #tux3
-!- mode/#linode [+l 286] by ChanServ
-!- Bromine [~Wijk@4JHAAAF4V.tor-irc.dnsbl.oftc.net] has quit []
-!- mode/#linode [+l 285] by ChanServ
-!- anomie [~anomie@00018802.user.oftc.net] has quit [Quit: Leaving]
-!- mode/#linode [+l 284] by ChanServ
<cruxeternus>   Uh oh... here we go again...
-!- marshmn [~matt@marshmn.plus.com] has quit [Ping timeout: 480 seconds]
<cruxeternus>   Oh, nm.... "It Came From Freenode" this time, apparently
-!- mode/#linode [+l 283] by ChanServ
-!- Cromulent|2 [~Cromulent@bcdd354f.skybroadband.com] has quit [Quit: KVIrc 4.2.0 Equilibrium http://www.kvirc.net/]
-!- mode/#linode [+l 282] by ChanServ
-!- AotC [~Plesioth@9O6AAAFB6.tor-irc.dnsbl.oftc.net] has joined #linode
-!- AotC is "Kakeru" on #linode
<DrJ>   yea, freenode is getting hit again
-!- mode/#linode [+l 283] by ChanServ
-!- RumpledElf [~textual@node-ttn52ryvq5v6f.syd-elf.v6.for-no-reason.net] has quit [Quit: My iMac has gone to sleep. ZZZzzz…]
<MajObviousman> mcintosh: you need to go back in time to before 1930UTC and stop yourself from revealing about the time traveling technology
<@alexf>    Easy enough to do, just spin up a Linode1.21G
-!- mode/#linode [+l 282] by ChanServ
*   MajObviousman stares
<@alexf>    ....get it?
<@alexf>    MajObviousman: see, there's this movie called "Back to The Future"
<MajObviousman> yes
<MajObviousman> I get it
*   MajObviousman continues to stare
<@alexf>    OK, good.
<@alexf>    http://krl.io/f81e7
<MajObviousman> http://media.riffsy.com/images/1e234005cf154b18a0687f5067461053/raw
<MajObviousman> god that hurts my eyes
<@alexf>    http://krl.io/5e534
<MajObviousman> http://media.riffsy.com/images/0abe6de2553acd96d016ffdb56e130ef/raw
<@alexf>    http://krl.io/4436c
-!- troy [~troy@00012f14.user.oftc.net] has quit [Ping timeout: 480 seconds]
-!- mode/#linode [+l 281] by ChanServ
<MajObviousman> http://media.riffsy.com/images/d0a4caede6c27bb39ea426d82bbb2112/raw
-!- fergtm [~fergtm@hq-guanatos-01.nilhwk.net] has quit [Quit: Leaving]
-!- mode/#linode [+l 280] by ChanServ
-!- fergtm [~fergtm@hq-guanatos-01.nilhwk.net] has joined #linode
-!- fergtm is "realname" on #linode
-!- AotC [~Plesioth@9O6AAAFB6.tor-irc.dnsbl.oftc.net] has quit []
-!- Ikaros [ikaros@0001b4e0.user.oftc.net] has joined #linode
-!- Ikaros is "Ikaros" on #linode
-!- zaquest [~notzaques@5.128.210.30] has joined #linode
-!- zaquest is "realname" on #linode #suckless #haskell
-!- mode/#linode [+l 282] by ChanServ
-!- vend3r [~roaet@4JHAAAF8K.tor-irc.dnsbl.oftc.net] has joined #linode
-!- vend3r is "Pieman" on #linode
-!- mode/#linode [+l 283] by ChanServ
-!- Kassandry [~Kassandry@kassandry.net] has joined #linode
-!- Kassandry is "Kassandry" on #linode
-!- mode/#linode [+l 284] by ChanServ
-!- acald3ron [~acald3ron@189.202.66.18.cable.dyn.cableonline.com.mx] has joined #linode
-!- acald3ron is "realname" on #debian-next #debian-es #linode #debian-mx #debian
-!- mode/#linode [+l 285] by ChanServ
-!- kronos003 [~kronos003@hub.hefnerlabs.com] has quit [Quit: leaving]
-!- Cromulent [~Cromulent@bcdd354f.skybroadband.com] has joined #linode
-!- Cromulent is "Cromulent" on #linode
-!- troy [~troy@00012f14.user.oftc.net] has joined #linode
-!- troy is "troy" on #linode
-!- mode/#linode [+l 286] by ChanServ
<acald3ron> cant i make a ddns with linode-cli in android ?
<@nbrewer>  acald3ron: huh? do you mean the android mobile client?
<@nbrewer>  the Linode CLI only supports MacOS and Ubuntu/Debian.
<acald3ron> nbrewer, i update my ddns with linode-cli my computer and i want to to know if is posible in android.
<@nbrewer>  Oh okay. I just checked on iOS, and the mobile app lets me add / modify DNS zones.
<@nbrewer>  I don't have an Android phone handy, but I believe the functionality should be the same.
-!- vend3r [~roaet@4JHAAAF8K.tor-irc.dnsbl.oftc.net] has quit []
-!- mode/#linode [+l 285] by ChanServ
<@nbrewer>  acald3ron: https://play.google.com/store/apps/details?id=com.linode.manager&hl=en
-!- pavlushka [~pavlushka@00021abb.user.oftc.net] has quit [Quit: See you on the other side.....]
-!- mode/#linode [+l 284] by ChanServ
-!- scorche|sh [~scorche@squisch.net] has quit [Ping timeout: 480 seconds]
-!- mode/#linode [+l 283] by ChanServ
<acald3ron> nbrewer, good. i didt think about that.
-!- NomadJim [~Jim@72.168.161.128] has joined #linode
-!- NomadJim is "Nomad" on #linode #debian
-!- mode/#linode [+l 284] by ChanServ
-!- steveski [~steveg@38.140.17.170] has quit [Remote host closed the connection]
-!- mode/#linode [+l 283] by ChanServ
-!- acald3ron [~acald3ron@189.202.66.18.cable.dyn.cableonline.com.mx] has quit [Quit: Bye Bye, Adios.]
-!- Cromulent [~Cromulent@bcdd354f.skybroadband.com] has quit [Quit: KVIrc 4.2.0 Equilibrium http://www.kvirc.net/]
-!- mode/#linode [+l 281] by ChanServ
<dwfreed>   I mean, linode-cli is just using the API
-!- marshmn [~matt@marshmn.plus.com] has joined #linode
-!- marshmn is "Matt Marsh" on #linode
-!- mode/#linode [+l 282] by ChanServ
-!- andrew_m [~nupanick@4JHAAAGB1.tor-irc.dnsbl.oftc.net] has joined #linode
-!- andrew_m is "Xeon06" on #linode
-!- mode/#linode [+l 283] by ChanServ
-!- troy [~troy@00012f14.user.oftc.net] has quit [Ping timeout: 480 seconds]
-!- mode/#linode [+l 282] by ChanServ
-!- acald3ron [~acald3ron@189.202.66.18.cable.dyn.cableonline.com.mx] has joined #linode
-!- acald3ron is "realname" on #debian-next #debian-es #linode #debian-mx #debian
-!- mode/#linode [+l 283] by ChanServ
-!- scorche|sh [~scorche@squisch.net] has joined #linode
-!- scorche|sh is "scorche" on #linode-beta #linode
-!- mode/#linode [+l 284] by ChanServ
-!- kronos003 [~kronos003@hub.hefnerlabs.com] has joined #linode
-!- kronos003 is "Kronos" on #linode
-!- mode/#linode [+l 285] by ChanServ
-!- Cromulent [~Cromulent@bcdd354f.skybroadband.com] has joined #linode
-!- Cromulent is "Cromulent" on #linode
-!- mode/#linode [+l 286] by ChanServ
-!- marshmn [~matt@marshmn.plus.com] has quit [Ping timeout: 480 seconds]
-!- mode/#linode [+l 285] by ChanServ
-!- fstd [~fstd@x4e31ca98.dyn.telefonica.de] has quit [Remote host closed the connection]
-!- mode/#linode [+l 284] by ChanServ
-!- andrew_m [~nupanick@4JHAAAGB1.tor-irc.dnsbl.oftc.net] has quit []
-!- fstd [~fstd@x4db5ab6f.dyn.telefonica.de] has joined #linode
-!- fstd is "fstd" on #gentoo #linuxfs #gcc #awesome #oftc #vserver #suckless #osm #linode #debian #kernelnewbies
-!- monokrome [~monokrome@54.88.139.115] has joined #linode
-!- monokrome is "Bailey Stoner" on @#berkshelf #oftc #swig #suckless #linode
-!- mode/#linode [+l 285] by ChanServ
-!- fstd [~fstd@x4db5ab6f.dyn.telefonica.de] has quit [Remote host closed the connection]
-!- mode/#linode [+l 284] by ChanServ
-!- troy [~troy@00012f14.user.oftc.net] has joined #linode
-!- troy is "troy" on #linode
-!- mode/#linode [+l 285] by ChanServ
-!- fstd [~fstd@x4e3142ef.dyn.telefonica.de] has joined #linode
-!- fstd is "fstd" on #gentoo #linuxfs #gcc #awesome #oftc #vserver #suckless #osm #linode #debian #kernelnewbies
-!- mode/#linode [+l 286] by ChanServ
-!- steveski [~steveg@pool-100-34-147-109.phlapa.fios.verizon.net] has joined #linode
-!- steveski is "purple" on #linode
-!- Cromulent [~Cromulent@bcdd354f.skybroadband.com] has quit [Quit: KVIrc 4.2.0 Equilibrium http://www.kvirc.net/]
-!- qable [~lobstar@4JHAAAGEZ.tor-irc.dnsbl.oftc.net] has joined #linode
-!- qable is "Fapiko" on #linode
-!- mode/#linode [+l 287] by ChanServ
-!- marshmn [~matt@marshmn.plus.com] has joined #linode
-!- marshmn is "Matt Marsh" on #linode
-!- mode/#linode [+l 288] by ChanServ
-!- Sputnik7 [~Sputnik7@c-73-89-205-44.hsd1.ma.comcast.net] has joined #linode
-!- Sputnik7 is "floating" on #linode
-!- mode/#linode [+l 289] by ChanServ
-!- xxh9 [~xxh9@vpn.space150.com] has quit [Quit: Leaving.]
-!- mode/#linode [+l 288] by ChanServ
-!- hfb [~hfb@47.139.20.20] has quit [Read error: Connection reset by peer]
-!- schwa [~laptopdud@pool-108-24-123-77.cmdnnj.fios.verizon.net] has joined #linode
-!- schwa is "purple" on #linode
-!- qable [~lobstar@4JHAAAGEZ.tor-irc.dnsbl.oftc.net] has quit []
-!- mode/#linode [+l 287] by ChanServ
-!- TomasCZ [~TomasCZ@yes.tenlab.net] has quit [Remote host closed the connection]
<Eugene>    Shit, I can't remember if I've been Linodin' already today.
-!- mode/#linode [+l 286] by ChanServ
<cruxeternus>   I have no entry from you in my buffer, dating back to yesterday.
<Eugene>    Do I do it again and run the risk of doubling-up? Or skip a day?
<Eugene>    And then does THIS count as Linodin' ?
<cruxeternus>   These are the only lines you've uttered in 24 hours... so whatever satisfies the requirement :P
<Eugene>    Really I ought to make a cron job that does it for me, with a bit of variance to keep alexf on his toes
-!- eyepulp [~eyepulp@107.152.3.83] has quit [Remote host closed the connection]
-!- hfb [~hfb@47.139.20.20] has joined #linode
-!- hfb is "hfb" on #linode #uml #sclug
<@alexf>    Eugene: consider just making a status page, which can determind if you are linodin' using code resembling: IF day == *day THEN Eugene.status(Linodin') = true;
*   alexf sees his typo, doesn't care, is going home.
<Eugene>    Ooooh, a nagios check
<praetorian>    that's some scary looking pseudocode
<@alexf>    I assume, of course, that you probably won't be Linodin' at the end of days.
<FluffyFoxeh>   nope
<FluffyFoxeh>   every day.
<Eugene>    Only on days that are a day
<millisa>   he might be. there's probably a reason IT folks are never in zombie films...
<Eugene>    You must never Linode after midnight, much like gremlins
<FluffyFoxeh>   day == *day... comparing a pointer to a non-pointer. hm
<Eugene>    I assume that pseudocode is run against PHP4
<dwfreed>   ...but it's always after midnight
*   dwfreed runs
<FluffyFoxeh>   yeah I never did get that
<Eugene>    I think its "between midnight and sunrise"
<millisa>   i thought it was still 3 minutes until midnight?
<dwfreed>   the quote is just "after midnight" thought
<dwfreed>   s/t$//
<millisa>   http://thebulletin.org/sites/default/files/2016%20doomsday%20clock%20statement%20-%20final%5B5%5D.pdf
<Eugene>    That's a Linkin Park album
<millisa>   I'm wagering well be 2 minutes till when they do this january's report...
*   FluffyFoxeh says "the end is near" in a spooky voice
*   FluffyFoxeh checks if anyone is spooked
<Nivex> FluffyFoxeh: nah, we've known that since Election Day
<FluffyFoxeh>   we've known that since language has permitted us to have a concept of both the future and the end
<millisa>   the portents are all there. the cubs. the re-release of ghostbusters.
<Eugene>    I received my 2016 Sucked t-shirt today
-!- schwa [~laptopdud@pool-108-24-123-77.cmdnnj.fios.verizon.net] has quit [Ping timeout: 480 seconds]
-!- mode/#linode [+l 285] by ChanServ
-!- Shnaw [~click@4JHAAAGHR.tor-irc.dnsbl.oftc.net] has joined #linode
-!- Shnaw is "TehZomB" on #linode
-!- mode/#linode [+l 286] by ChanServ
-!- marshmn [~matt@marshmn.plus.com] has quit [Ping timeout: 480 seconds]
-!- larsdesigns [~larsdesig@c-73-34-30-85.hsd1.co.comcast.net] has quit [Quit: Leaving]
-!- mode/#linode [+l 284] by ChanServ
-!- seanh-corona [~Adium@2603:3024:1818:b2f0:5d8e:b85:6699:5cc4] has quit [Quit: Leaving.]
-!- mode/#linode [+l 283] by ChanServ
-!- schwa [~laptopdud@pool-108-24-123-77.cmdnnj.fios.verizon.net] has joined #linode
-!- schwa is "purple" on #linode
-!- mode/#linode [+l 284] by ChanServ
-!- Shnaw [~click@4JHAAAGHR.tor-irc.dnsbl.oftc.net] has quit []
-!- mollstam [~Jase@9O6AAAFL1.tor-irc.dnsbl.oftc.net] has joined #linode
-!- mollstam is "Silentkillzr" on #linode
<JeremyE77> Is it strange that the internet is FASTER using OpenVPN than without? Seems strange.
<dwfreed>   ISP throttling certain ports
<JeremyE77> oh
<devilspgd> JeremyE77: Depends on the endpoint, might be defeating ISP throttling, or maybe just better routing.
<JeremyE77> I'll take it...I guess :P unintended *good* side-effects are rare
<JeremyE77> The internet is now faster than this machines hard drive. (that's not saying much though)
<JeremyE77> might as well disable caches
-!- eyepulp [~eyepulp@107.152.7.131] has joined #linode
-!- eyepulp is "eyepulp" on #linode
-!- mode/#linode [+l 285] by ChanServ
<FluffyFoxeh>   probably better routing
<Nivex> I used to watch YouTube scream over my HE tunnel and crawl when I was forced back to v4. ISPs do love them some traffic shaping.
<Nivex> tunnel would fly because they didn't shape proto41
-!- arcee [~oftc-webi@24.231.42.12] has joined #linode
-!- arcee is "OFTC WebIRC Client" on #linode
<arcee> Hello all!
<arcee> I'm new to Linode.
<JeremyE77> Hello. Hello.
<arcee> One quick question...
<arcee> Can be a deal breaker for me with Linode..
-!- mode/#linode [+l 286] by ChanServ
<JeremyE77> two question minimum!
<arcee> And I hate that I had to pay $5 to create an account just to ask this.. :(
<JeremyE77> You can get a refund within a week. :)
<arcee> But does Linode have VPC support like Amazon's AWS?
<arcee> And can it connect to Mikrotik routers easily?
<arcee> There.. two questions :)
-!- arcee is now known as Arcee
<JeremyE77> :)
<Arcee> Love the fact that this support group is on irc... man, takes me back in time..
<JeremyE77> I have no experience with VPC, specificially. It seems similar to "Private IP addresses" You can also create your own little private (public) network using other methods but Private IPs is the only inbuilt solution I can think of. Someone may have more experience with this if you hang around.
<Peng>  JeremyE77: An AWS VPC is like a VLAN with NAT and a firewall, though.
-!- mollstam [~Jase@9O6AAAFL1.tor-irc.dnsbl.oftc.net] has quit []
<JeremyE77> I figured there was more to it :)
-!- mode/#linode [+l 285] by ChanServ
<Arcee> So here's the concept... a virtual router is created, I can create a secure tunnel using ipsec between that routers and my on-site router.
<Peng>  more to it, omg
<Peng>  I spent like 45 minutes the other day reading documentation and flipping settings in a VPC
<Arcee> There is then a private network on the Linode end behind that virtual router..
<JeremyE77> Arcee: that is possible. I have a similar thing going on myself but it is not a built in option with Linode.
<Arcee> Point me to documentation?
<dwfreed>   you can set up an IPsec tunnel on your Linode; note that you will need to NAT traffic both ways due to linode's restrictions on what traffic can enter and leave a Linode
<Arcee> I need to see the concept.. Linode approach.
<JeremyE77> I just kind of tunnel the servers to each other like dwfreed said. I have no documentation because I am not even sure what I created is a best practice style network lol
<JeremyE77> In the style of...It works for me (and probably no one else).
<Peng>  JeremyE77: https://aws.amazon.com/documentation/vpc/ THE DOCS ARE 11 MiB IN PDF
<JeremyE77> Good lord!
<Peng>  THEY'RE AVAILABLE ON KINDLE
<JeremyE77> In that case! I'm in!
-!- troy [~troy@00012f14.user.oftc.net] has quit [Ping timeout: 480 seconds]
-!- rwaweber [~rwaweber@00022c32.user.oftc.net] has quit [Quit: ZNC 1.6.1 - http://znc.in]
-!- mode/#linode [+l 283] by ChanServ
<Eugene>    I have them on my Kindle
<react> JeremyE77: VPC from AWS is pretty sweet, if you're considering it
-!- kronos003 [~kronos003@hub.hefnerlabs.com] has quit [Quit: leaving]
-!- troy [~troy@00012f14.user.oftc.net] has joined #linode
-!- troy is "troy" on #linode
<Peng>  react: Like most aspects of AWS, it's probably nice, but sooo complicated if it's more than you need.
<react> complication is relative
<Peng>  did i mention the docs are 11 MiB?
<dwfreed>   that's it?
*   dwfreed ducks
<Peng>  It's not more complicated than it needs to be, but it's complicated.
<Arcee> Seems costly though..
<Arcee> Unless I'm doing something wrong..
<Arcee> AWS VPC that is..
-!- Inuyasha [~Maza@9O6AAAFN7.tor-irc.dnsbl.oftc.net] has joined #linode
-!- Inuyasha is "isaxi" on #linode
<Peng>  A VPC itself is free. Everything else costs money. (Including unused elastic IPs.)
-!- mode/#linode [+l 284] by ChanServ
<react> I've got it all templated via CloudFormation; VPC inherently doesn't cost anything, except if you're doing EIPs, NAT Gateway(s), etc.
<Arcee> Well I need NAT Gateways and at least EIP...
<Arcee> Then the EC2 Host cost money..
<Peng>  NAT Gateway itself doesn't cost money, does it?
-!- eyepulp [~eyepulp@107.152.7.131] has quit [Remote host closed the connection]
<Arcee> So... $80/month
<Peng>  Transfer does, but
<Arcee> More or less..
<react> NAT Gateway is billable, yes.
-!- mode/#linode [+l 283] by ChanServ
-!- Arcee [~oftc-webi@24.231.42.12] has quit [Quit: Page closed]
<Eugene>    My 2c: AWS isn't worth it for "serious" stuff until you're spending about more on hosting than on salary
-!- Hobbits|away [~kh@154.58.106.42] has quit [Ping timeout: 483 seconds]
<react> I disagree.
-!- mode/#linode [+l 281] by ChanServ
<Eugene>    It's a practical rule; I don't see the point in adapting your architecture to fit their raw materials unless the savings would let you eliminate headcount. This is a manager-style approach, not a technical one
<Eugene>    I know there's many things you /can/ do on the cheap on AWS, but I have a gigabit connection and a fileserver with lots of CPU+RAM.... so meh
<react> Sounds like you're describing a legacy, monolithic work-load; and when that sexy file-server fails?
-!- jiggawattz [jiggawattz@w0000.net] has quit [Quit: tschüß!]
-!- mode/#linode [+l 280] by ChanServ
-!- jiggawattz [jiggawattz@w0000.net] has joined #linode
-!- jiggawattz is "j. iggawattz" on #linode
-!- troy [~troy@00012f14.user.oftc.net] has quit [Ping timeout: 480 seconds]
<Eugene>    Then I build another one? There's nothing serious here, just my toy projects
-!- aspis_ [~aspis@207.242.205.162] has quit [Ping timeout: 480 seconds]
-!- mode/#linode [+l 279] by ChanServ
-!- ava [~oftc-webi@123.149.7.15] has joined #linode
-!- ava is "OFTC WebIRC Client" on #linode
<ava>   hi
-!- mode/#linode [+l 280] by ChanServ
<ava>   only linux os here ?
-!- jrthib [~jrthib@ip68-9-135-79.ri.ri.cox.net] has joined #linode
-!- jrthib is "Anonymous User" on #linode
-!- mode/#linode [+l 281] by ChanServ
-!- troy [~troy@00012f14.user.oftc.net] has joined #linode
-!- troy is "troy" on #linode
-!- mode/#linode [+l 282] by ChanServ
-!- ava [~oftc-webi@123.149.7.15] has quit []
-!- Inuyasha [~Maza@9O6AAAFN7.tor-irc.dnsbl.oftc.net] has quit []
-!- AG_Scott [~nicatronT@4JHAAAGM0.tor-irc.dnsbl.oftc.net] has joined #linode
-!- AG_Scott is "Zombiekiller" on #linode
-!- mode/#linode [+l 281] by ChanServ
-!- steveski [~steveg@pool-100-34-147-109.phlapa.fios.verizon.net] has quit [Remote host closed the connection]
-!- mode/#linode [+l 280] by ChanServ
-!- seanh-corona [~Adium@2603:3024:1515:7df0:31ae:9fe7:e241:c225] has joined #linode
-!- seanh-corona is "Adium User" on #linode
-!- mode/#linode [+l 281] by ChanServ
-!- AG_Scott [~nicatronT@4JHAAAGM0.tor-irc.dnsbl.oftc.net] has quit []
-!- mode/#linode [+l 280] by ChanServ
-!- Cruiser [~Cruiser@99-198-153-216.mci.googlefiber.net] has joined #linode
-!- Cruiser is "Cruiser" on #linode
-!- mode/#linode [+l 281] by ChanServ
-!- Cruiser` [~Cruiser@99-198-153-216.mci.googlefiber.net] has quit [Ping timeout: 480 seconds]
-!- mode/#linode [+l 280] by ChanServ
-!- blaflamme [~blaflamme@2001:18c0:25e:926:3de4:1f25:a1bf:6309] has quit [Quit: Textual IRC Client: www.textualapp.com]
-!- jaylark [~jay@c-73-74-159-10.hsd1.il.comcast.net] has joined #linode
-!- jaylark is "jay" on #linode
<react> Eugene: sounds like we're describing apples and oranges ;)
<Eugene>    Yes, that's kind of my point: at small-potatoes scale there's no point. I don't have a bushel.
<Eugene>    I think that worrying about $20/mo for this or that is either silly because that's your entire budget, or its silly because I spend more than that on lunch
<Eugene>    /shrug
-!- jrthib [~jrthib@ip68-9-135-79.ri.ri.cox.net] has quit [Quit: jrthib]
-!- gadams_ is now known as gadams
-!- mode/#linode [+l 279] by ChanServ
-!- notmyname [~Tenk@9O6AAAFRQ.tor-irc.dnsbl.oftc.net] has joined #linode
-!- notmyname is "kalleeen" on #linode
-!- mode/#linode [+l 280] by ChanServ
-!- aspis_ [~aspis@207.242.205.162] has joined #linode
-!- aspis_ is "aspis" on #linode
-!- jrthib [~jrthib@ip68-9-135-79.ri.ri.cox.net] has joined #linode
-!- jrthib is "Anonymous User" on #linode
-!- gko [~gko@2400:8900::f03c:91ff:fe70:e605] has quit [Quit: ZNC - http://znc.in]
-!- mode/#linode [+l 281] by ChanServ
-!- jrthib [~jrthib@ip68-9-135-79.ri.ri.cox.net] has quit []
-!- mode/#linode [+l 280] by ChanServ
-!- aspis_ [~aspis@207.242.205.162] has quit [Ping timeout: 480 seconds]
-!- mode/#linode [+l 279] by ChanServ
-!- Nivex [~kjotte@00011e18.user.oftc.net] has quit [Quit: kernel reboot]
-!- mode/#linode [+l 278] by ChanServ
-!- jrthib [~jrthib@ip68-9-135-79.ri.ri.cox.net] has joined #linode
-!- jrthib is "Anonymous User" on #linode
-!- jrthib [~jrthib@ip68-9-135-79.ri.ri.cox.net] has quit []
-!- notmyname [~Tenk@9O6AAAFRQ.tor-irc.dnsbl.oftc.net] has quit []
-!- mode/#linode [+l 277] by ChanServ
-!- Kealper [~nih@9O6AAAFSR.tor-irc.dnsbl.oftc.net] has joined #linode
-!- Kealper is "Bwana" on #linode
-!- Nivex [~kjotte@00011e18.user.oftc.net] has joined #linode
-!- Nivex is "Kevin Otte" on #powerdns #ipv6 #linode
-!- mode/#linode [+l 279] by ChanServ
-!- aspis [~aspis@0001b93f.user.oftc.net] has joined #linode
-!- aspis is "aspis" on #linode
-!- mode/#linode [+l 280] by ChanServ
-!- hfb [~hfb@47.139.20.20] has quit [Quit: Ex-Chat]
-!- Kealper [~nih@9O6AAAFSR.tor-irc.dnsbl.oftc.net] has quit []
-!- mode/#linode [+l 279] by ChanServ
-!- mode/#linode [+l 278] by ChanServ
-!- seanh-corona [~Adium@2603:3024:1515:7df0:31ae:9fe7:e241:c225] has quit [Quit: Leaving.]
-!- mode/#linode [+l 277] by ChanServ
-!- larsdesigns [~larsdesig@c-73-34-30-85.hsd1.co.comcast.net] has joined #linode
-!- larsdesigns is "larsdesigns" on #linode
-!- mode/#linode [+l 278] by ChanServ
-!- acald3ron [~acald3ron@189.202.66.18.cable.dyn.cableonline.com.mx] has quit [Remote host closed the connection]
-!- mode/#linode [+l 277] by ChanServ
-!- seanh-corona [~Adium@23-24-204-249-static.hfc.comcastbusiness.net] has joined #linode
-!- seanh-corona is "Adium User" on #linode
-!- mode/#linode [+l 278] by ChanServ
-!- seanh-corona [~Adium@23-24-204-249-static.hfc.comcastbusiness.net] has quit []
-!- mode/#linode [+l 277] by ChanServ
-!- Hobbits|away [~kh@154.58.106.42] has joined #linode
-!- Hobbits|away is "Khobbits" on #linode
-!- mode/#linode [+l 278] by ChanServ
-!- fstd_ [~fstd@x4db6e913.dyn.telefonica.de] has joined #linode
-!- fstd_ is "fstd" on #gentoo #linuxfs #gcc #awesome #oftc #vserver #suckless #osm #linode #debian #kernelnewbies
-!- fstd [~fstd@x4e3142ef.dyn.telefonica.de] has quit [Read error: Connection reset by peer]
-!- fstd_ is now known as fstd
<Nivex> mmm new 4.8 kernel: http://news.softpedia.com/news/linux-kernel-4-8-12-released-brings-pa-risc-powerpc-and-x86-improvements-510685.shtml
<dwfreed>   > softpedia
<Peng>  I wonder how many new bugs it adds and removes
<dwfreed>   those are features, not bugs
<Peng>  >:|
<dwfreed>   mm, oom: stop pre-mature high-order OOM killer invocations
<dwfreed>   there are KVM fixes too
<Peng>  :O
<Peng>  dwfreed: That sounds bad.
<Peng>  "so a risk of a livelock without any way forward is highly unlikely" sounds legit
-!- Jaska [~osuka_@9O6AAAFVQ.tor-irc.dnsbl.oftc.net] has joined #linode
-!- Jaska is "Knuckx" on #linode
-!- mode/#linode [+l 279] by ChanServ
<millisa>   today I learned that alt.right isn't an nntp group. The articles make a little more sense, now.
<dwfreed>   lol
closed Tue Dec 06 00:00:50 2016
