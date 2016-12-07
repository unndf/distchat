Back to Home / #debian / 2016 / 10 / Prev Day | Next Day #debian IRC Logs for 2016-10-13
--- Log opened Thu Oct 13 00:00:57 2016
00:05   -!- ansel [~ansel@tmo-111-74.customers.d1-online.com] has quit [Ping timeout: 480 seconds]
00:10   -!- faw [~faw@faw.user.oftc.net] has quit [Ping timeout: 480 seconds]
00:13   -!- tdy [~tdy@00016994.user.oftc.net] has quit [Ping timeout: 480 seconds]
00:16   -!- paxmark9 [~paxtormar@199.167.137.205] has quit [Quit: Leaving]
00:18   -!- bony [~quassel@183.82.103.58] has quit [Ping timeout: 480 seconds]
00:20   -!- Vollstrecker_ [~vollstrec@p2003007A2A36FB000A606EFFFE4490F9.dip0.t-ipconnect.de] has joined #debian
00:20   -!- Vollstrecker_ is "Werner Mahr" on #debian-kde #debian
00:21   -!- Vollstrecker [~vollstrec@p2003007A2A36FB000A606EFFFE4490F9.dip0.t-ipconnect.de] has quit [Read error: Connection reset by peer]
00:22   -!- mots [~mots@178-82-187-178.dynamic.hispeed.ch] has quit [Quit: System is going down for maintenance]
00:22   -!- mots [~mots@mail2.ep-group.ch] has joined #debian
00:22   -!- mots is "mots" on #debian #ovirt
00:25   -!- ghostnote [~Jase@46.166.138.147] has joined #debian
00:25   -!- ghostnote is "spate" on #debian
00:25   -!- brillenfux [~brillenfu@ip1f11f883.dynamic.kabel-deutschland.de] has joined #debian
00:25   -!- brillenfux is "realname" on #debian
00:29   -!- ledorn [~ledorn@190.205.185.52] has joined #debian
00:29   -!- ledorn is "ledorn" on #debian
00:31   -!- ledorn [~ledorn@190.205.185.52] has quit []
00:31   -!- TomasCZ [~TomasCZ@yes.tenlab.net] has quit [Quit: Leaving]
00:39   -!- tdy [~tdy@00016994.user.oftc.net] has joined #debian
00:39   -!- tdy is "tdy" on #debian #awesome
00:41   -!- jm_ [flier@000125af.user.oftc.net] has joined #debian
00:41   -!- jm_ is "." on #debian #debian-ops
00:44   -!- phls [~phls@177.132.23.241] has joined #debian
00:44   -!- phls is "Paulo Santana" on #debian-publicity #debian-devel-br #debian-mentors #debian-br #debian-l10n-br #debian
00:52   -!- vlad1777d [~vlad@46.98.218.93] has joined #debian
00:52   -!- vlad1777d is "realname" on #debian-hurd #debian-cinnamon #debian-next #debian
00:52   -!- libregeekingkid [~quassel@183.87.106.126] has joined #debian
00:52   -!- libregeekingkid is "libregeekingkid" on #debian-in #hamara #debian
00:52   -!- towo^work [~towo@00012f0f.user.oftc.net] has joined #debian
00:52   -!- towo^work is "Torsten -towo- Wohlfarth" on #kernelnewbies #siduction-dev #siduction-de #siduction #debian-offtopic #debian-next #debian #aptosid
00:54   -!- Yst [~Yst@0001fe93.user.oftc.net] has quit [Quit: <https://y.st./>]
00:55   -!- ghostnote [~Jase@46.166.138.147] has quit []
00:56   -!- bounce [~bounce@2602:306:ccba:570:ddc2:3d82:a893:8108] has quit [Quit: Three sheets to the wind]
00:59   -!- mladen [~mladen@94.190.188.75] has joined #debian
00:59   -!- mladen is "mladen" on #debian
00:59   -!- mladen [~mladen@94.190.188.75] has quit []
01:05   -!- vlad1777d [~vlad@46.98.218.93] has quit [Remote host closed the connection]
01:09   -!- missmbob [~missmbob@dipconsultants.com] has quit [Quit: leaving]
01:09   -!- missmbob [~missmbob@dipconsultants.com] has joined #debian
01:09   -!- missmbob is "missmbob" on #debian-offtopic #debian-next #debian
01:11   -!- thunderrd [~thunderrd@thunderrd.user.oftc.net] has quit [Remote host closed the connection]
01:11   -!- thunderrd [~thunderrd@thunderrd.user.oftc.net] has joined #debian
01:11   -!- thunderrd is "realname" on #tor @#GamersOnLinux #siduction-dev #siduction-de #siduction #debian #ck #aptosid
01:12   -!- ahmad [~smuxi@51.235.165.168] has joined #debian
01:12   -!- ahmad is "Your Name" on #debian #smuxi
01:14   -!- libregeekingkid [~quassel@183.87.106.126] has quit [Ping timeout: 480 seconds]
01:15   <missmbob>  anyone know why dpkg isn't letting me edit factoids?
01:17   <missmbob>  i have to assume the bot needs to be restarted or something. never seen this before
01:17   -!- gem [~gem@106.51.17.228] has joined #debian
01:17   -!- gem is "Nandaja" on #debian #debian-diaspora #kernelnewbies
01:19   <missmbob>  themill: you run the bot, dont you?
01:19   <Ouroboros> is linux-image-* package the correct place to get the default .config for that package? ok, i guess that is a little circular
01:25   -!- uxo [~uxo@host119-220-dynamic.8-87-r.retail.telecomitalia.it] has joined #debian
01:25   -!- uxo is "uxo" on #debian
01:25   -!- uxo [~uxo@host119-220-dynamic.8-87-r.retail.telecomitalia.it] has quit []
01:25   -!- uxo is "uxo" on #debian
01:25   -!- uxo [~uxo@host119-220-dynamic.8-87-r.retail.telecomitalia.it] has joined #debian
01:27   -!- dedeibel_ [~dedeibel@p200300752F603A00BEAEC5FFFE2EBDD8.dip0.t-ipconnect.de] has quit [Remote host closed the connection]
01:27   <missmbob>  i usually get it from /boot. but sure, you can get it from the package
01:28   <Ouroboros> i mean, yeah, same thing
01:28   <Ouroboros> just kinda strange they dont have any default ones in the linux-source-* package
01:28   -!- backbox [~backbox@68.170.238.31] has joined #debian
01:28   -!- backbox is "Live session user" on #debian
01:29   -!- backbox [~backbox@68.170.238.31] has quit []
01:29   <Ouroboros> well, there are some in the source for linux-image, but they are pretty minimal
01:30   -!- svendev [~quassel@dhcp-5-186-117-72.cgn.ip.fibianet.dk] has quit [Ping timeout: 480 seconds]
01:30   -!- Vollstrecker [~vollstrec@p2003007A2A36FB000A606EFFFE4490F9.dip0.t-ipconnect.de] has joined #debian
01:30   -!- Vollstrecker is "Werner Mahr" on #debian-kde #debian
01:30   -!- Vollstrecker_ [~vollstrec@p2003007A2A36FB000A606EFFFE4490F9.dip0.t-ipconnect.de] has quit [Read error: Connection reset by peer]
01:32   -!- brillenfux [~brillenfu@ip1f11f883.dynamic.kabel-deutschland.de] has quit [Remote host closed the connection]
01:33   -!- thunderrd [~thunderrd@thunderrd.user.oftc.net] has quit [Quit: Leaving]
01:33   -!- Guest1949 [~Corey84@ip-64-134-101-3.public.wayport.net] has joined #debian
01:33   -!- Guest1949 is "Corey" on #openstack #openbox #oftc #linux #kvm #irssi #ipv6 #https-everywhere #gcc #freenode #fosscar #fossology #ext4 #debian #Corsair #codesurfers #apparmor #smxi
01:34   -!- uxo [~uxo@host119-220-dynamic.8-87-r.retail.telecomitalia.it] has quit [Quit: Sto andando via]
01:34   -!- lancelord [~lancelord@31.209.111.87] has joined #debian
01:34   -!- lancelord is "lancelord" on #debian
01:34   -!- thunderrd [~thunderrd@thunderrd.user.oftc.net] has joined #debian
01:34   -!- thunderrd is "realname" on #tor @#GamersOnLinux #siduction-dev #siduction-de #siduction #debian #ck #aptosid
01:47   -!- Hardwired [~Hardwired@45-18-245-47.lightspeed.miamfl.sbcglobal.net] has joined #debian
01:47   -!- Hardwired is "realname" on #debian
01:47   -!- GreatAttitude [~great@178-175-128-50.static.host] has joined #debian
01:47   -!- GreatAttitude is "Great Attitude" on #debian-offtopic #debian #nottor #tor
01:53   -!- walski [~wal@1.152.97.27] has joined #debian
01:53   -!- walski is "da wal" on #debian
01:54   -!- walski [~wal@1.152.97.27] has quit []
01:54   -!- ahmad [~smuxi@51.235.165.168] has quit [Ping timeout: 480 seconds]
01:57   -!- Guest1949 [~Corey84@ip-64-134-101-3.public.wayport.net] has quit [Ping timeout: 480 seconds]
02:00   -!- markus-k [~markus-k@2a00:ea8:400:3:5521:ea1c:39e4:5274] has joined #debian
02:00   -!- markus-k is "Markus" on #debian #debian-desktop #nottor
02:02   -!- mpl0de [~mpl0de@94.190.188.75] has joined #debian
02:02   -!- mpl0de is "mpl0de" on #debian
02:02   -!- mpl0de [~mpl0de@94.190.188.75] has quit []
02:03   -!- Q-Master^Work [~q-master@217.175.38.170] has joined #debian
02:03   -!- Q-Master^Work is "Vladimir Berezenko" on #debian-next #debianppc #debian
02:06   -!- narcan [~narcan@176-57-33-240.as16211.net] has joined #debian
02:06   -!- narcan is "Denis Briand" on #debian-mentors #debian-next #debian-offtopic #debian-france #debian
02:06   -!- sc122 [~sc122@91.201.180.45] has joined #debian
02:06   -!- sc122 is "SC122" on #debian
02:06   <sc122> rofl\
    02:06   -!- mohae [~quassel@c-98-227-35-38.hsd1.il.comcast.net] has quit [Read error: Connection reset by peer]
02:07   -!- smulverine [~smulverin@42-2-0-165.static.netvigator.com] has quit [Ping timeout: 480 seconds]
02:08   -!- sc122 [~sc122@91.201.180.45] has quit []
02:10   -!- paco [~paco@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:10   -!- paco is "paco el buzo" on #debian
02:11   -!- lospinos [~lospinos@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:11   -!- lospinos is "lospinos" on #debian
02:11   -!- manueh [~olaf@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:11   -!- manueh is "olaf" on #debian
02:11   -!- BIBA [~BIBA@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:11   -!- BIBA is "BIBA GUILIREKS" on #debian
02:12   -!- arvind [~arvind@77-172-237-233.ip.telfort.nl] has quit [Remote host closed the connection]
02:12   -!- lospinos34 [~lospinos@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:12   -!- lospinos34 is "Los Pinos" on #debian
02:12   -!- lospinos34 [~lospinos@244.red-213-98-38.staticip.rima-tde.net] has quit []
02:12   -!- alcachofa69 [~lospinos@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:12   -!- alcachofa69 is "Los Pinos" on #debian
02:13   -!- smulverine [~smulverin@42-2-0-165.static.netvigator.com] has joined #debian
02:13   -!- smulverine is "Stephane Duchesne" on #debian
02:13   -!- grepper [~grepper@dhcp-108-168-40-171.cable.user.start.ca] has quit [Ping timeout: 480 seconds]
02:13   -!- pepe [~PEPE@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:13   -!- pepe is "PEPE" on #debian
02:16   -!- lBIBA [~Rajoy@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:16   -!- lBIBA is "BIBA GUILIREKS" on #debian
02:17   -!- Rajoy [~Rajoy@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:17   -!- Rajoy is "Rajoy" on #debian
02:17   -!- yeraky13 [~lospinos@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:17   -!- yeraky13 is "lospinos" on #debian
02:17   -!- chele [~chele@ip5b40c1c7.dynamic.kabel-deutschland.de] has joined #debian
02:17   -!- chele is "chele" on #debian-next #debian
02:18   -!- mode/#debian [+l 741] by debhelper
02:19   -!- Hardwired [~Hardwired@45-18-245-47.lightspeed.miamfl.sbcglobal.net] has left #debian [Leaving]
02:19   -!- MANOLITO69 [~MANOLITO6@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:19   -!- MANOLITO69 is "MANOLITO69" on #debian
02:19   -!- manueh [~olaf@244.red-213-98-38.staticip.rima-tde.net] has quit [Quit: Saliendo]
02:19   -!- mzf [~mzf@94.183.153.137] has joined #debian
02:19   -!- mzf is "realname" on #debian-cloud #debian #virt
02:19   -!- capitan [~olaf@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:19   -!- capitan is "olaf" on #debian
02:20   -!- paco [~paco@244.red-213-98-38.staticip.rima-tde.net] has left #debian [Saliendo]
02:20   -!- HappyLoaf [~HappyLoaf@85.159.237.210] has quit [Remote host closed the connection]
02:21   -!- pulpo69 [~pulpo69@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:21   -!- pulpo69 is "Los Pinos" on #debian
02:22   -!- pulpo69 [~pulpo69@244.red-213-98-38.staticip.rima-tde.net] has quit []
02:22   -!- obama [~obama@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:22   -!- obama is "obama" on #debian
02:22   -!- alcachofa69 [~lospinos@244.red-213-98-38.staticip.rima-tde.net] has quit [Quit: Saliendo]
02:22   -!- pepe [~PEPE@244.red-213-98-38.staticip.rima-tde.net] has quit [Quit: Saliendo]
02:23   -!- obama [~obama@244.red-213-98-38.staticip.rima-tde.net] has left #debian []
02:23   -!- capitan [~olaf@244.red-213-98-38.staticip.rima-tde.net] has quit []
02:23   -!- zapatero [~olaf@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:23   -!- zapatero is "olaf" on #debian
02:23   -!- tu [~tu@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:23   -!- tu is "tu madre" on #debian
02:24   -!- grepper [~grepper@dhcp-108-168-40-171.cable.user.start.ca] has joined #debian
02:24   -!- grepper is "Robert" on #debian-next #debian
02:24   -!- lospinos_ [~lospinos@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:24   -!- lospinos_ is "Los Pinos" on #debian
02:24   -!- tu [~tu@244.red-213-98-38.staticip.rima-tde.net] has left #debian []
02:25   -!- tumadre [~tumadre@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:25   -!- tumadre is "tumadre" on #debian
02:25   -!- currito [~lospinos@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:25   -!- currito is "Los Pinos" on #debian
02:25   -!- Pettis [~PuyoDead@89.187.143.81] has joined #debian
02:25   -!- Pettis is "Ralth" on #debian
02:26   -!- yeraky13 is now known as narcoman
02:26   -!- lospinos_ [~lospinos@244.red-213-98-38.staticip.rima-tde.net] has quit []
02:26   -!- zapatero [~olaf@244.red-213-98-38.staticip.rima-tde.net] has quit []
02:26   -!- pompa [~popo@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:26   -!- pompa is "preto" on #debian
02:27   -!- john [~olaf@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:27   -!- john is "olaf" on #debian
02:27   -!- favioflamingo [~Icedove@2400:7800:412e:e511:5054:ff:fe04:134a] has joined #debian
02:27   -!- favioflamingo is "favioflamingo" on #debian #debian-perl
02:28   <favioflamingo> Which team is responsible for packaging c libraries?
02:28   -!- narcoman is now known as Pablo
02:28   <favioflamingo> Or at least, which irc channel should I go to in order discuss packaging a c library?
02:28   -!- tumadre [~tumadre@244.red-213-98-38.staticip.rima-tde.net] has left #debian []
02:29   <AlexLikeRock>  fsf :-)
02:29   -!- john [~olaf@244.red-213-98-38.staticip.rima-tde.net] has quit []
02:29   -!- Bartomeu [~Bartomeu@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:29   -!- Bartomeu is "Bartomeu" on #debian
02:29   <Bartomeu>  eño pablito
02:29   -!- arturo [~aborrero@r2d2.cica.es] has joined #debian
02:29   -!- arturo is "Arturo Borrero Gonzalez" on #debian-devel-es #debian-ha #debian-mentors #debian-qa #debian-next #debian-es #debian
02:29   -!- Bartomeu [~Bartomeu@244.red-213-98-38.staticip.rima-tde.net] has left #debian []
02:29   -!- Rajoy [~Rajoy@244.red-213-98-38.staticip.rima-tde.net] has quit [Quit: Saliendo]
02:29   -!- lBIBA [~Rajoy@244.red-213-98-38.staticip.rima-tde.net] has quit [Quit: Saliendo]
02:29   -!- lospinos [~lospinos@244.red-213-98-38.staticip.rima-tde.net] has quit [Quit: Saliendo]
02:29   -!- BIBA [~BIBA@244.red-213-98-38.staticip.rima-tde.net] has quit [Quit: Saliendo]
02:29   -!- currito [~lospinos@244.red-213-98-38.staticip.rima-tde.net] has quit []
02:29   -!- Bartomeu is "Bartomeu" on #debian
02:29   -!- Bartomeu [~Bartomeu@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:30   -!- capitan [~lospinos@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:30   -!- capitan is "Los Pinos" on #debian
02:30   -!- Rajoy [~Rajoy@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:30   -!- Rajoy is "Rajoy" on #debian
02:30   -!- AlexLikeRock [~AlexLikeR@0001b9bd.user.oftc.net] has quit [Quit: Leaving]
02:30   <missmbob>  favioflamingo: no one knows what you're talking about
02:30   -!- pepe [~PEPE@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:30   -!- pepe is "PEPE" on #debian
02:31   -!- aidalgol [~aidalgol@219.88.238.113] has joined #debian
02:31   -!- aidalgol is "Aidan Gauland" on #debian
02:31   -!- torbe [~olaf@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:31   -!- torbe is "olaf" on #debian
02:31   <favioflamingo> Ok, I'll try to rephrase.
02:31   -!- Bartomeu [~Bartomeu@244.red-213-98-38.staticip.rima-tde.net] has quit []
02:31   <favioflamingo> I have a c library that I would like to get into debian repos. I am aware that I need to seek a sponsor.
02:32   <favioflamingo> For my Perl package, I went to pkg-perl and the debian-perl channel.
02:32   -!- Koala69 [~Koala69@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:32   -!- Koala69 is "Koala69" on #debian
02:32   -!- pepe [~PEPE@244.red-213-98-38.staticip.rima-tde.net] has quit [Read error: Connection reset by peer]
02:32   <missmbob>  yeah, you're in the wrong place
02:32   -!- PEPE [~PEPE@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:32   -!- PEPE is "PEPE" on #debian #0000
02:32   <jm_>   try #debian-mentors
02:32   <missmbob>  !mentors
02:32   <dpkg>  mentors is probably the system the Debian project uses to train new people to become Debian Developers or Debian Maintainers and get their packages into the Debian archive. Ask me about <nmg>. http://lists.debian.org/debian-mentors/ http://mentors.debian.net/ #debian-mentors on irc.debian.org (irc.oftc.net).
02:32   -!- Bartomeu [~Bartomeu@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:32   -!- Bartomeu is "Bartomeu" on #debian
02:32   <Bartomeu>  yates de lujo
02:32   -!- capitan [~lospinos@244.red-213-98-38.staticip.rima-tde.net] has quit []
02:32   <favioflamingo> missmbob, dpkg: thanks, I think i remember hearing debian-mentors for this.
02:33   -!- Bartomeu [~Bartomeu@244.red-213-98-38.staticip.rima-tde.net] has left #debian []
02:33   <missmbob>  favioflamingo: if you didn't know dpkg was a bot you might be laughed at there. do you know what you're doing?
02:33   <Koala69>   Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69
02:33   <Koala69>   Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala6
02:33   <Koala69>   9Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69
02:33   <torbe> holii
02:33   <Koala69>   Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala6
02:33   <Koala69>   9Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69
02:33   <Koala69>   TORBE PUTO GORDO
02:34   <Koala69>   Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala6
02:34   <Koala69>   9Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala
02:34   <Koala69>   69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koal
02:34   -!- piper [~piper@00012f3a.user.oftc.net] has quit [Ping timeout: 480 seconds]
02:34   <missmbob>  !ops
02:34   <dpkg>  Please invoke 'dpkg: ops $problem' to call the operators to deal with a specific problem. Misuse of this will lead to a ban. Operators can also be contacted in the #debian-ops channel.
02:34   <Koala69>   a69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koa
02:34   <Koala69>   la69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koal
02:34   -!- Pablo is now known as PabloEscobar
02:34   <missmbob>  !ops Koala69 06:34 < Koala69> la69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala6'
02:34   <dpkg>  Hydroxide, dondelelcaro, LoRez, RichiH, mentor, abrotman, Maulkin, stew, peterS, Myon, Ganneff, weasel, zobel, themill, babilen, SynrG, jm_, somiaj, jelly: missmbob complains about: Koala69 06:34 < Koala69> la69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala6'
02:34   <favioflamingo> missmbob: ya, I forgot. I did get set up with debian-perl, and I have set up an alioth account.
02:34   -!- PEPE [~PEPE@244.red-213-98-38.staticip.rima-tde.net] has quit []
02:34   -!- PEPE [~PEPE@244.red-213-98-38.staticip.rima-tde.net] has joined #debian
02:34   -!- PEPE is "PEPE" on #debian #0000
02:34   -!- mode/#debian [+o somiaj] by ChanServ
02:34   -!- Koala69 was kicked from #debian by somiaj [you should know better]
02:34   -!- mode/#debian [+b *!*@244.red-213-98-38.staticip.rima-tde.net] by somiaj
02:34   -!- mode/#debian [-o somiaj] by somiaj
02:35   <Ouroboros> otoh, i am somewhat glad that 8-year olds are still aware of irc
02:35   -!- torbe [~olaf@244.red-213-98-38.staticip.rima-tde.net] has quit []
02:36   -!- pompa [~popo@244.red-213-98-38.staticip.rima-tde.net] has quit [Quit: Saliendo]
02:36   -!- PabloEscobar [~lospinos@244.red-213-98-38.staticip.rima-tde.net] has quit [Quit: Saliendo]
02:38   -!- piper [~piper@00012f3a.user.oftc.net] has joined #debian
02:38   -!- piper is "piper" on #debian-desktop #debian-mentors #debian-derivatives #debian-systemd #debian-kde #debian-next #debian #siduction-de #siduction-dev #siduction
02:39   -!- mjampala [~mjampala@208.146.43.5] has quit [Ping timeout: 480 seconds]
02:43   -!- mjampala [~mjampala@208.146.43.5] has joined #debian
02:43   -!- mjampala is "Mukund Jampala" on #debianppc #debian #debian-next
02:47   -!- azamat [~azamat@r27-pw-pimpao.ibys.com.br] has joined #debian
02:47   -!- azamat is "realname" on #debian-games #debian-br #debian
02:51   -!- CZakalwe [~scott@119.224.89.143] has joined #debian
02:51   -!- CZakalwe is "Scott" on #debian
02:52   -!- smulverine [~smulverin@42-2-0-165.static.netvigator.com] has quit [Remote host closed the connection]
02:52   -!- HappyLoaf [~HappyLoaf@108.61.122.157] has joined #debian
02:52   -!- HappyLoaf is "HappyLoaf" on #moocows #oftc #tor-project #tor #debian
02:52   -!- azamat [~azamat@r27-pw-pimpao.ibys.com.br] has quit [Quit: fui]
02:55   -!- kenoby [~kenoby@host123-17-dynamic.248-95-r.retail.telecomitalia.it] has quit [Read error: Connection reset by peer]
02:55   -!- brak [~quassel@173-22-124-8.client.mchsi.com] has quit [Ping timeout: 480 seconds]
02:55   -!- sqirrrl [~quassel@tmo-112-62.customers.d1-online.com] has joined #debian
02:55   -!- sqirrrl is "Mirko Ahnert" on #debian
02:55   -!- Pettis [~PuyoDead@89.187.143.81] has quit []
02:55   -!- kenoby [~kenoby@host123-17-dynamic.248-95-r.retail.telecomitalia.it] has joined #debian
02:55   -!- kenoby is "realname" on #debian-next #debian
02:56   -!- MANOLITO69 [~MANOLITO6@244.red-213-98-38.staticip.rima-tde.net] has quit [Quit: Saliendo]
02:57   -!- PEPE [~PEPE@244.red-213-98-38.staticip.rima-tde.net] has quit [Remote host closed the connection]
02:57   -!- Rajoy [~Rajoy@244.red-213-98-38.staticip.rima-tde.net] has quit [Remote host closed the connection]
02:58   -!- mode/#debian [+l 735] by debhelper
03:00   -!- hele_ [~hele@91-159-249-16.elisa-laajakaista.fi] has joined #debian
03:00   -!- hele_ is "hele" on #debian-next #debian-kde #debian
03:01   -!- dozer [~rt@195.159.183.42] has joined #debian
03:01   -!- dozer is "rt" on #debian
03:02   -!- skitt [~skitt@skitt.user.oftc.net] has joined #debian
03:02   -!- skitt is "Stephen Kitt" on #debian-ftp #debian
03:03   -!- swirl [~swirl@host107-25-static.240-95-b.business.telecomitalia.it] has joined #debian
03:03   -!- swirl is "swirl" on #debian-qa #debian-kde #debian-forensics #debian
03:04   -!- minikdo [~domino@0002233e.user.oftc.net] has quit [Ping timeout: 480 seconds]
03:07   -!- ttelford [~troyt@2601:681:4600:7641:44dd:acff:fe85:9c8e] has quit [Ping timeout: 480 seconds]
03:10   -!- PhilGEE [~pgreen@pool-100-11-145-218.phlapa.fios.verizon.net] has quit [Quit: PhilGEE]
03:16   -!- brillenfux [~brillenfu@ip1f11f883.dynamic.kabel-deutschland.de] has joined #debian
03:16   -!- brillenfux is "realname" on #debian
03:16   -!- sef [~sef@194.33.84.67] has joined #debian
03:16   -!- sef is "sef" on #debian
03:16   <dozer> Anyone encountered a random black screen during installation of debian on dell towers?
03:16   -!- phunatique [~phunatiqu@p578b8463.dip0.t-ipconnect.de] has joined #debian
03:16   -!- phunatique is "phunatique" on #debian
03:18   -!- sef [~sef@194.33.84.67] has quit []
03:18   -!- InvadeD_ [~GeNocYdE_@d66-183-134-136.bchsia.telus.net] has joined #debian
03:18   -!- InvadeD_ is "realname" on #debian
03:18   -!- InvadeD [~GeNocYdE_@d66-183-134-136.bchsia.telus.net] has quit [Read error: Connection reset by peer]
03:18   -!- ttelford [~troyt@c-98-202-89-234.hsd1.ut.comcast.net] has joined #debian
03:18   -!- ttelford is "Troy Telford" on #debian-voip #debian-systemd #debian-next #debian-ipv6 #debian
03:20   -!- FatalError401 [~DigitalFr@91.253.70.198] has quit [Ping timeout: 480 seconds]
03:21   -!- ansel [~ansel@2003:5b:203b:100:6af7:28ff:fe06:801] has joined #debian
03:21   -!- ansel is "Andreas Seltenreich" on #debian
03:23   <Echoz> dozer: What model is it?
03:23   <Echoz> dozer: I might have one here
03:23   <dozer> dell precision t1700 mini tower
03:24   -!- krymzon [~krymzon@pub151248191162.dh-hfc.datazug.ch] has quit [Remote host closed the connection]
03:25   <Ouroboros> video driver?
03:25   <Echoz> dozer: I don't have one here, but I did run debian on that same model with absolutely no problems
03:26   <Echoz> for a few months
03:27   <Echoz> dozer: Yeah, what graphics does it have, the one I used had intel graphics in a Xeon E3-something
03:27   <dozer> @Echoz Tried several boot options (vga=normal fb=false got me the furthest) and debian releases.. Weird thing is that ubuntu and lubuntu full CD works and installs just fine. Not Debian however - neither full CD nor netinst for several releases. ubuntu minimal install also fails. Yes, that's also strange - the computer had been running Debian, although a corrupt one, for some time
03:27   <dozer> Echoz: Ati firepro something
03:28   <Echoz> dozer: Ah, I see. Are you able to get a live environment with a command line up?
03:28   <dozer> Echoz: Sorry, that's AMD FirePro 2270
03:29   -!- pamaury [~pamaury@89.28.146.93] has joined #debian
03:29   -!- pamaury is "Amaury Pouly" on #debian #debian-kde #debian-next
03:29   <dozer> Echoz: Yep, works just fine with live CD
03:29   <Echoz> dozer: Does it have integrated graphics, so you could try that instead?
03:29   <jm_>   so perhaps try installing it with debootstrap and bpo kernel
03:30   <Echoz> jm_: Amazon reviews say it works "pretty well" with CentOS 6.3, jessie kernel isn't that old, is it?
03:30   -!- Tubber [~Tubber@cpe24374c0b0708.cm.vejen-net.dk] has joined #debian
03:30   -!- Tubber is "realname" on #debian #ovirt
03:31   <jm_>   Echoz: yeah centos probably has the 2.6 kernel
03:32   <dozer> Echoz: I believe it only has the AMD graphics
03:33   <Echoz> dozer: Okay. Seeing as this isn't a particularly high end card, do you by any chance have any spare cards around that you could use instead?
03:34   <dozer> Also tried testing; both the regular and the one w/ extra firmware.
03:34   <dozer> Echoz: No, unfortunately.
03:34   <Echoz> Or if not use, just test to see if it's even related to the graphics card
03:35   <Echoz> dozer: I know there's some AMD graphics firmware that's required in certain cases. I'll try to find out whether this is included in the firmware image
03:36   <dozer> Echoz: Thank you!
03:37   -!- HappyLoaf [~HappyLoaf@108.61.122.157] has quit [Ping timeout: 480 seconds]
03:37   <dozer> I'm baffled over how the previous guy got Debian on this machine...
03:39   <Echoz> dozer: It seems some AMD cards require firmware-linux-nonfree, which is included in the firmware image
03:39   <Echoz> dozer: Are you experiencing the same problems both with the graphical and curses installers?
03:40   <Ouroboros> dozer: if live works, then clearly it *can* work, just need to get the right drivers in the right place at the right time
03:41   <dozer> Echoz: If by cursers installer you mean the graphical installer then yes - both. Really random where the screen 'looses' its signal. However vga=normal and fb=false as boot parameters gets me the furhtest. Right up until installing grub, which is one of the final steps.
03:41   <jm_>   have you checked if system stops responding completely after that?
03:42   <dozer> Ouroboros: Yep, my thoughts as well
03:43   -!- droppi [~user@tor2r.ins.tor.net.eu.org] has quit [Remote host closed the connection]
03:43   <Ouroboros> why would it die at that point? it should only start using the installed drivers after reboot?
03:43   <Ouroboros> or no?
03:43   <dozer> jm_: Sometimes it seems like the installation continues, however no reaction to keyboard inputs.
03:43   <Echoz> dozer: You could try booting into live and running the installer from there
03:43   -!- droppi [~user@cloud.tor.ninja] has joined #debian
03:43   -!- droppi is "user" on #debian #nottor #tor #whonix
03:43   <dozer> Echoz: I'll try that as well
03:44   <Echoz> I don't remember the name of the executable, let me see. I have a live environment running in the other room
03:44   <dozer> Echoz: Thanks
03:44   -!- mots [~mots@mail2.ep-group.ch] has quit [Read error: Connection reset by peer]
03:44   <Ouroboros> live has an installer boot option too
03:44   <Ouroboros> not sure if thats any different than the normal installer
03:45   <dozer> Going with live failsage then just to be sure
03:45   <Echoz> dozer: it's "debian-installer-launcher"
03:45   <dozer> that's failsafe =)
03:45   <dozer> Echoz: thanks
03:45   -!- mots [~mots@mail2.ep-group.ch] has joined #debian
03:45   -!- mots is "mots" on #debian #ovirt
03:46   <Echoz> dozer: It'll run in the same framebuffer as the console did, so if live works well, then this should be the same
03:46   -!- pamaury [~pamaury@89.28.146.93] has quit [Ping timeout: 480 seconds]
03:47   <dozer> Echoz: Let's hope so
03:47   -!- bolt_ [r00t@000182e9.user.oftc.net] has joined #debian
03:47   -!- bolt_ is "-" on #suckless #qemu #oftc #sd #debian #debian-next #virt #awesome
03:47   -!- ol [~quassel@2406:e006:db1:1:8e89:a5ff:feca:57fe] has quit [Quit: No Ping reply in 180 seconds.]
03:47   <Ouroboros> (it's gonna fail the exact same way as before :)
03:48   -!- ol [~quassel@2406:e006:db1:1:53f6:7752:d0b:5ced] has joined #debian
03:48   -!- ol is "Ol" on #debian
03:48   -!- bolt [r00t@000182e9.user.oftc.net] has quit [Ping timeout: 480 seconds]
03:50   <dozer> ...
03:51   -!- dogsleg_ [~dogsleg@212.220.200.246] has joined #debian
03:51   -!- dogsleg_ is "Lev Lamberov" on #debconf #debian-haskell #debian-i18n #debian-doc #debian-www #debian-ru #debian-mentors #debian
03:51   -!- dogsleg is now known as Guest1958
03:51   -!- dogsleg_ is now known as dogsleg
03:54   -!- Guest1958 [~dogsleg@00020bdd.user.oftc.net] has quit [Ping timeout: 480 seconds]
03:54   -!- RaidSoft [~Averad@tor-exit.gansta93.com] has joined #debian
03:54   -!- RaidSoft is "Coe|work" on #debian
03:55   <dozer> sorry guys, same thing happened within the live environment. went black after a while. maybe I didn't run it long enough yesterday
03:55   -!- superusr [~tf@p200300764D4118D3AD4CC51433D990CC.dip0.t-ipconnect.de] has quit [Ping timeout: 480 seconds]
03:55   <Ouroboros> with the installer, or just in general?
03:55   -!- mirage [~mirage@94.228.190.38] has joined #debian
03:55   -!- mirage is "mirage" on #debian
03:56   -!- mots [~mots@mail2.ep-group.ch] has quit [Read error: Connection reset by peer]
03:56   -!- mirage [~mirage@94.228.190.38] has quit []
03:56   <jm_>   are you sure it's not screensaver killing it? tried to keep it alive by moving the mouse or whatever?
03:56   <dozer> Ouroboros: With the live-CD within the live GUI
03:57   <dozer> jm_: Nothing happens w/ mouse or keyboard inputs
03:57   <Ouroboros> yeah, its not a driver issue per se then, just monitor going to power save
03:57   -!- mots [~mots@mail2.ep-group.ch] has joined #debian
03:57   -!- mots is "mots" on #debian #ovirt
03:57   <Ouroboros> i think i vaguely remember something like this before
03:57   <jm_>   dozer: I mean before it goes off
03:57   -!- antgel [~topdog@82.166.98.41] has joined #debian
03:57   -!- antgel is "TD" on #openvas #debian
03:58   <dozer> jm_: sorry. Can reload to see if that makes any difference?
03:58   <jm_>   dozer: up to you, it was just a wild idea
03:58   <dozer> jm_: at this point I might as well..
03:59   -!- HappyLoaf [~HappyLoaf@chulak.enn.lu] has joined #debian
03:59   -!- HappyLoaf is "HappyLoaf" on #moocows #oftc #tor-project #tor #debian
03:59   <Echoz> dozer: try booting with consoleblank=0
04:00   <Echoz> that should prevent the screen from turning off after a while
04:00   <dozer> Echos: I'll give it a go
04:01   <Ouroboros> dozer: also maybe something with 'xset dpms'
04:01   -!- InvadeD_ [~GeNocYdE_@d66-183-134-136.bchsia.telus.net] has quit [Quit: Leaving]
04:01   <Echoz> dozer: if that works you should probably add that to the kernel parameters in grub after installation, too
04:02   <dozer> Echoz: Ok. I'll try with 'xset dpms' later if consoleblank=0 doesn't work
04:02   <Echoz> Yeah, if running from the live environment you could maybe try setterm -blank 0 -powerdown 0 -powersave off
04:03   -!- hele_ [~hele@91-159-249-16.elisa-laajakaista.fi] has quit [Quit: Konversation terminated!]
04:03   <dozer> Echoz: Sweet - I'll try that as well
04:04   <dozer> ...
04:04   <Ouroboros> dozer: should be "xset -dpms" i guess
04:04   <Echoz> Ouroboros: If running the default installer it won't be using X
04:04   <Ouroboros> yeah
04:05   <dozer> Echoz: Died even before I got to the terminal to type 'setterm -blank 0 -powerdown 0 -powersave off'
04:05   -!- jmux [~jmux@lhm246.muenchen.de] has joined #debian
04:05   -!- jmux is "Jan-Marek Glogowski" on #debian
04:05   <Echoz> dozer: Oh boy
04:06   -!- pindy_ [~pindy@181.198.151.122.dynamic.dsl.dv.iprimus.net.au] has quit [Ping timeout: 480 seconds]
04:06   <Echoz> try without consoleblank=0, then and instead run that command inside
04:06   -!- bollo [~quassel@00021dc1.user.oftc.net] has joined #debian
04:06   -!- bollo is "bollo" on #debian #debian-next
04:06   <dozer> Echoz: ok
04:06   <Ouroboros> hm, why does installing a kernel image sometimes runs /etc/kernel/postinst.d/zz-update-grub, and sometimes not
04:07   -!- pindy [~pindy@181.198.151.122.dynamic.dsl.dv.iprimus.net.au] has joined #debian
04:07   -!- pindy is "Gin" on #debian
04:07   <Echoz> Ouroboros: can you tell me the names of two packages, one that does and one that doesn't and I might be able to tell you
04:07   <Ouroboros> i dont know, i cant find a pattern
04:07   -!- faw [~faw@faw.user.oftc.net] has joined #debian
04:07   -!- faw is "Felipe Augusto van de Wiel" on @#cathedral #debconf #debian #debian-apt #debian-bugs #debian-devel-br #debian-i18n #debian-l10n-br #debian-mentors #debian-mirrors #debian-qa #debian-www @#funlabs
04:08   -!- mode/#debian [+l 741] by debhelper
04:08   <Ouroboros> well, whatever, not that important right now
04:08   <dozer> Thanks for taking the time
04:11   <Ouroboros> dozer: have you tried unplugging it and plugging it back in again? ;)
04:11   <Ouroboros> (the video cable)
04:11   -!- superusr [~tf@p5B246D84.dip0.t-ipconnect.de] has joined #debian
04:11   -!- superusr is "realname" on #debian
04:12   <dozer> Echoz: I'm not fast enough to type in the setterm cmd before it 'dies'
04:12   <dozer> Ouroboros: Several times
04:12   <jm_>   so it's probably not blanking then
04:12   <Echoz> Would hardly be blanking, it should happen only afte 10 minutes of inactivity
04:12   <dozer> Ouroboros: Even switching between DVI and VGA
04:13   -!- stooj [~stooj@181.198.151.122.dynamic.dsl.dv.iprimus.net.au] has quit [Ping timeout: 480 seconds]
04:13   <Echoz> This card only has a DMS-59 plug doesn't it
04:14   -!- stooj [~stooj@181.198.151.122.dynamic.dsl.dv.iprimus.net.au] has joined #debian
04:14   -!- stooj is "Stoo" on #debian #cryptoparty #openttdcoop #pentadactyl #debian-next
04:14   <dozer> Echoz: Even tried disabling some deep-sleep in the BIOS settings along with some ASPM setting to no avail. Yep, correct
04:14   <Ouroboros> dozer: (i meant after it happens)
04:14   <dozer> Echoz: A DMS-59 and VGa
04:15   <dozer> Ouroboros: Yes, tried disconnecting and re-connecting the video cable after it happens
04:17   <Echoz> dozer: Do you have another computer in the same network?
04:17   <dozer> Echoz: yes
04:17   <Echoz> dozer: If you run from the live environment, you may be able to start sshd and run the installation from there
04:18   -!- aguslr [~aguslr@0001a2ec.user.oftc.net] has quit [Quit: Coyote finally caught me]
04:18   -!- aguslr [~aguslr@111.98.117.91.dynamic.reverse-mundo-r.com] has joined #debian
04:18   -!- aguslr is "Agus" on #debian #awesome
04:18   <Ouroboros> hehe
04:19   <dozer> Echoz: so ssh into the Dell precision from another computer and run the installation from the 'other' computer
04:19   <dozer> Echoz: ?
04:19   <Echoz> dozer: Yup, the newt installer should run just fine inside a terminal emulator on your other computer
04:19   <jm_>   as in https://wiki.debian.org/DebianInstaller/Remote
04:20   <Echoz> Speaking of that I really wonder why I didn't do this while I was setting up a small NFS server at home yesterday...
04:21   <Ouroboros> i always wonder why i am working on the actual console and not ssh
04:21   <dozer> Echoz: Is there a default hostname/ credentials for the live environment to use w/ ssh?
04:21   <Ouroboros> dozer: user:live ?
04:21   <Echoz> dozer: Ouroboros is right
04:22   <Echoz> it has sudo rights, so just do sudo debian-installer-launcher, or sudo su ...
04:22   <dozer> Ouroboros: Thanks.
04:23   -!- pavlushka [~Pavel@00021abb.user.oftc.net] has joined #debian
04:23   -!- pavlushka is "Pavel Sayekat" on #linode #alioth #debian #debian-mozilla #debian-offtopic #debian-printing #OpenBSD #oftc #debconf16-menzies-9 #debconf16-menzies-12 #debconf16-menzies-10 #debconf
04:23   <dozer> Will DHCP be enabled when starting live then?
04:23   <Ouroboros> yes
04:23   <dozer> ok
04:23   <Echoz> Yeah, it sets up your first interface automatically
04:23   <Ouroboros> (a ton of stuff is enabled)
04:24   <Ouroboros> random weird network daemons that you probably dont want :)
04:24   -!- RaidSoft [~Averad@tor-exit.gansta93.com] has quit []
04:24   <Echoz> hmm, interesting, gonna do a port scan on the live environment i have running here in the office
04:25   -!- metachr0n [~nobody@46.166.190.141] has joined #debian
04:25   -!- metachr0n is "Jack Screw" on #C #debian-hurd #debian-bugs #debian #awesome
04:26   -!- krymzon [~krymzon@11.40.150.83.ftth.as8758.net] has joined #debian
04:26   -!- krymzon is "krymzon" on #debian
04:26   <Echoz> it seems login with password is disabled though, don't know if you were able to log in, dozer?
04:27   <dozer> Echoz: Need to locate another computer to use first, and might need to use the cable on this machine
04:27   -!- ol [~quassel@2406:e006:db1:1:53f6:7752:d0b:5ced] has quit [Ping timeout: 480 seconds]
04:27   <dozer> Echoz: You tried ssh into a live you have in your office?
04:28   <Echoz> dozer: Yeah, of course you can change the settings, though
04:28   <Ouroboros> Echoz: works for me, but its squeeze
04:28   <dozer> ok, thanks
04:28   -!- srtu [~hypnotoad@mue-88-130-0-008.dsl.tropolys.de] has joined #debian
04:28   -!- srtu is "Armin M\xFCller" on #debian
04:28   <Ouroboros> maybe they disabled it (which might be a good idea, heh)
04:30   <Echoz> Ouroboros: They did, but it was easily changed the same way you would on an installed system
04:30   <Echoz> so I was able to log in now
04:30   -!- lancelord [~lancelord@31.209.111.87] has quit [Quit: Ухожу я от вас (xchat 2.4.5 или старше)]
04:31   -!- soehnke1 [~soehnke1@ip1f12042b.dynamic.kabel-deutschland.de] has quit [Read error: No route to host]
04:32   -!- soehnke1 [~soehnke1@ip1f12042b.dynamic.kabel-deutschland.de] has joined #debian
04:32   -!- soehnke1 is "soehnke1" on #debian-apache #debian
04:32   -!- pamaury_ [~pamaury@89.28.146.93] has joined #debian
04:32   -!- pamaury_ is "Amaury Pouly" on #debian #debian-kde #debian-next
04:32   <dozer> Echoz: so ssh live@somethingsomething, and user: user, password: live?
04:33   <jm_>   why would you ssh to live environment?
04:33   <Echoz> dozer: no, ssh user@hostname
04:33   <Echoz> and then the password
04:33   <Echoz> probably replace hostname with the IP address
04:34   <dozer> Echoz: thanks
04:35   <Echoz> jm_: to install debian, the screen goes blank and won't wake when he uses the installer, even if launched from the console
04:35   <jm_>   Echoz: yeah but the idea is to start sshd by the installer, that's what network-console preseed setting does and then one can ssh to the dell system from another computer
04:36   -!- Me_Myself_and_I [~quassel@195.244.167.210] has quit [Remote host closed the connection]
04:36   <jm_>   and install via that, assuming it's not a hard lock or whatever
04:37   <Echoz> jm_: is there any advantage to this as opposed to just using ssh in the live environment?
04:37   <Ouroboros> whats the actualy correct thing to blacklist a module on the kernel command line, i tried nouveau.blacklist=1, that succeeded in not loading it because: nouveau: Unknown parameter `blacklist'; i also saw suggested nouveau.blacklist=yes and modprobe.blacklist=nouveau
04:37   <Ouroboros> i guess the last one?
04:37   <jm_>   Echoz: ahh sorry I get it now, yes it would be easier to configure using live that way
04:38   <jm_>   Ouroboros: man page says modprobe.blacklist=<module>
04:38   <Ouroboros> which man page
04:39   <jm_>   man modprobe
04:39   <Echoz> dozer: If you get authentication failure (publickey) let me know and I'll guide you through changing the ssh settings. of course this requires half a minute of access with the keyboard and display...
04:39   <Ouroboros> ok, i will try that, unless this module is not loaded via modprobe
04:40   -!- madbytes [~madbytes@103.7.81.163] has joined #debian
04:40   -!- madbytes is "madbytes" on #debian #tor
04:41   <Ouroboros> Echoz: technically, you dont need the display
04:42   <Echoz> Ouroboros: true, i could probably do it without with vim
04:42   -!- xyz666 [~xyz666@Chem.UBBCluj.Ro] has joined #debian
04:42   -!- xyz666 is "xyz666" on #debian
04:43   <Ouroboros> well, time to recompile the kernel.... again
04:49   <Echoz> user<return>live<return>sudo su<return>vi /etc/ssh/sshd<tab><return>/PasswordAuth<return>3fndwayes<escape>:wq<return>systemctl restart sshd<return>
04:49   <Echoz> that would enable password auth from the login prompt, no need for a display
04:49   <Ouroboros> heh
04:50   <Ouroboros> is there no more init.d ?
04:50   <Ouroboros> i really should get a newer livecd
04:50   <Echoz> Ouroboros: some of the init scripts are kept for backwards compatibility, but in Jessie systemd is default
04:51   <Ouroboros> never seen it yet
04:52   <Ouroboros> sounds vaguely similar to solaris smf
04:52   <jm_>   it is
04:52   <Ouroboros> good, i like smf
04:52   -!- Brigo [~Brigo@164.11.60.178.dynamic.reverse-mundo-r.com] has joined #debian
04:52   -!- Brigo is "realname" on #debian #debian-es #debian-next #debian-offtopic @#debian-es-offtopic #debian-mentors
04:52   <Echoz> works really well, i use it on almost all of my computers, except my raspberry pi that sits behind my TV with some XBMC distro
04:53   <Echoz> Jessie, that is
04:53   -!- barbanegra [~libertad@0001866c.user.oftc.net] has joined #debian
04:53   -!- barbanegra is "http://barbanegra.info/" on #debian
04:53   -!- soehnke1 [~soehnke1@ip1f12042b.dynamic.kabel-deutschland.de] has quit [Remote host closed the connection]
04:54   -!- blackcat [~blackcat@thor.ipbrick.com] has joined #debian
04:54   -!- blackcat is "Blackcat" on #debian-ha #lartc #debian
04:55   -!- soehnke1 [~soehnke1@ip1f12042b.dynamic.kabel-deutschland.de] has joined #debian
04:55   -!- soehnke1 is "soehnke1" on #debian-apache #debian
04:55   <Ouroboros> starting to get a bit old though
04:56   -!- fmmarques [~fmmarques@di18.pub.di.fct.unl.pt] has joined #debian
04:56   -!- fmmarques is "fmmarques" on #debian-kde #debian
04:56   -!- pamaury_ [~pamaury@89.28.146.93] has quit [Ping timeout: 480 seconds]
04:57   -!- Me_Myself_and_I [~quassel@195.244.167.210] has joined #debian
04:57   -!- Me_Myself_and_I is "Me Myself and I" on #debian
04:58   -!- mode/#debian [+l 749] by debhelper
04:58   -!- grrrrrr [~libertad@0001866c.user.oftc.net] has quit [Ping timeout: 480 seconds]
05:06   <Echoz> im getting lunch so i'll be away for a short while
05:07   -!- soehnke1 [~soehnke1@ip1f12042b.dynamic.kabel-deutschland.de] has quit [Remote host closed the connection]
05:07   <Ouroboros> are you bringing back enough for everyone?
05:08   -!- soehnke1 [~soehnke1@ip1f12042b.dynamic.kabel-deutschland.de] has joined #debian
05:08   -!- soehnke1 is "soehnke1" on #debian-apache #debian
05:12   -!- EmleyMoor [phil@00014da8.user.oftc.net] has quit [Quit: Adding fans]
05:13   -!- Velveeta_Chef [~Nope@24-151-37-213.dhcp.nwtn.ct.charter.com] has quit [Ping timeout: 480 seconds]
05:14   -!- czesmir [~stefan@dgt218.neoplus.adsl.tpnet.pl] has joined #debian
05:14   -!- czesmir is "Stefan" on #debian
05:16   -!- czesmir [~stefan@dgt218.neoplus.adsl.tpnet.pl] has quit []
05:16   -!- soehnke1 [~soehnke1@ip1f12042b.dynamic.kabel-deutschland.de] has quit [Ping timeout: 480 seconds]
05:16   -!- benages [~smuxi@90.71.225.53] has joined #debian
05:16   -!- benages is "Your Name" on #debian #smuxi
05:17   -!- czesmir [~stefan@dgt218.neoplus.adsl.tpnet.pl] has joined #debian
05:17   -!- czesmir is "Stefan" on #debian
05:17   -!- satbyy [~Satish_By@0002187b.user.oftc.net] has quit [Remote host closed the connection]
05:18   -!- wavekidsjp [~wavekidsj@h175-177-077-183.catv02.itscom.jp] has joined #debian
05:18   -!- wavekidsjp is "wavekidsjp" on #debian
05:19   -!- soehnke1 [~soehnke1@ip1f12042b.dynamic.kabel-deutschland.de] has joined #debian
05:19   -!- soehnke1 is "soehnke1" on #debian-apache #debian
05:19   -!- pamaury_ [~pamaury@89.28.146.93] has joined #debian
05:19   -!- pamaury_ is "Amaury Pouly" on #debian #debian-kde #debian-next
05:20   -!- madbytes [~madbytes@103.7.81.163] has quit [Quit: My MacBook has gone to sleep. ZZZzzz…]
05:21   <Ouroboros> dozer: but if live also has the issue, it might be easier to debug it on live first?
05:23   <dozer> Ouroboros: Sorry for the absence. Would need ssh then as the live goes black fairly quickly.
05:24   <Ouroboros> yes
05:24   <Ouroboros> but you might as well figure it out on live first so that you can cleanly apply the fix later
05:24   <Ouroboros> since presumably it will also happen on the installed version
05:25   -!- bluca [~lboccass@212.44.21.120.ip.redstone-isp.net] has joined #debian
05:25   -!- bluca is "purple" on #debian
05:26   <dozer> Ouroboros: yes, not sure yes if I'll have a spare computer on the network that I can use
05:29   -!- Velveeta_Chef [~Nope@24-151-37-213.dhcp.nwtn.ct.charter.com] has joined #debian
05:29   -!- Velveeta_Chef is "realname" on #debian-offtopic #debian #debian-cinnamon #debian-kde
05:29   <dozer> yet*
05:29   -!- bodhi [~bodhi@dslb-088-078-207-153.088.078.pools.vodafone-ip.de] has joined #debian
05:29   -!- bodhi is "realname" on #alioth #debian-mozilla #debian-mozext #debian-bugs #debian-games #debian-mirrors #debian-lists #debian-next #debian-multimedia #debian-efi #tor-project #tor #siduction-de #debian-ubuntu #debian-fedmsg #debian-devel-changes #debian-derivatives #debian
05:31   <dozer> Any chance the memory could be corrupt? Although, then the ubuntu should've failed also?
05:33   <Ouroboros> nah, that would more likely cause a kernel panic or similar
05:33   <Ouroboros> the video card could be broken though
05:33   -!- Vollstrecker [~vollstrec@p2003007A2A36FB000A606EFFFE4490F9.dip0.t-ipconnect.de] has quit [Remote host closed the connection]
05:33   -!- Vollstrecker [~vollstrec@p2003007A2A36FB000A606EFFFE4490F9.dip0.t-ipconnect.de] has joined #debian
05:33   -!- Vollstrecker is "Werner Mahr" on #debian-kde #debian
05:33   <Ouroboros> maybe compare what video driver ubuntu is using?
05:35   <dozer> Ouroboros: Ok
05:35   <Ouroboros> also, if you ssh into live after it happens
05:36   <Ouroboros> perhaps there is something in the logs
05:36   <Echoz> dozer: are you using a live distro with or without a GUI?
05:38   -!- rbern [~rbern@00021abc.user.oftc.net] has quit [Read error: Connection reset by peer]
05:38   <dozer> Echoz: Live with gui.
05:39   <Ouroboros> dozer: and the installer you used... is it X or curses?
05:39   <dozer> Echoz: Sorry, on my personal comp?
05:40   -!- allenmelon [~anadrom@108.61.122.216] has joined #debian
05:40   -!- allenmelon is "Xerati" on #debian
05:42   <dozer> Ouroboros: Not sure - how can I tell?
05:43   <Ouroboros> well, the curses installer is the one with the pseudo-graphical blue menus
05:43   <Ouroboros> (i am not sure if there even exists an X installer)
05:44   <dozer> Ouroboros: Ah. Well, I've used both the non-graphical (pseudo-graphical blue menus) and the graphical one. Not sure if it's X
05:45   -!- aidalgol [~aidalgol@0001a1b7.user.oftc.net] has quit [Remote host closed the connection]
05:45   <Ouroboros> ok
05:46   -!- rbern [~rbern@00021abc.user.oftc.net] has joined #debian
05:46   -!- rbern is "rbern" on #debian-ubuntu #debian-systemd #debian #debian-arm #debian-apt #virtualization #reproducible-builds #lxde #ikiwiki #debian-next #debian-mozilla #debian-mentors #debian-live #debian-bootstrap
05:46   <dozer> Is it fair to suspect that the kernel in the debian installers don't jive with the dell precision?
05:47   -!- soehnke1 [~soehnke1@ip1f12042b.dynamic.kabel-deutschland.de] has quit [Remote host closed the connection]
05:47   <dozer> brb... coffee time
05:47   -!- QwertyDragon [~QwertyDra@pool-98-118-51-122.bstnma.fios.verizon.net] has joined #debian
05:47   -!- QwertyDragon is "realname" on #debian #debian-mentors #debian-next #fish
05:47   -!- pavlushka [~Pavel@00021abb.user.oftc.net] has quit [Ping timeout: 480 seconds]
05:48   -!- soehnke1 [~soehnke1@ip1f12042b.dynamic.kabel-deutschland.de] has joined #debian
05:48   -!- soehnke1 is "soehnke1" on #debian-apache #debian
05:48   <Ouroboros> dozer: (0) wait until live blanks (2) ssh in, get the logs (3) try running 'xset -dpms' or 'xset dpms force on' in ssh or on command line
05:49   <Ouroboros> or 'vbetool dpms on' if not in X
05:49   <Ouroboros> doubt any of that will work, but who knows
05:50   <dozer> Ouroboros: Ok, can try that when I get a hold of another computer.
05:51   <Ouroboros> or just have terminal open and type those in
05:51   <dozer> I believe the server originally had wheezy on it - so why debian 6,7,8,9 doesn't work BUT ubuntu 14.04 and lubuntu 16 worked is beyond me.
05:52   <Ouroboros> shrug
05:53   -!- QwertyDragon [~QwertyDra@pool-98-118-51-122.bstnma.fios.verizon.net] has quit [Quit: Leaving]
05:54   <Ouroboros> different kernel, drivers, settings, who knows
05:54   -!- QwertyDragon [~QwertyDra@pool-98-118-51-122.bstnma.fios.verizon.net] has joined #debian
05:54   -!- QwertyDragon is "realname" on #debian #debian-mentors #debian-next #fish
05:54   -!- soehnke1 [~soehnke1@ip1f12042b.dynamic.kabel-deutschland.de] has quit [Remote host closed the connection]
05:55   -!- ixti [~ixti@242.red-83-45-93.dynamicip.rima-tde.net] has quit [Ping timeout: 480 seconds]
05:56   -!- soehnke1 [~soehnke1@ip1f12042b.dynamic.kabel-deutschland.de] has joined #debian
05:56   -!- soehnke1 is "soehnke1" on #debian-apache #debian
05:56   -!- fmmarques [~fmmarques@di18.pub.di.fct.unl.pt] has quit [Remote host closed the connection]
05:57   -!- srtu [~hypnotoad@mue-88-130-0-008.dsl.tropolys.de] has quit [Quit: Verlassend]
05:58   <dozer> anywhere on the debian site that lists kernels in the different release images?
05:59   -!- fmmarques [~fmmarques@193.136.122.18] has joined #debian
05:59   -!- fmmarques is "fmmarques" on #debian-kde #debian
06:00   <Echoz> dozer: might be easier to use the live image without a GUI, if you lose the display and have to use only keyboard
06:00   <Ouroboros> dozer: dunno, but it is here: https://en.wikipedia.org/wiki/Debian_version_history#Release_table
06:01   <Ouroboros> dozer: is the screen off?
06:01   <mots>  Wasn't there a command to list them in this channel? I think it was ",kernels" or something
06:01   <dozer> Echoz: Is that the same as failsafe? I get two options for live: amd64 and amd64(failsafe)
06:01   <dozer> Ouroboros: yep
06:02   <Ouroboros> not black or something
06:02   <dozer> Ouroboros: Monitor goes to sleep, i.e. no signal
06:03   <Ouroboros> ok
06:03   <Ouroboros> so it could be in power save, or something crashed, or ...
06:04   -!- fmmarques [~fmmarques@193.136.122.18] has quit [Read error: Connection reset by peer]
06:04   <Ouroboros> and it completely works in some other OS right now?
06:05   <jm_>   judd kernels
06:05   <judd>  Available kernel versions are: experimental: 4.8.0-rc8-686-pae (4.8~rc8-1~exp1); sid: 4.7.0-1-686 (4.7.6-1); stretch: 4.7.0-1-686 (4.7.5-1); jessie-backports: 4.7.0-0.bpo.1-686-pae (4.7.5-1~bpo8+2); jessie: 3.16.0-4-686-pae (3.16.36-1+deb8u1); wheezy-backports: 3.16.0-0.bpo.4-686-pae (3.16.36-1+deb8u1~bpo70+1); wheezy: 3.2.0-4-686-pae (3.2.81-2)
06:06   -!- EmleyMoor [phil@topdeck.tinsleyviaduct.com] has joined #debian
06:06   -!- EmleyMoor is "Phil Reynolds" on #debian
06:06   <dozer> Ouroboros: No, the installer failed around writing to the hdd. But was running ubuntu 14.04 LTS yesterday for a longer period of time (where I could wake it up again after going into sleep)
06:07   -!- madbytes [~madbytes@103.7.81.163] has joined #debian
06:07   -!- madbytes is "madbytes" on #debian #tor
06:08   <Ouroboros> well, try some of those ideas ^^
06:08   -!- gleopardi [~norbertus@93-57-16-194.ip162.fastwebnet.it] has joined #debian
06:08   -!- gleopardi is "Andrea Claudi" on #debian-kde #debian
06:09   -!- gleopardi is now known as norbertus
06:10   -!- dselect [~dselect@dselect.bot.oftc.net] has quit [Quit: ouch... that hurt]
06:10   -!- EmleyMoo1 [phil@topdeck.tinsleyviaduct.com] has joined #debian
06:10   -!- EmleyMoo1 is "Phil Reynolds" on #debian
06:10   -!- allenmelon [~anadrom@108.61.122.216] has quit []
06:10   -!- mythos [~mythos@80-109-225-139.cable.dynamic.surfer.at] has quit [Quit: Verlassend]
06:10   -!- EmleyMoo1 [phil@topdeck.tinsleyviaduct.com] has quit []
06:10   -!- mythos [~mythos@80-109-225-139.cable.dynamic.surfer.at] has joined #debian
06:10   -!- mythos is "mythos" on #debian #debian-gnome #debian-offtopic
06:11   -!- dselect [~dselect@dselect.bot.oftc.net] has joined #debian
06:11   -!- dselect is "dpkg backup readonly db" on #debian ##uddmill
06:11   -!- fmmarques [~fmmarques@di18.pub.di.fct.unl.pt] has joined #debian
06:11   -!- fmmarques is "fmmarques" on #debian-kde #debian
06:12   -!- Human [~Human_G33@62.147.242.8] has joined #debian
06:12   -!- Human is "Human_G33k" on #debian #debian-devel-changes #debian-fedmsg #debian-fr #debian-next #linux-nfs
06:16   <dozer> interesting. Got so far in failsafe to set xset -dpms and xset dpms force on (definately X) - and I'm runnning the installer now
06:16   <dozer> and it died!
06:17   -!- pamaury_ [~pamaury@89.28.146.93] has quit [Ping timeout: 480 seconds]
06:17   <Ouroboros> the installer was also in X?
06:19   <dozer> Ouroboros: That I don't know. Just said xterm something when I tried to setterm -blank 0 etc..
06:19   -!- Human_G33k [~Human_G33@62.147.242.8] has quit [Ping timeout: 480 seconds]
06:19   <Ouroboros> i think we really need to see the logs
06:19   <Ouroboros> figure out how to ssh in there
06:24   -!- ao2 [~ao2@cl-35.trn-01.it.sixxs.net] has joined #debian
06:24   -!- ao2 is "ao2" on #debian #cell
06:25   -!- NomadJim_ [~NomadJim@72.168.161.49] has quit [Quit: Leaving]
06:26   -!- Corey84 [~Corey84@wsip-70-175-229-132.dc.dc.cox.net] has joined #debian
06:26   -!- Corey84 is "Corey" on #openstack #openbox #oftc #linux #kvm #irssi #https-everywhere #gcc #freenode #fosscar #fossology #ext4 #debian #Corsair #codesurfers #apparmor #smxi
06:27   -!- Corey84 is now known as Guest1965
06:30   -!- sqirrrl [~quassel@tmo-112-62.customers.d1-online.com] has quit [Ping timeout: 480 seconds]
06:31   -!- fmmarques [~fmmarques@di18.pub.di.fct.unl.pt] has quit [Remote host closed the connection]
06:33   -!- mythos [~mythos@80-109-225-139.cable.dynamic.surfer.at] has quit [Quit: Verlassend]
06:33   -!- mythos [~mythos@80-109-225-139.cable.dynamic.surfer.at] has joined #debian
06:33   -!- mythos is "mythos" on #debian #debian-gnome #debian-offtopic
06:34   -!- fmmarques [~fmmarques@di18.pub.di.fct.unl.pt] has joined #debian
06:34   -!- fmmarques is "fmmarques" on #debian-kde #debian
06:42   <fmmarques> Hi all. I really need to install the Ubuntu fglrx .deb in Jessie. How can i accomplish this?
06:43   <Ouroboros> dpkg -i *.deb ?
06:43   <dpkg>  package *.deb is already installed
06:43   <Ouroboros> ..
06:43   -!- swirl_ [~swirl@2.46.75.48] has joined #debian
06:43   -!- swirl_ is "swirl" on #debian-qa #debian-kde #debian-forensics #debian
06:44   <duclicsic> ubuntu debs are not guaranteed to work on debian
06:44   <fmmarques> Ouroboros: it tells me the file is not a debian format...
06:44   <jm_>   please don't do that, we won't help with it either
06:45   <fmmarques> duclicsic: I understand. But I need the fglrx driver for OpenCL development. I tried the fglrx-driver package in both jessie and jessie-backports and it does not work correctly. My only hope is using the AMD drivers.
06:45   -!- jova2 [~giovani@177-038-005-211.pontocomnet.com.br] has quit [Read error: Connection reset by peer]
06:46   <jm_>   how exactly do you think ubuntu deb will help then?
06:46   <EmleyMoor> Hmmm... I seem to have an extra printer called "print" - its description is my postcode
06:47   <fmmarques> It is the closest format to debian that AMD gives out. The source package, which I tried to download to build and install the module, fails download.
06:48   <EmleyMoor> Not listed in cups...
06:48   <EmleyMoor> Looks like it may be the printer itself serving in
06:49   <EmleyMoor> it*
06:49   <sysop> dpkg -i thiscantwork.deb
06:49   *   dpkg installs thiscantwork.deb into sysop's head with a bone saw and a few screws
06:49   -!- farsight [~farsight@125.69.44.162] has joined #debian
06:49   -!- farsight is "ubuntu" on #debian
06:50   -!- farsight [~farsight@125.69.44.162] has quit []
06:50   -!- swirl [~swirl@host107-25-static.240-95-b.business.telecomitalia.it] has quit [Ping timeout: 480 seconds]
06:50   -!- jova2 [~giovani@177-038-005-211.pontocomnet.com.br] has joined #debian
06:50   -!- jova2 is "Giovani Ferreira" on #debian-publicity #debian-mentors #debian-lts #debian-l10n-br #debian-br #debian-forensics #debian #debian-devel-br #debconf
06:50   -!- hector [~hector@210.red-83-36-192.dynamicip.rima-tde.net] has joined #debian
06:50   -!- hector is "Héctor Sales" on #debian-kde #debian
06:51   -!- swirl [~swirl@host107-25-static.240-95-b.business.telecomitalia.it] has joined #debian
06:51   -!- swirl is "swirl" on #debian-qa #debian-kde #debian-forensics #debian
06:51   -!- hector [~hector@210.red-83-36-192.dynamicip.rima-tde.net] has quit []
06:53   -!- olinuxx [~capturixe@ANancy-653-1-517-245.w109-221.abo.wanadoo.fr] has joined #debian
06:53   -!- olinuxx is "capturix" on #linux-rt #debian-next #debian-multimedia #debian-mirrors #debian-mentors #debian-live #debian-l10n-fr #debian-france #debian-fr #debian-edu #debian
06:53   -!- dozer [~rt@195.159.183.42] has quit [Ping timeout: 480 seconds]
06:57   -!- sqirrrl [~quassel@tmo-112-62.customers.d1-online.com] has joined #debian
06:57   -!- sqirrrl is "Mirko Ahnert" on #debian
06:58   <Ouroboros> hmm, is it normal that there are no manpages for gcc etc?
06:58   -!- swirl_ [~swirl@2.46.75.48] has quit [Ping timeout: 480 seconds]
07:00   <jm_>   if you don't install them, then yes
07:01   <Heiki> the manpages are in the gcc-doc package
07:01   <jelly> Ouroboros: yes, you will have to
07:01   <jelly> !non-free sources
07:01   <dpkg>  Edit /etc/apt/sources.list, ensure that the two main Debian mirror lines end with "main contrib non-free" rather than just "main", then «aptitude update». But bear in mind that you'll be installing <non-free> software. These may have onerous terms; check the licenses. See also <sources.list>.
07:01   -!- santech [~santech@net-188-152-94-79.cust.dsl.teletu.it] has joined #debian
07:01   -!- santech is "Debian" on #debian
07:01   <jelly> and then install gcc-doc from there
07:01   <santech>   ciao
07:02   <jelly> ah, it's actually in contrib not non-free
07:02   <Ouroboros> oh, that explains it
07:02   <jelly> ,depends gcc-doc
07:02   <judd>  Package gcc-doc in jessie/amd64 -- depends: gcc-4.9-doc (>= 4.9.1-2).
07:02   <jelly> ,v gcc-4.9-doc
07:02   <judd>  Package: gcc-4.9-doc on amd64 -- jessie/non-free: 4.9.1-3
07:03   <jelly> so yeah, non-free
07:03   -!- dozer [~rt@195.159.183.42] has joined #debian
07:03   -!- dozer is "rt" on @#debian-install #debian
07:03   <santech>   !list
07:03   <dpkg>  santech: È possibile scaricare un sacco di software libero puntando il tuo browser a http://cdimage.debian.org/debian-cd/current/multi-arch/iso-cd/debian-8.6.0-amd64-i386-netinst.iso !
07:05   -!- dpkg [~dpkg@dpkg.bot.oftc.net] has quit [Quit: buh bye!]
07:05   <santech>   http://xdcc_
07:05   -!- santech [~santech@net-188-152-94-79.cust.dsl.teletu.it] has quit []
07:05   -!- dpkg [~dpkg@dpkg.bot.oftc.net] has joined #debian
07:05   -!- dpkg is "apt backup" on #debian
07:08   -!- rajasekhar_ [~rajasekha@124.123.66.27] has joined #debian
07:08   -!- rajasekhar_ is "Rajasekhar Ponakala" on #debian
07:08   -!- three_legs [~neophobia@107.161.29.85] has quit [Quit: leaving]
07:08   <xyz666>    hi, did anyone have problems with wine/playonlinux after installing debian jessie?
07:08   -!- neophobia-irc [~neophobia@107.161.29.85] has joined #debian
07:08   -!- neophobia-irc is "neophobia-irc" on #debian
07:08   -!- neophobia-irc [~neophobia@107.161.29.85] has quit []
07:11   -!- EfedMd [~kvirc@mail.rcnk.md] has joined #debian
07:11   -!- EfedMd is "Evgenii" on #debian
07:11   -!- bodhi [~bodhi@dslb-088-078-207-153.088.078.pools.vodafone-ip.de] has quit [Quit: Leaving]
07:13   <EmleyMoor> Hmmm... turns out turning off mDNS stops my printer serving AirPrint. Latest version also does Google Cloud but that has a specific checkbox.
07:13   -!- isaagar [~quassel@210.7.64.2] has joined #debian
07:13   -!- isaagar is "Sagar" on #debian #debian-in #hamara
07:14   -!- EfedMd [~kvirc@mail.rcnk.md] has quit []
07:21   -!- Madatnek [~adamd@c-fba7db54.046-15-7673745.cust.bredbandsbolaget.se] has quit [Ping timeout: 480 seconds]
07:23   -!- xyz666 [~xyz666@Chem.UBBCluj.Ro] has quit [Quit: Leaving]
07:26   -!- benages [~smuxi@90.71.225.53] has quit [Ping timeout: 480 seconds]
07:26   -!- KindOne [kindone@0001a7db.user.oftc.net] has quit [Quit: ...]
07:33   -!- sqirrrl [~quassel@tmo-112-62.customers.d1-online.com] has quit [Ping timeout: 480 seconds]
07:35   -!- KindOne [kindone@0001a7db.user.oftc.net] has joined #debian
07:35   -!- KindOne is "..." on #utdlug #suckless #qemu #php #ovirt #osm #oftc #moocows @#mirc #linuxfs #linode #libevent #https-everywhere #globaleaks #gentoo #gcc #g7 #freenode #debian #debconf #ceph #bcache #awesome #attic
07:35   -!- sqirrrl [~quassel@tmo-112-62.customers.d1-online.com] has joined #debian
07:35   -!- sqirrrl is "Mirko Ahnert" on #debian
07:40   -!- metachr0n [~nobody@46.166.190.141] has quit [Quit: WeeChat 1.5]
07:40   -!- metachr0n [~nobody@46.166.137.214] has joined #debian
07:40   -!- metachr0n is "Jack Screw" on #C #debian-hurd #debian-bugs #debian #awesome
07:41   -!- Volley [~worf@hexen.cgv.tu-graz.ac.at] has joined #debian
07:41   -!- Volley is "Wolfgang Scheicher" on #realraum #virt #debian-live #debian-kde #debian-next #debian
07:42   -!- Vollstrecker_ [~vollstrec@p2003007A2A36FB000A606EFFFE4490F9.dip0.t-ipconnect.de] has joined #debian
07:42   -!- Vollstrecker_ is "Werner Mahr" on #debian-kde #debian
07:42   -!- Vollstrecker [~vollstrec@p2003007A2A36FB000A606EFFFE4490F9.dip0.t-ipconnect.de] has quit [Read error: Connection reset by peer]
07:45   <grawity>   makes sense, since Air* relies heavily on mDNS for device discovery
07:45   <grawity>   tbh I think Apple pretty much invented mDNS for printers
07:45   -!- gem [~gem@106.51.17.228] has quit [Ping timeout: 480 seconds]
07:45   -!- ValkyrieSec [~DDoSTheWo@173.199.65.15] has joined #debian
07:45   -!- ValkyrieSec is "HackThePlanet" on #debian
07:46   -!- bnw [~bnw@183.17.255.247] has quit [Quit: Leaving]
07:46   -!- Ouroboros [~Ouroboros@c-24-4-10-141.hsd1.ca.comcast.net] has quit []
07:47   -!- kingsley [~kingsley@65-102-176-42.tukw.qwest.net] has quit [Ping timeout: 480 seconds]
07:47   -!- led [~farsight@125.69.44.162] has joined #debian
07:47   -!- led is "ubuntu" on #debian
07:48   -!- zzp [~farsight@125.69.44.162] has joined #debian
07:48   -!- zzp is "ubuntu" on #debian
07:48   <led>   帐篷你ihao
07:49   -!- bradfa [~andrew@clr-vpn01.kodakalaris.com] has joined #debian
07:49   -!- bradfa is "Andrew Bradford" on #debian-next #debian
07:50   -!- led [~farsight@125.69.44.162] has quit []
07:52   -!- desert [~desert@97-123-3-185.albq.qwest.net] has joined #debian
07:52   -!- desert is "Desert" on #debian
07:52   -!- bollo [~quassel@00021dc1.user.oftc.net] has quit [Ping timeout: 480 seconds]
07:53   -!- omi [~omi@CPE7cb21b1debd6-CM7cb21b1debd3.cpe.net.cable.rogers.com] has joined #debian
07:53   -!- omi is "omi" on #debian
07:54   <desert>    sorry if this is the wrong chat, but what does debian use for a driver manager?
07:55   <themill>   what's a driver manager?
07:55   <omi>   Hello, I'm trying to make debian boot from iscsi root. It works when I manually add ISCSI target AND manually specify the machine's IP in the kernel boot command. BUT dhcp doesn't work from the kernel when doing ip=dhcp. YES, DHCP server works as it gives it lease twice to do pxe booting (and other hosts dhcp fine too) Any ideas why ip=dhcp just doen'st do anything? DHCPD log says that it offered the lease as before, but
07:55   <omi>   kernel doesn't do anything with it.
07:56   <desert>    a package like synaptic, but for getting drivers your your hardware
07:56   <dozer> *hate the fact that ubuntu works and debian doesn't on this dell precision
07:56   <themill>   desert: You don't "get drivers" like that. What are you trying to do?
07:56   -!- antgel [~topdog@82.166.98.41] has quit [Ping timeout: 480 seconds]
07:56   -!- benages [~smuxi@90.71.225.53] has joined #debian
07:56   -!- benages is "Your Name" on #debian #smuxi
07:57   <desert>    themill, im trying to find drivers for my graphics card
07:57   <themill>   which is?
07:57   <omi>   http://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/8.6.0+nonfree/amd64/iso-cd/
07:58   <desert>    a r9 380x
07:58   <omi>   This is useful for installing firmware for network cards and such
07:58   <desert>    no, an r9 380 sorry
07:58   <omi>   you need AMD driver.
07:58   -!- norbertus [~norbertus@93-57-16-194.ip162.fastwebnet.it] has quit [Read error: Connection reset by peer]
07:59   <omi>   https://wiki.debian.org/ATIProprietary
07:59   <desert>    thank you
07:59   <omi>   note that it may have issues with gnome they say.
07:59   *   abrotman thought fglrx was dead?
07:59   <desert>    as long as it doesen't melt the card, il manage
08:00   <omi>   yeah I had fked up monitor, so AMD driver didn't work out of the box right away. but NVIDa proprietary I never had issues.
08:00   <omi>   but AMD nice cards :D
08:00   <omi>   Can anyone help with my kernel ip=dhcp issue?
08:01   -!- madbytes [~madbytes@103.7.81.163] has quit [Ping timeout: 480 seconds]
08:01   -!- rajasekhar_ [~rajasekha@124.123.66.27] has quit [Ping timeout: 480 seconds]
08:02   <omi>   After several iterations, IP Config: No response after __ seconds
08:02   <omi>   dhcpd log says that the lease was offered.
08:04   -!- madbytes [~madbytes@103.7.81.163] has joined #debian
08:04   -!- madbytes is "madbytes" on #debian
08:04   <jm_>   omi: do debian kernels have relevant config options enabled?
08:06   -!- famt [~famt@seven.user.oftc.net] has joined #debian
08:06   -!- famt is "Fabio A. De Muzio Tobich" on #debian-offtopic #debian-next #debian-br #debian
08:07   -!- Maria [~Maria@ersc148.goemobile.de] has joined #debian
08:07   -!- Maria is "Maria" on #debian-kde #debian
08:08   -!- zzp [~farsight@125.69.44.162] has quit [Remote host closed the connection]
08:10   -!- fmmarques [~fmmarques@di18.pub.di.fct.unl.pt] has quit [Remote host closed the connection]
08:10   <omi>   jm_ what do you mean 'relevant'?
08:10   <jm_>   omi: described in filesystems/nfs/nfsroot.txt
08:11   <jm_>   but I'll have to go now (should be CONFIG_IP_PNP* or somesuch)
08:11   -!- pdo_fn14 [~Guess@125.165.130.209] has joined #debian
08:11   -!- pdo_fn14 is "realname" on #debian
08:12   <omi>   jm_ everything works provided I specify the IP manually in the kernel parameter. But that's one thing I would rather not do to keep the image generic. I want to be able to boot multiple hosts (and them get IP address as needed through dhcp settings rather than doing it)
08:12   <pdo_fn14>  Hi, just realized with clementine now.
08:13   -!- jm_ [flier@000125af.user.oftc.net] has quit [Quit: Disconnecting]
08:13   <pdo_fn14>  But, it's said my gstreamer is still missing
08:13   <pdo_fn14>  so what gonna to do now?.
08:14   -!- famt [~famt@seven.user.oftc.net] has quit [Quit: Leaving]
08:15   -!- pdo_fn14 [~Guess@125.165.130.209] has quit [Read error: Connection reset by peer]
08:16   -!- pdo_fn14 [~Guess@125.165.130.209] has joined #debian
08:16   -!- pdo_fn14 is "realname" on #debian
08:17   -!- famt [~famt@200.189.119.19] has joined #debian
08:17   -!- famt is "Fabio A. De Muzio Tobich" on #debian-offtopic #debian-next #debian-br #debian
08:18   <pdo_fn14>  hello, sorry bad connection now.
08:19   -!- linurc [~linurc@cpe-174-109-161-187.nc.res.rr.com] has joined #debian
08:19   -!- linurc is "linurc" on #debian
08:20   -!- linurc [~linurc@cpe-174-109-161-187.nc.res.rr.com] has left #debian []
08:21   -!- muellejo [~muellejo@h85.hostsharing.net] has joined #debian
08:21   -!- muellejo is "muellejo" on #debian
08:21   -!- muellejo [~muellejo@h85.hostsharing.net] has quit [Remote host closed the connection]
08:22   -!- desert_ [~desert@212-129-33-61.freevpn.me] has joined #debian
08:22   -!- desert_ is "Desert" on #debian
08:23   -!- nagarjung [~nagarjung@14.141.6.170] has joined #debian
08:23   -!- nagarjung is "nagarjung" on #debian
08:23   -!- pavlushka [~Pavel@00021abb.user.oftc.net] has joined #debian
08:23   -!- pavlushka is "Pavel Sayekat" on #linode #alioth #debian #debian-mozilla #debian-offtopic #debian-printing #OpenBSD #oftc #debconf16-menzies-9 #debconf16-menzies-12 #debconf16-menzies-10 #debconf
08:24   -!- itd [~itd@0002249b.user.oftc.net] has joined #debian
08:24   -!- itd is "itd" on #debian
08:25   -!- Pommesgabel [~Izanagi@108.61.122.216] has joined #debian
08:25   -!- Pommesgabel is "PuyoDead" on #debian
08:28   -!- desert [~desert@97-123-3-185.albq.qwest.net] has quit [Ping timeout: 480 seconds]
08:29   -!- desert_ [~desert@212-129-33-61.freevpn.me] has quit [Quit: Leaving]
08:29   -!- Rosco2 [~RossGammo@188-183-60-50-dynamic.dk.customer.tdc.net] has joined #debian
08:29   -!- Rosco2 is "Ross Gammon" on #debian-science #debian-gnome #debian-js #debian-nordic #debian-multimedia #debian-mentors #debian-gis #debian-bugs #debian
08:31   -!- wargreen [~wargreen@ip-188.net-80-236-36.suresnes.rev.numericable.fr] has quit [Read error: Connection reset by peer]
08:33   -!- wargreen [~wargreen@ip-188.net-80-236-36.suresnes.rev.numericable.fr] has joined #debian
08:33   -!- wargreen is "realname" on #debian #debian-fr
08:36   -!- favioflamingo [~Icedove@2400:7800:412e:e511:5054:ff:fe04:134a] has quit [Quit: favioflamingo]
08:37   -!- txgvnn [~Icedove@1.55.78.30] has joined #debian
08:37   -!- txgvnn is "txgvnn" on #debian-hurd @#debian-vn #debian
08:38   <Echoz> pdo_fn14: do you have gstreamer?
08:40   -!- zathras [~Zzzzzzzzz@62-251-21-6.ip.xs4all.nl] has joined #debian
08:40   -!- zathras is "realname" on #debian
08:44   -!- cruncher [~cruncher@00020ba0.user.oftc.net] has joined #debian
08:44   -!- cruncher is "cruncher" on #debian-devel-changes #debian #debian-next
08:45   -!- faw [~faw@faw.user.oftc.net] has quit [Ping timeout: 480 seconds]
08:45   <pdo_fn14>  <Echoz>: Yes.
08:45   -!- faw [~faw@faw.user.oftc.net] has joined #debian
08:45   -!- faw is "Felipe Augusto van de Wiel" on @#cathedral #debconf #debian #debian-apt #debian-bugs #debian-devel-br #debian-i18n #debian-l10n-br #debian-mentors #debian-mirrors #debian-qa #debian-www @#funlabs
08:46   -!- swirl [~swirl@host107-25-static.240-95-b.business.telecomitalia.it] has quit [Read error: Connection reset by peer]
08:46   -!- swirl [~swirl@host107-25-static.240-95-b.business.telecomitalia.it] has joined #debian
08:46   -!- swirl is "swirl" on #debian-qa #debian-kde #debian-forensics #debian
08:49   -!- Tld [~sylvain@2a01cb00054c4000f78bb4c4172950ff.ipv6.abo.wanadoo.fr] has joined #debian
08:49   -!- Tld is "sylvain" on #debian #debian-fr
08:49   -!- Tld is now known as Guest1974
08:49   -!- Guest1974 [~sylvain@2a01cb00054c4000f78bb4c4172950ff.ipv6.abo.wanadoo.fr] has quit []
08:52   <pdo_fn14>  test
08:52   -!- txgvnn [~Icedove@1.55.78.30] has quit [Remote host closed the connection]
08:53   <pdo_fn14>  ,v judd systemd
08:53   <judd>  No package named 'judd' was found in amd64.
08:53   <pdo_fn14>  ,v systemd
08:53   <judd>  Package: systemd on amd64 -- wheezy-security: 44-11+deb7u4; wheezy: 44-11+deb7u4; wheezy-backports: 204-14~bpo70+1; jessie: 215-17+deb8u5; jessie-backports: 230-7~bpo8+2; sid: 231-9; stretch: 231-9
08:54   -!- mzf [~mzf@94.183.153.137] has quit [Quit: Leaving]
08:55   -!- Pommesgabel [~Izanagi@108.61.122.216] has quit []
08:58   -!- sqirrrl [~quassel@tmo-112-62.customers.d1-online.com] has quit [Ping timeout: 480 seconds]
08:58   -!- mythos [~mythos@80-109-225-139.cable.dynamic.surfer.at] has quit [Ping timeout: 480 seconds]
08:59   -!- groolot [~groolot@80.82.238.198] has joined #debian
08:59   -!- groolot is "Gregory DAVID" on #debian-live #debian
09:03   -!- towo^work [~towo@00012f0f.user.oftc.net] has quit [Quit: Leaving]
09:05   -!- mythos [~mythos@85-124-64-143.static.upcbusiness.at] has joined #debian
09:05   -!- mythos is "mythos" on #debian #debian-gnome #debian-offtopic
09:05   -!- krabador [~krabador@000208ac.user.oftc.net] has joined #debian
09:05   -!- krabador is "krabador" on #debian-it #debian
09:07   -!- Maria [~Maria@ersc148.goemobile.de] has quit [Quit: Konversation terminated!]
09:08   -!- omi [~omi@CPE7cb21b1debd6-CM7cb21b1debd3.cpe.net.cable.rogers.com] has quit [Ping timeout: 480 seconds]
09:11   -!- Maria [~Maria@ersc148.goemobile.de] has joined #debian
09:11   -!- Maria is "Maria" on #debian-kde #debian
09:12   -!- arturo [~aborrero@r2d2.cica.es] has quit [Remote host closed the connection]
09:15   -!- wCPO [~kristian@188.228.31.139] has joined #debian
09:15   -!- wCPO is "Kristian Klausen" on #debian-live #debian #debian-next #debian-lxqt #debian-mentors
09:19   -!- faw [~faw@faw.user.oftc.net] has quit [Ping timeout: 480 seconds]
09:19   -!- Madatnek [~adamd@c-fba7db54.046-15-7673745.cust.bredbandsbolaget.se] has joined #debian
09:19   -!- Madatnek is "adamd" on #debian-next #debian #debian-offtopic
09:21   -!- Maria [~Maria@ersc148.goemobile.de] has quit [Ping timeout: 480 seconds]
09:24   -!- anonymous [~anonymous@178.34.161.22] has joined #debian
09:24   -!- anonymous is "anonymous" on #debian
09:25   -!- anonymous [~anonymous@178.34.161.22] has quit []
09:33   -!- Maria [~Maria@ersc148.goemobile.de] has joined #debian
09:33   -!- Maria is "Maria" on #debian-kde #debian
09:37   -!- Out`Of`Control [~Viper@000192c2.user.oftc.net] has joined #debian
09:37   -!- Out`Of`Control is "Viper" on #debian #ufo #debian-arm #osm #freedombox #osm-ru #rbose
09:39   -!- Maria [~Maria@ersc148.goemobile.de] has quit [Read error: Connection reset by peer]
09:42   -!- pavlushka [~Pavel@00021abb.user.oftc.net] has quit [Ping timeout: 480 seconds]
09:42   -!- pdo_fn14 [~Guess@125.165.130.209] has quit [Quit: Leaving]
09:42   -!- roflcopt1 [~armin@base.m2m.pm] has quit [Quit: relate to the matter as i drop the bomb]
09:43   -!- ldnunes [~ldnunes@189.114.111.135] has joined #debian
09:43   -!- ldnunes is "realname" on #debian-offtopic #debian-br #debian
09:43   -!- nagarjung [~nagarjung@14.141.6.170] has quit [Ping timeout: 480 seconds]
09:47   -!- dozer [~rt@195.159.183.42] has quit [Ping timeout: 480 seconds]
09:52   -!- pamaury_ [~pamaury@89.28.146.93] has joined #debian
09:52   -!- pamaury_ is "Amaury Pouly" on #debian #debian-kde #debian-next
09:55   -!- jeremy_ [~jeremy@180.164.156.141] has joined #debian
09:55   -!- jeremy_ is "Jeremy" on #debian
09:56   -!- Eryn_1983_FL [~Eryn_1983@50-89-157-130.res.bhn.net] has quit [Quit: WeeChat 1.0.1]
09:57   -!- Eryn_1983_FL [~Eryn_1983@50-89-157-130.res.bhn.net] has joined #debian
09:57   -!- Eryn_1983_FL is "erin" on #debian
09:57   <jeremy_>   anybody there
09:57   -!- bony [~quassel@183.82.103.58] has joined #debian
09:57   -!- bony is "Bhuvan Krishna" on #freedombox #debian-mentors #debian
09:57   -!- lostatwork [~lostatwor@cpe-24-208-41-139.new.res.rr.com] has joined #debian
09:57   -!- lostatwork is "lostson" on #debian-mate #thevault #debian-offtopic #debian
09:59   -!- yoh [~yoh@washoe.dartmouth.edu] has joined #debian
09:59   -!- yoh is "Yaroslav Halchenko" on #datalad #debian #debian-med #debian-science #neurodebian
10:03   -!- brillenfux [~brillenfu@ip1f11f883.dynamic.kabel-deutschland.de] has quit [Remote host closed the connection]
10:05   -!- jeremy_ [~jeremy@180.164.156.141] has quit [Quit: Leaving]
10:05   -!- yoh [~yoh@washoe.dartmouth.edu] has quit [Remote host closed the connection]
10:09   -!- abferm [~abferm@wsip-72-205-198-77.ks.ks.cox.net] has joined #debian
10:09   -!- abferm is "Alex Ferm" on #debian
10:09   -!- cesox [~cesox@r201-217-136-202.ir-static.anteldata.net.uy] has joined #debian
10:09   -!- cesox is "Leandro Lemos" on #debian-kde #debian
10:12   -!- Volley [~worf@hexen.cgv.tu-graz.ac.at] has quit [Quit: Konversation terminated!]
10:13   -!- famt [~famt@seven.user.oftc.net] has quit [Quit: Leaving]
10:13   -!- rajasekhar_ [~rajasekha@124.123.66.27] has joined #debian
10:13   -!- rajasekhar_ is "Rajasekhar Ponakala" on #debian #debian-in #freedombox #debian-mentors
10:15   -!- Blacker47 [~Blacker47@p2003008E6D4199006145CCA98F1EFF21.dip0.t-ipconnect.de] has joined #debian
10:15   -!- Blacker47 is "Blacker47" on #debian-next #debian
10:20   -!- krabador [~krabador@000208ac.user.oftc.net] has quit [Remote host closed the connection]
10:23   -!- swirl [~swirl@host107-25-static.240-95-b.business.telecomitalia.it] has quit [Remote host closed the connection]
10:23   -!- swirl [~swirl@host107-25-static.240-95-b.business.telecomitalia.it] has joined #debian
10:23   -!- swirl is "swirl" on #debian-qa #debian-kde #debian-forensics #debian
10:23   -!- ldnunes [~ldnunes@189.114.111.135] has quit [Quit: Leaving]
10:24   -!- Me_Myself_and_I [~quassel@195.244.167.210] has quit [Remote host closed the connection]
10:24   -!- dozer [~rt@195.159.183.42] has joined #debian
10:24   -!- dozer is "rt" on @#debian-install #debian
10:27   -!- cesox_ [~cesox@r201-217-136-202.ir-static.anteldata.net.uy] has joined #debian
10:27   -!- cesox_ is "Leandro Lemos" on @#httpd #debian-kde #debian
10:29   -!- swirl [~swirl@host107-25-static.240-95-b.business.telecomitalia.it] has quit [Remote host closed the connection]
10:29   -!- swirl [~swirl@host107-25-static.240-95-b.business.telecomitalia.it] has joined #debian
10:29   -!- swirl is "swirl" on #debian-qa #debian-kde #debian-forensics #debian
10:31   -!- cesox_ [~cesox@r201-217-136-202.ir-static.anteldata.net.uy] has quit []
10:31   -!- cesox__ [~cesox__@r201-217-136-202.ir-static.anteldata.net.uy] has joined #debian
10:31   -!- cesox__ is "Leandro Lemos" on @#httpd #debian-kde #debian
10:31   -!- mrrobot [~mrrobot@179.52.22.240] has joined #debian
10:31   -!- mrrobot is "realname" on #debian
10:33   -!- phunatique [~phunatiqu@p578b8463.dip0.t-ipconnect.de] has quit [Quit: WeeChat 1.6-dev]
10:33   -!- metachr0n [~nobody@46.166.137.214] has quit [Quit: WeeChat 1.5]
10:34   -!- olsren [olsren@89.239.193.52] has quit []
10:34   -!- mrrobot [~mrrobot@179.52.22.240] has quit []
10:35   -!- yoh [~yoh@washoe.dartmouth.edu] has joined #debian
10:35   -!- yoh is "Yaroslav Halchenko" on #datalad #debian #debian-med #debian-science #neurodebian
10:38   -!- pamaury_ [~pamaury@89.28.146.93] has quit [Ping timeout: 480 seconds]
10:39   -!- infinity0 [~infinity0@0001b9ba.user.oftc.net] has quit [Remote host closed the connection]
10:39   -!- cesox [~cesox@r201-217-136-202.ir-static.anteldata.net.uy] has quit [Quit: Konversation terminated!]
10:39   -!- cesox [~cesox__@r201-217-136-202.ir-static.anteldata.net.uy] has joined #debian
10:39   -!- cesox is "Leandro Lemos" on #debian-kde #debian
10:40   -!- cesox__ [~cesox__@r201-217-136-202.ir-static.anteldata.net.uy] has quit [Quit: Konversation terminated!]
10:40   -!- pavlushka [~Pavel@00021abb.user.oftc.net] has joined #debian
10:40   -!- pavlushka is "Pavel Sayekat" on #linode #alioth #debian #debian-mozilla #debian-offtopic #debian-printing #OpenBSD #oftc #debconf16-menzies-9 #debconf16-menzies-12 #debconf16-menzies-10 #debconf
10:42   <lostatwork>    ls
10:48   -!- chele [~chele@00022067.user.oftc.net] has quit [Quit: Leaving]
10:48   -!- renols [olsren@89.239.193.52] has joined #debian
10:48   -!- renols is "renols" on #debian
10:50   -!- Tempesta [~Tempesta@0002028b.user.oftc.net] has quit [Ping timeout: 480 seconds]
10:53   -!- infinity0 [~infinity0@0001b9ba.user.oftc.net] has joined #debian
10:53   -!- infinity0 is "unset" on #debian #debian-mentors #debian-science #debian-rust #debian-mozext #reproducible-summit #reproducible-funding #binary-transparency #reproducible-builds #debian-reproducible #debian-privacy-tools #debian-gnupg #alioth #noisysq #otr #monkeysphere #cryptoparty #nottor #tor-project #tor
10:53   -!- groolot [~groolot@80.82.238.198] has quit [Quit: Quitte]
10:54   -!- Tempesta [~Tempesta@0002028b.user.oftc.net] has joined #debian
10:54   -!- Tempesta is "ChoiKyuSang" on #debian #smuxi
10:54   -!- JohnML [~siducer@ip-84-118-208-205.unity-media.net] has joined #debian
10:54   -!- JohnML is "John Landmesser" on #aptosid #debian-systemd #debian #siduction #siduction-de
10:56   -!- phls_ [~phls@177.16.210.255] has joined #debian
10:56   -!- phls_ is "Paulo Santana" on #debian-publicity #debian-devel-br #debian-mentors #debian-br #debian-l10n-br #debian
10:57   -!- phls_ [~phls@177.16.210.255] has quit []
10:57   -!- phls_ [~phls@177.16.210.255] has joined #debian
10:57   -!- phls_ is "Paulo Santana" on #debian-publicity #debian-devel-br #debian-mentors #debian-br #debian-l10n-br #debian
10:58   -!- wavekidsjp [~wavekidsj@h175-177-077-183.catv02.itscom.jp] has quit [Ping timeout: 480 seconds]
11:00   -!- phls_ [~phls@177.16.210.255] has quit []
11:03   -!- phls [~phls@177.132.23.241] has quit [Ping timeout: 480 seconds]
11:06   -!- phls [~phls@177.16.210.255] has joined #debian
11:06   -!- phls is "Paulo Santana" on #debian-publicity #debian-devel-br #debian-mentors #debian-br #debian-l10n-br #debian
11:06   -!- pheanex [~pheanex@2001-4dd6-b0c4-0-2054-ae95-b68a-acb3.ipv6dyn.netcologne.de] has joined #debian
11:06   -!- pheanex is "purple" on #debian #debian-mentors
11:07   -!- mtn [~mtn@72.168.160.131] has joined #debian
11:07   -!- mtn is "Dan" on #debian
11:07   -!- roflcopter [~armin@base.m2m.pm] has joined #debian
11:07   -!- roflcopter is "bam!" on #virt #ovirt #centos #debian #debian-systemd #debian-next #awesome #suckless
11:08   <petn-randall>  lostatwork: dead.letter Desktop Documents Downloads Music Pictures Templates Videos
11:10   -!- JohnML [~siducer@ip-84-118-208-205.unity-media.net] has quit [Remote host closed the connection]
11:10   -!- thiagz [~nbu@186.206.135.188] has joined #debian
11:10   -!- thiagz is "nbu" on #debian
11:11   -!- JohnML [~siducer@ip-84-118-208-205.unity-media.net] has joined #debian
11:11   -!- JohnML is "John Landmesser" on #aptosid #debian-systemd #debian #siduction #siduction-de
11:11   <FLD>   how come when i execute commands like 'xset s activate' or 'xset dpms force off', the screens go dark like they should, but immediately return back on just like there was some kind of user input (when there actually was not)?
11:12   -!- pavlushka [~Pavel@00021abb.user.oftc.net] has quit [Ping timeout: 480 seconds]
11:13   <petn-randall>  FLD: Shaky mouse?
11:13   <FLD>   nope, i even unplugged my mouse and keyboard
11:14   -!- lids [~lids@0001fd69.user.oftc.net] has quit [Remote host closed the connection]
11:14   -!- deepguy1 [~amnesia@185.65.134.77] has joined #debian
11:14   -!- deepguy1 is "purple" on #debian
11:15   <deepguy1>  hi guys
11:15   <deepguy1>  Where i can find linux-kernel for 4.6.0-0.bpo.1-amd64
11:15   <deepguy1>  I cant find anywhere
11:16   -!- PJain [~PJain@122.161.25.25] has joined #debian
11:16   -!- PJain is "Pranav Jain" on #debian #debian-outreach
11:16   <deepguy1>  Event tried adding test repos
11:16   -!- phls [~phls@177.16.210.255] has quit [Quit: Konversation terminated!]
11:16   -!- PJain [~PJain@122.161.25.25] has quit []
11:16   <bremner>   jessie-backports has 4.7
11:16   <deepguy1>  i need exactly headers for the 4.6.0-0.bpo.1-amd64
11:16   <bremner>   !bpo
11:17   <dpkg>  backports.debian.org (formerly backports.org) is an official repository of <backports> for the current stable (see <jessie backports>) and oldstable (<wheezy backports>) distributions, prepared by Debian developers. Ask me about <backport caveat> and read http://backports.debian.org/Instructions/. See also <bdo kernel> <bdo mirrors> <bdo contents> <bdo list> <bdo bugs> <bdo xorg> <bdo NEW>.
11:17   -!- pavlushka [~Pavel@00021abb.user.oftc.net] has joined #debian
11:17   -!- pavlushka is "Pavel Sayekat" on #debconf #debconf16-menzies-10 #debconf16-menzies-12 #debconf16-menzies-9 #oftc #OpenBSD #debian-printing #debian-offtopic #debian-mozilla #debian #alioth #linode
11:17   <bremner>   that sounds like an unsupported case, but you can look at snapshots.debian.org
11:17   -!- abferm [~abferm@wsip-72-205-198-77.ks.ks.cox.net] has quit [Quit: Ex-Chat]
11:19   <deepguy1>  meh
11:19   <deepguy1>  deleted there too
11:20   <deepguy1>  strange
11:20   -!- bi0 [~bxkzxi@80.80.164.60] has joined #debian
11:20   -!- bi0 is "rage" on #debian
11:21   -!- bi0 [~bxkzxi@80.80.164.60] has quit []
11:21   <deepguy1>  gotta dig on changing kernel in iso image then
11:24   -!- mohae [~quassel@c-98-227-35-38.hsd1.il.comcast.net] has joined #debian
11:24   -!- mohae is "joel" on #debian
11:24   -!- AzaToth [~azatoth@h87-96-232-219.cust.se.alltele.net] has joined #debian
11:24   -!- AzaToth is "Carl Fürstenberg" on #debian-perl #debian-mentors #debian
11:25   <missmbob>  that's...really not so easy anymore. it used to be
11:26   <missmbob>  anyway, why?
11:26   -!- fmmarques [~fmmarques@di18.pub.di.fct.unl.pt] has joined #debian
11:26   -!- fmmarques is "fmmarques" on #debian-kde #debian
11:26   <deepguy1>  I have livecd
11:26   <deepguy1>  usb
11:27   <deepguy1>  i need to install there virtualbox
11:27   <deepguy1>  so i need kernel files
11:28   <deepguy1>  by phrase "install there virtual box" i mean booting up and installing there virtualbox.deb installer and running files from persistent
11:31   <blast007>  http://snapshot.debian.org/binary/linux-headers-4.6.0-0.bpo.1-amd64/
11:32   <deepguy1>  there is just links to download newer versions
11:32   -!- derfel_ [~derfel@2001:1418:100:84af:188a:a042:9eb:1b32] has quit [Ping timeout: 480 seconds]
11:32   <bremner>   no, I think you're confused between package name and version
11:32   -!- GreatAttitude [~great@178-175-128-50.static.host] has quit [Remote host closed the connection]
11:33   <bremner>   4.6.0-0 is the API, not the version
11:33   <deepguy1>  oh i got it
11:33   <deepguy1>  thanks a lot
11:34   <deepguy1>  you saved my time :)
11:35   -!- ach [~spo@ip-109-43-3-36.web.vodafone.de] has quit [Ping timeout: 480 seconds]
11:39   -!- kritzefitz [~kritzefit@ip5b407dd4.dynamic.kabel-deutschland.de] has joined #debian
11:39   -!- kritzefitz is "realname" on #debconf #debian-haskell #debian-next #debian
11:39   -!- narcan [~narcan@176-57-33-240.as16211.net] has quit [Quit: Leaving]
11:40   -!- paxmark9 [~paxtormar@199.167.137.205] has joined #debian
11:40   -!- paxmark9 is "siducer693" on #debian-live #kvm #debian-boot #debian-systemd #debian #vsido #siduction #debian-next
11:40   -!- tdy1 [~tdy@mobile-130-126-255-24.near.illinois.edu] has joined #debian
11:40   -!- tdy1 is "tdy" on #debian #awesome
11:41   -!- tdy [~tdy@00016994.user.oftc.net] has quit [Ping timeout: 480 seconds]
11:41   -!- hele_ [~hele@91-159-249-16.elisa-laajakaista.fi] has joined #debian
11:41   -!- hele_ is "hele" on #debian-next #debian-kde #debian
11:42   -!- nilez [~nilez@ec2-52-37-170-77.us-west-2.compute.amazonaws.com] has quit [Ping timeout: 480 seconds]
11:43   -!- derfel_ [~derfel@78-134-24-204.v4.ngi.it] has joined #debian
11:43   -!- derfel_ is "derfel" on #debian
11:44   -!- jathan [~jathan@132.248.174.116] has joined #debian
11:44   -!- jathan is "jathan" on #debian-l10n-spanish #debian-kbsd #debian-i18n #debian-fr #debian-es #debian-android-tools #debian #debconf-video #debconf-infra @#debconf-heidelberg @#debconf-berlinlondon @#debconf-amsterdam #debconf18-taiwan #debconf17-montreal #debconf16-menzies-9 #debconf16-menzies-12 #debconf16-menzies-10 #debconf16-capetown #debconf15-germany #debconf12-nicaragua #debconf
11:44   -!- Esteban__ [~Esteban@203-59-75-31.perm.iinet.net.au] has joined #debian
11:44   -!- Esteban__ is "Esteban" on #debian
11:45   -!- maestro [~alumno@181.118.139.133] has joined #debian
11:45   -!- maestro is "Alumno" on #debian
11:45   <maestro>   hola...
11:46   <maestro>   buscaba informacion acerca de huayra
11:46   -!- Esteban_ [~Esteban@203-59-75-31.perm.iinet.net.au] has quit [Ping timeout: 480 seconds]
11:47   <maestro>   hola
11:47   -!- maestro [~alumno@181.118.139.133] has quit []
11:49   -!- desert [~desert@212-129-33-61.freevpn.me] has joined #debian
11:49   -!- desert is "Desert" on #debian
11:50   -!- ixti [~ixti@167.red-83-49-50.dynamicip.rima-tde.net] has joined #debian
11:50   -!- ixti is "ixti" on #debian
11:50   -!- pavlushka [~Pavel@00021abb.user.oftc.net] has quit [Ping timeout: 480 seconds]
11:52   <desert>    my audio isen't working, and i can't figure out why, iv checked synaptic and i should have what i need but i can't hear a thing
11:52   <mtn>   desert: Use pavucontrol. Check sound levels and devices in Output and Configuration tabs.
11:54   <desert>    oh.. "audio software included, volume control not included.." guess i diden't look to closely at the fine print that came with my debian ISO
11:56   <desert>    why is there 2 software packages for audio? why not just have one package that has everything you need?
11:56   -!- metachr0n [~nobody@46.166.137.202] has joined #debian
11:56   -!- metachr0n is "Jack Screw" on #C #debian-hurd #debian-bugs #debian #awesome
11:58   -!- nilez [~nilez@ec2-52-37-170-77.us-west-2.compute.amazonaws.com] has joined #debian
11:58   -!- nilez is "..." on #powerdns #awesome #osm #tor-project #debian-mentors #qemu #ceph #linode #tor #debian
11:58   -!- Guest1965 [~Corey84@wsip-70-175-229-132.dc.dc.cox.net] has quit [Remote host closed the connection]
11:58   -!- ixti [~ixti@167.red-83-49-50.dynamicip.rima-tde.net] has quit [Read error: No route to host]
11:59   -!- pavlushka [~Pavel@00021abb.user.oftc.net] has joined #debian
11:59   -!- pavlushka is "Pavel Sayekat" on #debconf #debconf16-menzies-10 #debconf16-menzies-12 #debconf16-menzies-9 #oftc #OpenBSD #debian-printing #debian-offtopic #debian-mozilla #debian #alioth #linode
12:03   -!- swirl [~swirl@host107-25-static.240-95-b.business.telecomitalia.it] has quit [Ping timeout: 480 seconds]
12:04   -!- paxmark9 [~paxtormar@199.167.137.205] has quit [Quit: Leaving]
12:04   -!- desert [~desert@212-129-33-61.freevpn.me] has quit [Quit: Leaving]
12:05   -!- krymzon [~krymzon@11.40.150.83.ftth.as8758.net] has quit [Remote host closed the connection]
12:05   -!- thiagz [~nbu@186.206.135.188] has quit [Ping timeout: 480 seconds]
12:08   -!- oyster [~oysteron_@89.10.131.128] has joined #debian
12:08   -!- oyster is "realname" on #debian #ubuntu
12:09   -!- TomasCZ [~TomasCZ@yes.tenlab.net] has joined #debian
12:09   -!- TomasCZ is "Unknown" on #ooni #debian-mentors #tor @#tenlab #linode #debian-next #debian #ceph
12:09   -!- isaagar [~quassel@210.7.64.2] has quit [Remote host closed the connection]
12:10   -!- john [~john@dslb-188-105-125-184.188.105.pools.vodafone-ip.de] has joined #debian
12:10   -!- john is "möp" on #debian-kde #debian
12:13   -!- john [~john@dslb-188-105-125-184.188.105.pools.vodafone-ip.de] has quit []
12:15   -!- rajasekhar_ [~rajasekha@124.123.66.27] has quit [Quit: Leaving]
12:15   -!- Tubber [~Tubber@cpe24374c0b0708.cm.vejen-net.dk] has quit [Remote host closed the connection]
12:16   -!- mephi [~mephi@cli-nw.77.189.helios-nw.ru] has joined #debian
12:16   -!- mephi is "mephi" on #debian-kde #debian
12:17   -!- dtcrshr [~datacrush@0001af91.user.oftc.net] has joined #debian
12:17   -!- dtcrshr is "data crusher" on #brasil-underground #pax #debian #observium #area31
12:18   -!- tdy1 is now known as tdy
12:21   -!- somiaj [~jaimos@0001c892.user.oftc.net] has quit [Quit: leaving]
12:21   -!- somiaj [~jaimos@0001c892.user.oftc.net] has joined #debian
12:21   -!- somiaj is "Jaimos F Skriletz" on #debian-ops #debian-next #debian
12:21   -!- Q-Master^Work [~q-master@217.175.38.170] has quit [Ping timeout: 480 seconds]
12:22   -!- mythos [~mythos@85-124-64-143.static.upcbusiness.at] has quit [Ping timeout: 480 seconds]
12:23   -!- calher [~calher@2602:306:36de:9cc0:189b:2203:7138:a634] has quit [Remote host closed the connection]
12:24   -!- pavlushka [~Pavel@00021abb.user.oftc.net] has quit [Remote host closed the connection]
12:24   -!- tuxampol [~Mylin@2001:a61:429d:db01:223:cdff:fec0:bb2f] has joined #debian
12:24   -!- tuxampol is "Quasi" on #quodlibet #debian
12:24   -!- thiagz [~nbu@186.206.135.188] has joined #debian
12:24   -!- thiagz is "nbu" on #debian
12:28   -!- oyster [~oysteron_@89.10.131.128] has quit [Quit: Leaving]
12:30   -!- metachr0n [~nobody@46.166.137.202] has quit [Ping timeout: 480 seconds]
12:32   -!- pavlushka [~Pavel@00021abb.user.oftc.net] has joined #debian
12:32   -!- pavlushka is "Pavel Sayekat" on #linode #alioth #debian #debian-mozilla #debian-offtopic #debian-printing #OpenBSD #oftc #debconf16-menzies-9 #debconf16-menzies-12 #debconf16-menzies-10 #debconf
12:33   -!- mjampala [~mjampala@208.146.43.5] has quit [Ping timeout: 480 seconds]
12:34   -!- pavlushka [~Pavel@00021abb.user.oftc.net] has quit []
12:34   -!- pavlushka [~Pavel@00021abb.user.oftc.net] has joined #debian
12:34   -!- pavlushka is "Pavel Sayekat" on #linode #alioth #debian #debian-mozilla #debian-offtopic #debian-printing #OpenBSD #oftc #debconf16-menzies-9 #debconf16-menzies-12 #debconf16-menzies-10 #debconf
12:36   -!- bill-auger [~quassel@75-138-187-221.dhcp.oxfr.ma.charter.com] has joined #debian
12:36   -!- bill-auger is "bill-auger,,," on #debconf-video #debian-voip #debian-next #debian #debian-reproducible #freedombox #debconf #fish #debian-mozilla @#av-caster #oftc
12:37   -!- vortek [~kvirc@50-79-126-213-static.hfc.comcastbusiness.net] has quit [Ping timeout: 480 seconds]
12:37   -!- derfel__ [~derfel@2001:1418:100:84af:ec74:5086:1825:c7bc] has joined #debian
12:37   -!- derfel__ is "derfel" on #debian
12:37   -!- zathras [~Zzzzzzzzz@62-251-21-6.ip.xs4all.nl] has quit [Ping timeout: 480 seconds]
12:37   -!- Volley [~worf@80-109-200-187.cable.dynamic.surfer.at] has joined #debian
12:37   -!- Volley is "Wolfgang Scheicher" on #virt #debian-mentors #debian-live #debian-kde #debian-next #debian
12:40   -!- mason1 [~Kyso_@178.175.128.50] has joined #debian
12:40   -!- mason1 is "Moriarty" on #debian
12:41   -!- mjampala [~mjampala@208.146.43.5] has joined #debian
12:41   -!- mjampala is "Mukund Jampala" on #debian #debian-next
12:44   -!- derfel_ [~derfel@78-134-24-204.v4.ngi.it] has quit [Ping timeout: 480 seconds]
12:44   -!- cruncher [~cruncher@00020ba0.user.oftc.net] has quit [Read error: Connection reset by peer]
12:47   -!- ao2 [~ao2@cl-35.trn-01.it.sixxs.net] has quit [Quit: Leaving]
12:48   -!- debalance [~debalance@aftr-88-153-7-155.unity-media.net] has joined #debian
12:48   -!- debalance is "Philipp Huebner" on #debian-devel-changes #debian-edu #debian-cd #debian
12:49   -!- bluca [~lboccass@212.44.21.120.ip.redstone-isp.net] has quit [Quit: Leaving.]
12:50   -!- derfel__ [~derfel@2001:1418:100:84af:ec74:5086:1825:c7bc] has quit [Ping timeout: 480 seconds]
12:50   -!- oalvarez [~alvarezp@2806:220:2:4:d307:486a:3563:beab] has joined #debian
12:50   -!- oalvarez is "Octavio Alvarez" on #gusolmexico #frab #debian-mx #debian-mentors-es #debian-mentors #debian-ipv6 #debian-es #debian-devel-es #debian
12:50   -!- oalvarez [~alvarezp@2806:220:2:4:d307:486a:3563:beab] has quit [Remote host closed the connection]
12:50   -!- skitt [~skitt@skitt.user.oftc.net] has quit [Quit: Leaving]
12:51   -!- jmux [~jmux@lhm246.muenchen.de] has quit [Quit: Konversation terminated!]
12:51   -!- ecc [~ecc@0001b877.user.oftc.net] has quit [Quit: ecc]
12:53   -!- mythos [~mythos@80-109-225-139.cable.dynamic.surfer.at] has joined #debian
12:53   -!- mythos is "mythos" on #debian #debian-gnome #debian-offtopic
12:54   <jhutchins> desrt: Because it's Linux, and there's always more than one way.
12:54   -!- pdo_fn14 [~Guess@125.165.130.209] has joined #debian
12:54   -!- pdo_fn14 is "realname" on #debian
12:55   -!- calher [~calher@2602:306:36de:9cc0:5551:dbe9:3f8f:ab83] has joined #debian
12:55   -!- calher is "realname" on #debian
12:56   -!- mephi [~mephi@cli-nw.77.189.helios-nw.ru] has quit [Quit: Konversation terminated!]
12:56   <pdo_fn14>  Hello, error with icedtea now. http://paste.debian.net/873036/
12:56   -!- PJain [~PJain@122.161.25.25] has joined #debian
12:56   -!- PJain is "Pranav Jain" on #debian #debian-outreach
12:57   -!- PJain [~PJain@122.161.25.25] has quit []
12:57   <lindi->    pdo_fn14: libreoffice crashes?
12:58   -!- mode/#debian [+l 742] by debhelper
12:58   <pdo_fn14>  lindi-: Yo.
12:58   <lindi->    pdo_fn14: that can be very tricky to track down :(
12:59   <lindi->    pdo_fn14: does it happen every time?
12:59   <pdo_fn14>  lindi-: I dunno, no backport on my system with only chrome and wine repo.
12:59   -!- sealsniper [~sealsnipe@181.213.44.125] has joined #debian
12:59   -!- sealsniper is "fedora" on #debian
12:59   -!- sealsniper [~sealsnipe@181.213.44.125] has quit []
13:00   <lindi->    pdo_fn14: ok, if you can figure out how to make it crash then you should consider reporting the bug
13:00   <lindi->    pdo_fn14: if it happened just once then I'm afraid it's not really fixable
13:01   <pdo_fn14>  lindi-: My LO sometime crash when editing heavy document. (like using undo repeatly)
13:01   -!- derfel__ [~derfel@5-157-127-56.v4.ngi.it] has joined #debian
13:01   -!- derfel__ is "derfel" on #debian
13:01   -!- mtn [~mtn@72.168.160.131] has quit [Quit: Konversation terminated!]
13:01   -!- Discovery [~Discovery@109.235.52.8] has joined #debian
13:01   -!- Discovery is "IlNominePatre" on #qemu #awesome #nottor #debian-next #ceph #osm #debian-mentors #tor #linode #debian
13:02   -!- pamaury_ [~pamaury@89.28.146.93] has joined #debian
13:02   -!- pamaury_ is "Amaury Pouly" on #debian #debian-kde #debian-next
13:03   -!- jepler [~jepler@afk.unpythonic.net] has quit [Quit: brb]
13:03   -!- ol [~quassel@2406:e006:db1:1:8e89:a5ff:feca:57fe] has joined #debian
13:03   -!- ol is "Ol" on #debian
13:04   -!- Madatnek [~adamd@c-fba7db54.046-15-7673745.cust.bredbandsbolaget.se] has quit [Ping timeout: 480 seconds]
13:05   <pdo_fn14>  lindi-: extensions can make this happen?.
13:06   <pdo_fn14>  I've 4 extensions. (2 are outdated.)
13:07   <pdo_fn14>  lindi-:correctly (maybe), this glitch caused by smart art old addons.
13:08   <pdo_fn14>  look here: 7f2224020000-7f2224022000 r--s 00027000 08:01 940598 /home/pdofn14/.config/libreoffice/4/user/uno_packages/cache/uno_packages/lu6fjrn7.tmp_/smart_0.9.4_en_hu_corrected.oxt/SmART.jar
13:10   -!- mason1 [~Kyso_@178.175.128.50] has quit []
13:10   -!- dedeibel [~dedeibel@p200300752F603A00BEAEC5FFFE2EBDD8.dip0.t-ipconnect.de] has joined #debian
13:10   -!- dedeibel is "Benjamin Peter" on #debian-offtopic #debian
13:13   -!- Out`Of`Control [~Viper@000192c2.user.oftc.net] has quit [Remote host closed the connection]
13:13   -!- pavlushka [~Pavel@00021abb.user.oftc.net] has quit [Ping timeout: 480 seconds]
13:16   -!- debalance [~debalance@00017b9a.user.oftc.net] has quit [Remote host closed the connection]
13:16   -!- jose [~jose@83.33.17.66] has joined #debian
13:16   -!- jose is "jose" on #debian-kde #debian
13:17   -!- jose [~jose@83.33.17.66] has quit []
13:18   <lindi->    pdo_fn14: impossible to say
13:22   -!- famt [~famt@seven.user.oftc.net] has joined #debian
13:22   -!- famt is "Fabio A. De Muzio Tobich" on #debian-offtopic #debian-next #debian-br #debian
13:23   <pdo_fn14>  lindi-: dunno too bro, seems try to swtich user with clean lo extensions, but so lazy now.
13:23   <pdo_fn14>  bye!.
13:23   -!- aya_ [~aya@173-160-199-147-Washington.hfc.comcastbusiness.net] has joined #debian
13:23   -!- aya_ is "Aya Shameimaru" on #debian-kde #debian
13:23   -!- pdo_fn14 [~Guess@125.165.130.209] has quit [Quit: Leaving]
13:24   -!- aya_ [~aya@173-160-199-147-Washington.hfc.comcastbusiness.net] has quit []
13:24   -!- Linked [~Chained@p4FC13BAF.dip0.t-ipconnect.de] has joined #debian
13:24   -!- Linked is "realname" on #debian
13:24   -!- vlad1777d [~vlad@46.98.218.93] has joined #debian
13:24   -!- vlad1777d is "realname" on #debian-hurd #debian-cinnamon #debian-next #debian
13:25   -!- phdeswer [~phdeswer@91-159-55-220.elisa-laajakaista.fi] has joined #debian
13:25   -!- phdeswer is "Philippe De Swert" on #debian #emdebian #debian-arm
13:26   -!- kritzefitz [~kritzefit@ip5b407dd4.dynamic.kabel-deutschland.de] has quit [Ping timeout: 480 seconds]
13:27   -!- metachr0n [~nobody@46.166.190.143] has joined #debian
13:27   -!- metachr0n is "Jack Screw" on #C #debian-hurd #debian-bugs #debian #awesome
13:27   -!- ceibal [~ceibal@r167-60-246-216.dialup.adsl.anteldata.net.uy] has joined #debian
13:27   -!- ceibal is "Facundo.G" on #debian
13:27   -!- ceibal [~ceibal@r167-60-246-216.dialup.adsl.anteldata.net.uy] has quit []
13:30   -!- xsmltx [~xsmltx@0134101987.0.fullrate.ninja] has joined #debian
13:30   -!- xsmltx is "xsmltx" on #debian
13:32   -!- pamaury_ [~pamaury@89.28.146.93] has quit [Ping timeout: 480 seconds]
13:32   -!- GreatAttitude [~great@46.166.148.142] has joined #debian
13:32   -!- GreatAttitude is "Great Attitude" on #debian-offtopic #debian #nottor #tor
13:34   <xsmltx>    Hi, tell me please is it possible to use only Openbox with no other environment and to change the screen/display/desktop between it and another device connected through VGA to the Openbox machine? Thank you.
13:34   -!- ecc [~ecc@0001b877.user.oftc.net] has joined #debian
13:34   -!- ecc is "ecc" on #oftc #debian-next #debian-mentors #debian-arm #debian
13:35   -!- ldnunes [~ldnunes@187.23.155.147] has joined #debian
13:35   -!- ldnunes is "realname" on #debian-offtopic #debian-br #debian
13:37   -!- towo` [~towo@00012f0f.user.oftc.net] has joined #debian
13:37   -!- towo` is "Torsten -towo- Wohlfarth" on #siduction-admin #siduction-dev #siduction-de #siduction #debian-offtopic #debian-next #debian #aptosid
13:38   -!- itd [~itd@0002249b.user.oftc.net] has quit [Quit: ]
13:38   -!- dedeibel [~dedeibel@p200300752F603A00BEAEC5FFFE2EBDD8.dip0.t-ipconnect.de] has quit [Ping timeout: 480 seconds]
13:39   -!- Esokra [~user@194-118-61-246.adsl.highway.telekom.at] has joined #debian
13:39   -!- Esokra is "Esokra" on #debian-kde #debian
13:39   -!- Esokra [~user@194-118-61-246.adsl.highway.telekom.at] has quit []
13:45   -!- ansel [~ansel@2003:5b:203b:100:6af7:28ff:fe06:801] has quit [Ping timeout: 480 seconds]
13:46   -!- xsmltx [~xsmltx@0134101987.0.fullrate.ninja] has quit [Quit: Regards]
13:48   -!- alimj [~quassel@00021a2a.user.oftc.net] has joined #debian
13:48   -!- alimj is "Ali Mirjamali" on #debian #nottor #tor
13:48   -!- alimj [~quassel@00021a2a.user.oftc.net] has quit [Remote host closed the connection]
13:48   -!- kritzefitz [~kritzefit@ip5b407dd4.dynamic.kabel-deutschland.de] has joined #debian
13:48   -!- kritzefitz is "realname" on #debian #debian-next #debian-haskell #debconf
13:52   -!- tdy [~tdy@00016994.user.oftc.net] has quit [Ping timeout: 480 seconds]
13:53   -!- pavlushka [~Pavel@00021abb.user.oftc.net] has joined #debian
13:53   -!- pavlushka is "Pavel Sayekat" on #linode #alioth #debian #debian-mozilla #debian-offtopic #debian-printing #OpenBSD #oftc #debconf16-menzies-9 #debconf16-menzies-12 #debconf16-menzies-10 #debconf
13:53   -!- pencilandpaper [~penciland@dynamic-acs-24-239-230-203.zoominternet.net] has joined #debian
13:53   -!- pencilandpaper is "pencilandpaper" on #debian-offtopic #debian-next #debian
13:54   -!- Human [~Human_G33@62.147.242.8] has quit [Quit: Quitte]
13:54   -!- anonymous [~anonymous@194-208-141-041.tele.net] has joined #debian
13:54   -!- anonymous is "anonymous" on #debian
13:55   -!- anonymous [~anonymous@194-208-141-041.tele.net] has quit []
13:55   -!- metachr0n [~nobody@46.166.190.143] has quit [Quit: WeeChat 1.5]
13:55   -!- metachr0n [~nobody@46.166.188.247] has joined #debian
13:55   -!- metachr0n is "Jack Screw" on #C #debian-hurd #debian-bugs #debian #awesome
13:56   -!- metachr0n [~nobody@46.166.188.247] has quit []
13:56   -!- metachr0n [~nobody@46.166.186.211] has joined #debian
13:56   -!- metachr0n is "Jack Screw" on #C #debian-hurd #debian-bugs #debian #awesome
13:57   -!- nowhereman [~pierre@90.126.98.18] has quit [Ping timeout: 480 seconds]
13:59   -!- blackcat [~blackcat@thor.ipbrick.com] has left #debian [Leaving]
14:01   -!- metachr0n [~nobody@46.166.186.211] has quit []
14:01   -!- tdy [~tdy@00016994.user.oftc.net] has joined #debian
14:01   -!- tdy is "tdy" on #debian #awesome
14:01   -!- faw [~faw@faw.user.oftc.net] has joined #debian
14:01   -!- faw is "Felipe Augusto van de Wiel" on @#funlabs #debian-www #debian-qa #debian-mirrors #debian-mentors #debian-l10n-br #debian-i18n #debian-devel-br #debian-bugs #debian-apt #debian #debconf @#cathedral
14:03   -!- kritzefitz [~kritzefit@ip5b407dd4.dynamic.kabel-deutschland.de] has quit [Remote host closed the connection]
14:07   -!- cruncher [~cruncher@00020ba0.user.oftc.net] has joined #debian
14:07   -!- cruncher is "cruncher" on #debian-next #debian #debian-devel-changes
14:08   -!- pavlushka [~Pavel@00021abb.user.oftc.net] has quit [Quit: See you on the other side...]
14:08   -!- pavlushka [~Pavel@00021abb.user.oftc.net] has joined #debian
14:08   -!- pavlushka is "Pavel Sayekat" on #linode #alioth #debian #debian-mozilla #debian-offtopic #debian-printing #OpenBSD #oftc #debconf16-menzies-9 #debconf16-menzies-12 #debconf16-menzies-10 #debconf
14:09   -!- grepper [~grepper@dhcp-108-168-40-171.cable.user.start.ca] has quit [Quit: ZNC - http://znc.in]
14:10   -!- pavlushka [~Pavel@00021abb.user.oftc.net] has quit [Max SendQ exceeded]
14:10   -!- grepper [~grepper@dhcp-108-168-40-171.cable.user.start.ca] has joined #debian
14:10   -!- grepper is "Robert" on #debian-next #debian
14:11   -!- pavlushka [~Pavel@00021abb.user.oftc.net] has joined #debian
14:11   -!- pavlushka is "Pavel Sayekat" on #debconf #debconf16-menzies-10 #debconf16-menzies-12 #debconf16-menzies-9 #oftc #OpenBSD #debian-printing #debian-offtopic #debian-mozilla #debian #alioth #linode
14:11   -!- pavlushka [~Pavel@00021abb.user.oftc.net] has quit [Max SendQ exceeded]
14:11   -!- pavlushka is "Pavel Sayekat" on #debconf #debconf16-menzies-10 #debconf16-menzies-12 #debconf16-menzies-9 #oftc #OpenBSD #debian-printing #debian-offtopic #debian-mozilla #debian #alioth #linode
14:11   -!- pavlushka [~Pavel@00021abb.user.oftc.net] has joined #debian
14:14   -!- pamaury [~pamaury@89.28.146.93] has joined #debian
14:14   -!- pamaury is "Amaury Pouly" on #debian #debian-kde #debian-next
14:14   -!- cmacq2 [~cmacq2@g194109.upc-g.chello.nl] has joined #debian
14:14   -!- cmacq2 is "Johan Ouwerkerk" on #debian-next #debian-kde #debian
14:15   -!- tuxampol [~Mylin@2001:a61:429d:db01:223:cdff:fec0:bb2f] has quit [Quit: Verlassend]
14:15   -!- swirl [~swirl@host251-137-dynamic.21-87-r.retail.telecomitalia.it] has joined #debian
14:15   -!- swirl is "swirl" on #debian-qa #debian-kde #debian-forensics #debian
14:16   -!- bradfa [~andrew@clr-vpn01.kodakalaris.com] has quit [Quit: leaving]
14:17   -!- Human_G33k [~Human_G33@62.147.242.8] has joined #debian
14:17   -!- Human_G33k is "Human_G33k" on #linux-nfs #debian-next #debian-fr #debian-fedmsg #debian-devel-changes #debian
14:18   -!- bradfa [~andrew@clr-vpn01.kodakalaris.com] has joined #debian
14:18   -!- bradfa is "Andrew Bradford" on #debian-next #debian
14:19   -!- deepguy1 [~amnesia@185.65.134.77] has quit [Quit: Leaving.]
14:20   -!- pavlushka [~Pavel@00021abb.user.oftc.net] has quit [Quit: See you on the other side...]
14:22   -!- bradfa [~andrew@clr-vpn01.kodakalaris.com] has quit []
14:22   -!- bradfa [~andrew@clr-vpn01.kodakalaris.com] has joined #debian
14:22   -!- bradfa is "Andrew Bradford" on #debian-next #debian
14:24   -!- bounce [~bounce@2602:306:ccba:570:9c9d:1000:114d:9787] has joined #debian
14:24   -!- bounce is "bounce" on #debian #https-everywhere #freedombox
14:26   -!- daizklee [~smuxi@2a02:582:804e:ed00:f8c4:444f:a003:b92e] has joined #debian
14:26   -!- daizklee is "adzile" on #debian #smuxi
14:26   -!- daizklee [~smuxi@2a02:582:804e:ed00:f8c4:444f:a003:b92e] has quit [Remote host closed the connection]
14:27   -!- t [~vyasa@c-73-241-203-56.hsd1.ca.comcast.net] has joined #debian
14:27   -!- t is "t" on #debian
14:35   -!- astronut [~astronut@verne.dlgeek.net] has left #debian []
14:35   -!- jathan [~jathan@132.248.174.116] has quit [Quit: Saliendo]
14:37   -!- kritzefitz [~kritzefit@ip5b407dd4.dynamic.kabel-deutschland.de] has joined #debian
14:37   -!- kritzefitz is "realname" on #debconf #debian-haskell #debian-next #debian
14:41   -!- demetris [~smuxi@213.140.200.188] has joined #debian
14:41   -!- demetris is "Demetris" on #debian #smuxi
14:45   -!- tjure [~thomas@cpc92320-cmbg19-2-0-cust3547.5-4.cable.virginm.net] has joined #debian
14:45   -!- tjure is "Thomas Pircher" on #debian-kde #debian
14:47   -!- marijnfs [~smuxi@77.47.67.78.dynamic.cablesurf.de] has joined #debian
14:47   -!- marijnfs is "Your Name" on #debian #smuxi
14:48   -!- mode/#debian [+l 748] by debhelper
14:48   -!- joker [~mason@164.58.176.133] has joined #debian
14:48   -!- joker is "james" on #debian
14:53   -!- joker [~mason@164.58.176.133] has quit [Quit: Leaving]
14:54   -!- hele_ [~hele@91-159-249-16.elisa-laajakaista.fi] has quit [Quit: Konversation terminated!]
14:55   -!- vortek [~kvirc@50-79-126-213-static.hfc.comcastbusiness.net] has joined #debian
14:55   -!- vortek is "Fuckoff ;)" on #debian @#uberelite
14:58   -!- AlexLikeRock [~AlexLikeR@0001b9bd.user.oftc.net] has joined #debian
14:58   -!- AlexLikeRock is "AlexLikeRock" on #debian-es #debian
14:58   -!- jstein [~quassel@xdsl-213-196-242-144.netcologne.de] has joined #debian
14:58   -!- jstein is "Jonas Stein" on #smxi #osm-de @#mint @#fsfe #debian-mentors #debian #kernelnewbies
14:58   -!- benages [~smuxi@90.71.225.53] has quit [Ping timeout: 480 seconds]
15:03   -!- Volley [~worf@80-109-200-187.cable.dynamic.surfer.at] has quit [Quit: Konversation terminated!]
15:04   -!- swirl_ [~swirl@host251-137-dynamic.21-87-r.retail.telecomitalia.it] has joined #debian
15:04   -!- swirl_ is "swirl" on #debian-qa #debian-kde #debian-forensics #debian
15:04   -!- swirl [~swirl@host251-137-dynamic.21-87-r.retail.telecomitalia.it] has quit [Read error: Connection reset by peer]
15:05   -!- mtn [~mtn@72.168.160.131] has joined #debian
15:05   -!- mtn is "Dan" on #debian
15:06   -!- pencilandpaper [~penciland@dynamic-acs-24-239-230-203.zoominternet.net] has quit [Quit: WeeChat 1.6-dev]
15:06   -!- rajasekhar [~rajasekha@124.123.66.27] has joined #debian
15:06   -!- rajasekhar is "Rajasekhar Ponakala" on #debian
15:07   -!- Nyctophilia [~IamHereFo@0001fd4b.user.oftc.net] has joined #debian
15:07   -!- Nyctophilia is "nope.avi" on #debian
15:07   -!- tdy [~tdy@00016994.user.oftc.net] has quit [Ping timeout: 480 seconds]
15:08   -!- ansel [~ansel@tmo-101-17.customers.d1-online.com] has joined #debian
15:08   -!- ansel is "Andreas Seltenreich" on #debian
15:08   -!- andreasj [~andreasj@dyndsl-091-096-219-150.ewe-ip-backbone.de] has joined #debian
15:08   -!- andreasj is "Andreas Janssen" on #debian-next #debian
15:09   -!- d_himro [~none@178.124.154.80] has joined #debian
15:09   -!- d_himro is "Dim Himro" on #debian
15:10   -!- real007 [~terminato@81.61.143.173.dyn.user.ono.com] has joined #debian
15:10   -!- real007 is "realname" on #debian #freebsd #linux #irssi
15:10   -!- d_himro [~none@178.124.154.80] has quit [Read error: Connection reset by peer]
15:10   -!- d_himro [~none@178.124.154.80] has joined #debian
15:10   -!- d_himro is "Dim Himro" on #debian
15:12   -!- CEP-2015-Jessie [~cep2015@181.93.22.100] has joined #debian
15:12   -!- CEP-2015-Jessie is "realname" on @#debian-live-ar #debian-live #debian-bluetooth #oftc #debian-ar #debian #debian-es
15:12   -!- d_himro [~none@178.124.154.80] has quit [Read error: Connection reset by peer]
15:13   -!- d_himro_ [~none@178.124.154.80] has joined #debian
15:13   -!- d_himro_ is "Dim Himro" on #debian
15:13   -!- d_himro_ [~none@178.124.154.80] has quit [Remote host closed the connection]
15:14   -!- Valvalion [~Valvalion@187.104-201-80.adsl-dyn.isp.belgacom.be] has joined #debian
15:14   -!- Valvalion is "Valvalion" on #debian
15:14   -!- d_himro [~none@178.124.154.80] has joined #debian
15:14   -!- d_himro is "Dim Himro" on #debian
15:15   -!- benages [~smuxi@90.71.225.53] has joined #debian
15:15   -!- benages is "Your Name" on #debian #debian-next #debian-es #smuxi
15:15   <jhutchins> xshuiniu: Most systems don't have VGA in.
15:15   -!- KaiserAres [~KaiserAre@00021968.user.oftc.net] has joined #debian
15:15   -!- KaiserAres is "KaiserAres" on #debian #tor-project #nottor
15:15   <jhutchins> xshuiniu: Most only have video outputs.
15:15   -!- Airwave [~Airwave@0001a5d2.user.oftc.net] has quit [Quit: Bye]
15:15   <jhutchins> xshuiniu: Sorry, xsmltx is gone.
15:16   -!- mots [~mots@mail2.ep-group.ch] has quit [Quit: Leaving]
15:16   -!- Airwave [~Airwave@20.195.9.46.customer.cdi.no] has joined #debian
15:16   -!- Airwave is "Airwave" on #pentadactyl #debian-offtopic #debian #suckless #awesome
15:16   -!- mots [~mots@178-82-187-178.dynamic.hispeed.ch] has joined #debian
15:16   -!- mots is "realname" on #debian #ovirt
15:17   -!- thiagz [~nbu@186.206.135.188] has quit [Ping timeout: 480 seconds]
15:18   -!- mode/#debian [+l 756] by debhelper
15:18   -!- andreasj [~andreasj@dyndsl-091-096-219-150.ewe-ip-backbone.de] has quit [Quit: Konversation terminated!]
15:18   -!- andreasj [~andreasj@dyndsl-091-096-219-150.ewe-ip-backbone.de] has joined #debian
15:18   -!- andreasj is "Andreas Janssen" on #debian-next #debian
15:19   -!- tdy [~tdy@00016994.user.oftc.net] has joined #debian
15:19   -!- tdy is "tdy" on #debian #awesome
15:20   -!- mlundblad [~marcus@c-20d771d5.014-990-7570702.cust.bredbandsbolaget.se] has joined #debian
15:20   -!- mlundblad is "marcus" on #debian #debian-gnome #OSM.se #josm
15:21   -!- d_himro [~none@178.124.154.80] has quit [Remote host closed the connection]
15:22   -!- d_himro [~none@178.124.154.80] has joined #debian
15:22   -!- d_himro is "Dim Himro" on #debian
15:22   -!- d_himro [~none@178.124.154.80] has quit [Remote host closed the connection]
15:24   -!- default [~default@5.206.225.27] has joined #debian
15:24   -!- default is "realname" on #debian
15:25   -!- alleycat [~alleycat@static24-72-73-233.r.rev.accesscomm.ca] has joined #debian
15:25   -!- alleycat is "delaine.c.dubois" on #debian
15:26   <alleycat>  If i have a question about backports could ask here ?
15:26   <alleycat>  could or can *
15:27   <bremner>   alleycat: about using backports, here is fine I think. There is also #debian-backports, but that is more about making them
15:28   <alleycat>  Ok so i wanna install the fglrx from backports but i keep getting prompted to install a news version of xorg plus the backports kernel which both dont work with the backports fglrx package
15:29   <alleycat>  How can i just install the fglrx and use the xorg and kernel from stable ?
15:30   -!- kristian [~smuxi@cpc91194-cmbg18-2-0-cust66.5-4.cable.virginm.net] has joined #debian
15:30   -!- kristian is "Your Name" on #debian #smuxi
15:30   -!- kristian [~smuxi@cpc91194-cmbg18-2-0-cust66.5-4.cable.virginm.net] has quit [Remote host closed the connection]
15:33   -!- jback [~jasper@shell-eun.jhq.io] has quit [Remote host closed the connection]
15:33   -!- jback [~jasper@shell-eun.jhq.io] has joined #debian
15:33   -!- jback is "Jasper Backer (jhq)" on #powerdns #nllgg #debian #soleus
15:34   -!- phdeswer [~phdeswer@91-159-55-220.elisa-laajakaista.fi] has quit [Ping timeout: 480 seconds]
15:35   -!- NomadJim [~NomadJim@72.168.161.49] has joined #debian
15:35   -!- NomadJim is "NomadJim" on #linode #debian
15:36   -!- soehnke1- [~soehnke1@ip1f12042b.dynamic.kabel-deutschland.de] has joined #debian
15:36   -!- soehnke1- is "soehnke1" on #debian-apache #debian
15:36   -!- soehnke1 [~soehnke1@ip1f12042b.dynamic.kabel-deutschland.de] has quit [Read error: Connection reset by peer]
15:37   -!- default [~default@5.206.225.27] has quit [Quit: Leaving]
15:39   -!- mr_hubot [mr_hubot@ill.catch.you.on.the.flip.side.panicbnc.eu] has joined #debian
15:39   -!- mr_hubot is "mr_hubot" on #debian
15:40   -!- derfel_ [~derfel@88-149-226-170.v4.ngi.it] has joined #debian
15:40   -!- derfel_ is "derfel" on #debian
15:44   -!- sbine [~sbine@00021ec0.user.oftc.net] has quit [Ping timeout: 480 seconds]
15:45   -!- mjampala [~mjampala@208.146.43.5] has quit [Ping timeout: 480 seconds]
15:47   -!- derfel__ [~derfel@5-157-127-56.v4.ngi.it] has quit [Ping timeout: 480 seconds]
15:49   -!- alleycat [~alleycat@static24-72-73-233.r.rev.accesscomm.ca] has left #debian []
15:51   -!- krymzon [~krymzon@pub151248191162.dh-hfc.datazug.ch] has joined #debian
15:51   -!- krymzon is "krymzon" on #debian
15:54   -!- mjampala [~mjampala@208.146.43.5] has joined #debian
15:54   -!- mjampala is "Mukund Jampala" on #debianppc #debian #debian-next
15:54   -!- derfel__ [~derfel@212-124-166-29.v4.ngi.it] has joined #debian
15:54   -!- derfel__ is "derfel" on #debian
15:54   -!- Butt3rfly [~fly@126.74.159.143.dyn.plus.net] has quit [Quit: back soon]
15:55   -!- PoPpiLLs [~damion@2602:306:cfb5:aaf0:dd75:7bbe:d44a:977] has joined #debian
15:55   -!- PoPpiLLs is "Damion Turner" on #debian
15:56   -!- CEP-2015-Jessie [~cep2015@181.93.22.100] has quit [Quit: Me jui]
15:56   -!- roflcopter [~armin@base.m2m.pm] has quit [Quit: relate to the matter as i drop the bomb]
15:56   -!- demetris [~smuxi@213.140.200.188] has quit [Remote host closed the connection]
15:57   -!- Discovery [~Discovery@109.235.52.8] has quit [Ping timeout: 480 seconds]
15:57   -!- Dumnorix [~Dumnorix@host121-28-dynamic.51-82-r.retail.telecomitalia.it] has joined #debian
15:57   -!- Dumnorix is "Dumnorix" on #debian
15:58   -!- Butt3rfly [~fly@126.74.159.143.dyn.plus.net] has joined #debian
15:58   -!- Butt3rfly is "sona cloiche" on #debian-offtopic #debian
15:59   -!- verboese [~verboese@v14855.1blu.de] has quit [Quit: ZNC - http://znc.in]
16:00   -!- verboese [~verboese@v14855.1blu.de] has joined #debian
16:00   -!- verboese is "Got ZNC?" on #debian
16:00   -!- drabard [systemd-ti@host-213-5-210-87.wtvk.pl] has quit [Ping timeout: 480 seconds]
16:01   -!- derfel_ [~derfel@88-149-226-170.v4.ngi.it] has quit [Ping timeout: 480 seconds]
16:01   -!- roflcopter [~armin@base.m2m.pm] has joined #debian
16:01   -!- roflcopter is "bam!" on #virt #ovirt #centos #debian #debian-systemd #debian-next #awesome #suckless
16:05   -!- cesox [~cesox__@r201-217-136-202.ir-static.anteldata.net.uy] has quit [Remote host closed the connection]
16:07   -!- cmacq2 [~cmacq2@g194109.upc-g.chello.nl] has quit [Ping timeout: 480 seconds]
16:08   -!- ldnunes [~ldnunes@187.23.155.147] has quit [Quit: Leaving]
16:09   -!- czesmir [~stefan@dgt218.neoplus.adsl.tpnet.pl] has quit [Quit: Lost terminal]
16:09   -!- famt [~famt@seven.user.oftc.net] has quit [Quit: Leaving]
16:10   -!- JoeSCSGFGuest100 [~textual@172-9-138-137.lightspeed.wepbfl.sbcglobal.net] has joined #debian
16:10   -!- JoeSCSGFGuest100 is "Textual User" on #debian #multiarch
16:11   -!- madbytes [~madbytes@103.7.81.163] has quit [Quit: My MacBook has gone to sleep. ZZZzzz…]
16:11   -!- thiagz [~nbu@186.206.135.188] has joined #debian
16:11   -!- thiagz is "nbu" on #debian #debian-br
16:12   -!- REalm [~REalm@ip-77-221-67-132.kava.lt] has joined #debian
16:12   -!- REalm is "Ricardas Barkauskas" on #multiarch #debian
16:13   -!- rajasekhar [~rajasekha@124.123.66.27] has quit [Ping timeout: 480 seconds]
16:13   -!- sbine [~sbine@00021ec0.user.oftc.net] has joined #debian
16:13   -!- sbine is "sbine" on #debian-offtopic #debian-systemd #debian-next #debian-fr #debian #awesome
16:17   -!- vlad1777d [~vlad@46.98.218.93] has quit [Ping timeout: 480 seconds]
16:18   -!- my123- [~my123@13.85.69.239] has joined #debian
16:18   -!- my123- is "Windows RT lab (fbl_woa/woachk)" on #pocl #debian
16:22   -!- my123 [~my123@0001f412.user.oftc.net] has quit [Ping timeout: 480 seconds]
16:22   -!- martinf99 [~teekanne@p200300625F2AC601C16D54A55A04270E.dip0.t-ipconnect.de] has joined #debian
16:22   -!- martinf99 is "realname" on #channel #debian-mate #debian-next #debian
16:23   -!- kingsley [~kingsley@97-113-16-60.tukw.qwest.net] has joined #debian
16:23   -!- kingsley is "Kingsley G. Morse Jr." on #debian.ch #blug #debian
16:24   -!- ulterior [~Scaevolus@tor2r.ins.tor.net.eu.org] has joined #debian
16:24   -!- ulterior is "uhtr5r" on #debian
16:26   -!- JoeSCSGFGuest100 [~textual@172-9-138-137.lightspeed.wepbfl.sbcglobal.net] has quit [Quit: Textual IRC Client: www.textualapp.com]
16:26   -!- derfel__ [~derfel@212-124-166-29.v4.ngi.it] has quit [Read error: Connection reset by peer]
16:27   -!- derfel__ [~derfel@212-124-166-29.v4.ngi.it] has joined #debian
16:27   -!- derfel__ is "derfel" on #debian
16:28   -!- andreasj [~andreasj@dyndsl-091-096-219-150.ewe-ip-backbone.de] has quit [Quit: Konversation terminated!]
16:29   -!- benages [~smuxi@90.71.225.53] has quit [Remote host closed the connection]
16:29   -!- ao2 [~ao2@cl-35.trn-01.it.sixxs.net] has joined #debian
16:29   -!- ao2 is "ao2" on #debian #cell
16:32   -!- dedeibel [~dedeibel@p200300752F603A00BEAEC5FFFE2EBDD8.dip0.t-ipconnect.de] has joined #debian
16:32   -!- dedeibel is "Benjamin Peter" on #debian-offtopic #debian
16:33   -!- palikka91 [~pi@dsl-trebrasgw1-58c1e4-52.dhcp.inet.fi] has joined #debian
16:33   -!- palikka91 is "*Unknown*" on #debian
16:34   -!- eck [~evan@32.104.198.104.bc.googleusercontent.com] has joined #debian
16:34   -!- eck is "evan" on #debian #debian-mentors
16:34   -!- ansel [~ansel@tmo-101-17.customers.d1-online.com] has quit [Ping timeout: 480 seconds]
16:35   -!- lostatwork [~lostatwor@cpe-24-208-41-139.new.res.rr.com] has quit [Quit: Leaving]
16:36   -!- Lordz [~Adium@186.215.116.176] has joined #debian
16:36   -!- Lordz is "Adium User" on #debian
16:39   -!- gattuso [~gattuso@gruppoculturale.it] has quit [Remote host closed the connection]
16:40   -!- gattuso [~gattuso@gruppoculturale.it] has joined #debian
16:40   -!- gattuso is "Got ZNC?" on #xen #virtualization #uml #tor #qemu #pwmt #polimi #llvmlinux #kvm #ipv6 #ii #i2p #debian #QuakeForge
16:42   -!- mtn [~mtn@72.168.160.131] has quit [Quit: Konversation terminated!]
16:43   -!- waldirmachado [~waldirmac@177.33.149.27] has joined #debian
16:43   -!- waldirmachado is "waldirmachado" on #debian
16:44   -!- Padass [Padass@dsl-trebrasgw1-58c1e4-52.dhcp.inet.fi] has joined #debian
16:44   -!- Padass is "..." on #debian
16:46   -!- tdy [~tdy@00016994.user.oftc.net] has quit [Ping timeout: 480 seconds]
16:46   -!- par [~par@92.247.144.11] has joined #debian
16:46   -!- par is "Par" on #debian
16:47   -!- waldirmachado [~waldirmac@177.33.149.27] has quit []
16:47   -!- metachr0n [~nobody@46.166.190.157] has joined #debian
16:47   -!- metachr0n is "Jack Screw" on #C #debian-hurd #debian-bugs #debian #awesome
16:50   -!- metachr0n [~nobody@46.166.190.157] has quit []
16:51   -!- Shentino [~Shentino@66-191-43-18.static.snfr.nc.charter.com] has quit [Read error: Connection reset by peer]
16:51   <palikka91>
16:53   -!- metachr0n [~nobody@46.166.137.203] has joined #debian
16:53   -!- metachr0n is "Jack Screw" on #C #debian-hurd #debian-bugs #debian #awesome
16:53   -!- REalm [~REalm@ip-77-221-67-132.kava.lt] has quit [Quit: Leaving]
16:54   -!- ulterior [~Scaevolus@tor2r.ins.tor.net.eu.org] has quit []
16:54   -!- kritzefitz [~kritzefit@ip5b407dd4.dynamic.kabel-deutschland.de] has quit [Remote host closed the connection]
16:55   -!- grrrrrr [~libertad@0001866c.user.oftc.net] has joined #debian
16:55   -!- grrrrrr is "http://barbanegra.info/" on #debian
17:00   -!- Rosco2 [~RossGammo@188-183-60-50-dynamic.dk.customer.tdc.net] has quit [Quit: Leaving]
17:00   -!- Lordz [~Adium@186.215.116.176] has quit [Quit: Leaving.]
17:02   -!- barbanegra [~libertad@0001866c.user.oftc.net] has quit [Ping timeout: 480 seconds]
17:03   -!- waldirmachado [~waldirmac@177.33.149.27] has joined #debian
17:03   -!- waldirmachado is "waldirmachado" on #debian
17:07   -!- bodhi [~bodhi@dslb-088-078-207-153.088.078.pools.vodafone-ip.de] has joined #debian
17:07   -!- bodhi is "realname" on #alioth #debian-mozilla #debian-mozext #debian-bugs #debian-games #debian-mirrors #debian-lists #debian-next #debian-multimedia #debian-efi #tor-project #tor #siduction-de #debian-ubuntu #debian-fedmsg #debian-devel-changes #debian-derivatives #debian
17:07   -!- waldirmachado [~waldirmac@177.33.149.27] has quit []
17:08   -!- metachr0n [~nobody@46.166.137.203] has quit [Quit: WeeChat 1.5]
17:09   -!- metachr0n [~nobody@46.166.190.157] has joined #debian
17:09   -!- metachr0n is "Jack Screw" on #C #debian-hurd #debian-bugs #debian #awesome
17:09   -!- metachr0n [~nobody@46.166.190.157] has quit []
17:10   -!- Padass [Padass@dsl-trebrasgw1-58c1e4-52.dhcp.inet.fi] has quit []
17:12   -!- Maza [~PcJamesy@108.61.166.135] has joined #debian
17:12   -!- Maza is "Skyrider" on #debian
17:14   -!- tjure [~thomas@cpc92320-cmbg19-2-0-cust3547.5-4.cable.virginm.net] has quit [Ping timeout: 480 seconds]
17:14   -!- pindy [~pindy@181.198.151.122.dynamic.dsl.dv.iprimus.net.au] has quit [Ping timeout: 480 seconds]
17:14   -!- NomadJim [~NomadJim@72.168.161.49] has quit [Quit: Leaving]
17:14   -!- heroux_ [sandroco@gateway.insomnia247.nl] has joined #debian
17:14   -!- heroux_ is "heroux" on #lyx #debian-systemd #virt #awesome #feh #debian-reproducible #debian-next #debian-apt #debian-bugs #debian-meeting #debian
17:14   -!- pollo [~ricardo@96.127.201.15] has joined #debian
17:14   -!- pollo is "ricardo" on #debian #debian-quebec #debconf-video #debconf
17:15   -!- pindy [~pindy@181.198.151.122.dynamic.dsl.dv.iprimus.net.au] has joined #debian
17:15   -!- pindy is "Gin" on #debian
17:15   -!- par [~par@92.247.144.11] has quit [Quit: Leaving]
17:15   <pollo> 0/ I was wondering how to set the networking informations in debian-installer via cli (and not via the GUI)
17:15   <pollo> I know I can open a busybox terminal but I've never done anything in it
17:16   -!- Dumnorix [~Dumnorix@host121-28-dynamic.51-82-r.retail.telecomitalia.it] has quit [Quit: Sto andando via]
17:16   -!- marijnfs [~smuxi@77.47.67.78.dynamic.cablesurf.de] has quit [Remote host closed the connection]
17:17   <retrospectacus>    "ip a"
17:17   <retrospectacus>    what kind of network information?
17:17   -!- thunderrd_ [~thunderrd@110.77.213.16] has joined #debian
17:17   -!- thunderrd_ is "realname" on #aptosid #ck #debian #siduction #siduction-de #siduction-dev #GamersOnLinux #tor
17:17   <pollo> retrospectacus: erf, you mean I have to set everything with "ip commands"
17:17   -!- mlundblad [~marcus@c-20d771d5.014-990-7570702.cust.bredbandsbolaget.se] has quit [Ping timeout: 480 seconds]
17:18   -!- mode/#debian [+l 747] by debhelper
17:18   <pollo> I was hoping I could write some sort of /etc/network/interfaces file
17:18   <retrospectacus>    I believe you can do that
17:18   -!- pheanex [~pheanex@2001-4dd6-b0c4-0-2054-ae95-b68a-acb3.ipv6dyn.netcologne.de] has quit [Quit: Leaving.]
17:18   <pollo> retrospectacus: I'm trying to set up VMs on a OVH box: http://guide.ovh.com/BridgeClient#link3
17:19   <pollo> ţhe only way I've been able to do it atm is to do the install without network and the modify the interfaces file
17:19   -!- NomadJim [~NomadJim@72.168.161.49] has joined #debian
17:19   -!- NomadJim is "NomadJim" on #linode #debian
17:20   <retrospectacus>    can't you setup static network in the installer setup?
17:20   <pollo> retrospectacus: yeah, but it tells me I have a bad gateway and does not let me continue :(
17:21   -!- Lordz [~Adium@186.215.116.176] has joined #debian
17:21   -!- Lordz is "Adium User" on #debian-br #debian
17:21   -!- Lordz [~Adium@186.215.116.176] has left #debian []
17:22   -!- Nyctophilia [~IamHereFo@0001fd4b.user.oftc.net] has quit [Read error: Connection reset by peer]
17:22   -!- heroux [sandroco@gateway.insomnia247.nl] has quit [Ping timeout: 480 seconds]
17:23   -!- indeb [~oftc-webi@2001:1c04:1f00:2c00:1462:691f:2d60:f414] has joined #debian
17:23   -!- indeb is "OFTC WebIRC Client" on #debian
17:23   <retrospectacus>    I guess at some point in the installer you'd go to busybox and edit interfaces file as described, then proceed with the installer
17:23   -!- CutMeOwnThroat [~k@00013546.user.oftc.net] has joined #debian
17:23   -!- CutMeOwnThroat is "realname" on #debian #debian-offtopic
17:23   -!- thunderrd [~thunderrd@thunderrd.user.oftc.net] has quit [Ping timeout: 480 seconds]
17:23   <pollo> retrospectacus: great, thanks! I'll try that
17:23   <indeb> what does dpkg -i file.deb actually do? how can i see what it's doing behind the scenes?
17:25   <pollo> indeb: it installs the .deb file
17:25   <indeb> yes, but how can i see what actually changes
17:26   <pollo> as for seeing what is installed, I don't know
17:26   <pollo> I'd just open the .deb and check what files are being installed
17:26   -!- _4ls [~lsi@179.222.4.95] has joined #debian
17:26   -!- _4ls is "LSI" on #tor-project #slackware #pandorah #OpenBSD #oatha #freebsd #debian-es #debian-br #debian @#cebolinha @#Brasil #area31
17:26   <retrospectacus>    do dpkg -L packagename to see what files were installed
17:27   <indeb> for example a .desktop file is added to /usr/share/applications... i would like to know what the things are that get altered in my system
17:27   <indeb> or added
17:27   <retrospectacus>    it also runs some scripts to create users or things like that. You can see them in /var/lib/dpkg/info
17:27   <pollo> indeb: if it comes from the official archive you can check that on the debian websie
17:27   <pollo> i.e. https://packages.debian.org/stretch/amd64/dpkg/filelist
17:28   <indeb> no i mean some obscure file i downloaded from the internet
17:29   -!- tdy [~tdy@00016994.user.oftc.net] has joined #debian
17:29   -!- tdy is "tdy" on #debian #awesome
17:29   -!- kenoby [~kenoby@host123-17-dynamic.248-95-r.retail.telecomitalia.it] has quit [Ping timeout: 480 seconds]
17:30   -!- heroux_ [sandroco@gateway.insomnia247.nl] has quit [Remote host closed the connection]
17:30   <indeb> does the package have to be installed in order to run dpkg -L?
17:30   -!- heroux [sandroco@gateway.insomnia247.nl] has joined #debian
17:30   -!- heroux is "heroux" on #lyx #debian-systemd #virt #awesome #feh #debian-reproducible #debian-next #debian-apt #debian-bugs #debian-meeting #debian
17:31   <retrospectacus>    yes
17:31   <indeb> ah ok
17:31   <indeb> and does this list everything and with everything, i mean everything?
17:32   <retrospectacus>    maybe you want dpkg-deb -c file.deb
17:33   -!- bollo [~quassel@00021dc1.user.oftc.net] has joined #debian
17:33   -!- bollo is "bollo" on #debian
17:33   <retrospectacus>    indeb: only files directly copied into your system. As I mentioned, it also runs some scripts; preinst and postinst
17:33   -!- Valvalion [~Valvalion@187.104-201-80.adsl-dyn.isp.belgacom.be] has quit [Remote host closed the connection]
17:34   <indeb> where are these scripts located?
17:34   <indeb> inside the .deb file itself?
17:35   <retrospectacus>    yes, somewhere in there. Not sure how to see them
17:35   <indeb> ok... i'm gonna fiddle around a little... thanks for the info
17:35   -!- Lordz [~Adium@186.215.116.176] has joined #debian
17:35   -!- Lordz is "Adium User" on #debian
17:35   -!- Lordz [~Adium@186.215.116.176] has left #debian []
17:35   -!- indeb [~oftc-webi@2001:1c04:1f00:2c00:1462:691f:2d60:f414] has left #debian []
17:36   -!- ol [~quassel@2406:e006:db1:1:8e89:a5ff:feca:57fe] has quit [Ping timeout: 480 seconds]
17:36   <retrospectacus>    try some of the things in "man dpkg-deb"
17:36   -!- dedeibel [~dedeibel@p200300752F603A00BEAEC5FFFE2EBDD8.dip0.t-ipconnect.de] has quit [Ping timeout: 480 seconds]
17:38   <retrospectacus>    you can get them out wth -e
17:38   -!- derfel__ [~derfel@212-124-166-29.v4.ngi.it] has quit [Read error: Connection reset by peer]
17:39   -!- derfel__ [~derfel@212-124-166-29.v4.ngi.it] has joined #debian
17:39   -!- derfel__ is "derfel" on #debian
17:39   -!- ol [~quassel@2406:e006:db1:1:8e89:a5ff:feca:57fe] has joined #debian
17:39   -!- ol is "Ol" on #debian
17:39   <retrospectacus>    oops. he left
17:40   -!- kenoby [~kenoby@host116-17-dynamic.248-95-r.retail.telecomitalia.it] has joined #debian
17:40   -!- kenoby is "realname" on #debian #debian-next
17:40   -!- towo` [~towo@00012f0f.user.oftc.net] has quit [Quit: Leaving]
17:40   -!- thiagz [~nbu@186.206.135.188] has quit [Ping timeout: 480 seconds]
17:42   -!- Maza [~PcJamesy@108.61.166.135] has quit []
17:45   -!- paxmark9 [~paxtormar@199.167.137.205] has joined #debian
17:45   -!- paxmark9 is "siducer693" on #debian-live #kvm #debian-boot #debian-systemd #debian #vsido #siduction #debian-next
17:46   -!- bluca [~lboccass@host86-171-129-178.range86-171.btcentralplus.com] has joined #debian
17:46   -!- bluca is "purple" on #debian
17:50   -!- n0mad_ [~n0mad@ybox00.ybox.it] has joined #debian
17:50   -!- n0mad_ is "n0mad" on #debian-it #debian
17:53   -!- n0mad [~n0mad@ybox00.ybox.it] has quit [Ping timeout: 480 seconds]
17:53   -!- n0mad_ is now known as n0mad
17:54   -!- ao2 [~ao2@cl-35.trn-01.it.sixxs.net] has quit [Quit: Leaving]
17:56   -!- mtn [~mtn@72.168.160.131] has joined #debian
17:56   -!- mtn is "Dan" on #debian
17:56   -!- wargreen [~wargreen@ip-188.net-80-236-36.suresnes.rev.numericable.fr] has quit [Remote host closed the connection]
17:56   -!- derfel__ [~derfel@212-124-166-29.v4.ngi.it] has quit [Read error: Connection reset by peer]
17:57   -!- derfel__ [~derfel@212-124-166-29.v4.ngi.it] has joined #debian
17:57   -!- derfel__ is "derfel" on #debian
17:57   -!- wargreen [~wargreen@ip-188.net-80-236-36.suresnes.rev.numericable.fr] has joined #debian
17:57   -!- wargreen is "realname" on #debian #debian-fr
17:58   -!- wCPO [~kristian@188.228.31.139] has quit [Remote host closed the connection]
18:00   -!- Blacker47 [~Blacker47@00014f22.user.oftc.net] has quit [Quit: Leaving]
18:05   -!- aguslr [~aguslr@0001a2ec.user.oftc.net] has quit [Quit: Coyote finally caught me]
18:06   -!- aguslr [~aguslr@111.98.117.91.dynamic.reverse-mundo-r.com] has joined #debian
18:06   -!- aguslr is "Agus" on #debian #awesome
18:09   -!- bollo [~quassel@00021dc1.user.oftc.net] has quit [Ping timeout: 480 seconds]
18:10   -!- palikka91 [~pi@dsl-trebrasgw1-58c1e4-52.dhcp.inet.fi] has quit [Remote host closed the connection]
18:12   -!- daizklee [~smuxi@2a02:582:804e:ed00:f8c4:444f:a003:b92e] has joined #debian
18:12   -!- daizklee is "adzile" on #debian #smuxi
18:12   -!- daizklee [~smuxi@2a02:582:804e:ed00:f8c4:444f:a003:b92e] has quit [Remote host closed the connection]
18:16   -!- PhilGEE [~pgreen@pool-100-11-145-218.phlapa.fios.verizon.net] has joined #debian
18:16   -!- PhilGEE is "Phillip Green" on #debian
18:19   -!- jstein_ [~quassel@xdsl-213-196-243-112.netcologne.de] has joined #debian
18:19   -!- jstein_ is "Jonas Stein" on #smxi #osm-de #mint #fsfe #debian-mentors #debian #kernelnewbies
18:21   -!- swirl_ [~swirl@host251-137-dynamic.21-87-r.retail.telecomitalia.it] has quit [Ping timeout: 480 seconds]
18:21   -!- pamaury [~pamaury@89.28.146.93] has quit [Ping timeout: 480 seconds]
18:23   -!- bodhi [~bodhi@dslb-088-078-207-153.088.078.pools.vodafone-ip.de] has quit [Quit: Leaving]
18:26   -!- jstein [~quassel@xdsl-213-196-242-144.netcologne.de] has quit [Ping timeout: 480 seconds]
18:27   -!- thiagz [~nbu@186.206.135.188] has joined #debian
18:27   -!- thiagz is "nbu" on #debian #debian-br
18:28   -!- mode/#debian [+l 740] by debhelper
18:29   -!- ValkyrieSec [~DDoSTheWo@173.199.65.15] has quit [Quit: Leaving]
18:30   -!- bluca [~lboccass@host86-171-129-178.range86-171.btcentralplus.com] has quit [Quit: Leaving.]
18:31   -!- mythos [~mythos@80-109-225-139.cable.dynamic.surfer.at] has quit [Quit: Verlassend]
18:34   -!- nowhereman [~pierre@2a01:cb10:5c:1300:1a5e:fff:fedf:bfb0] has joined #debian
18:34   -!- nowhereman is "Pierre Thierry" on @#concatenative #emacs @#git @#erights #lisp #debian-kde #debian
18:38   <pollo> retrospectacus: can't seem to make it work :(
18:38   -!- funnel [~funnel@0001c7d4.user.oftc.net] has quit [Ping timeout: 480 seconds]
18:38   <pollo> I've created a "interfaces" file & all but I can't seem to get the network to reload and parse the conf
18:38   -!- Seeder [~Seeder@copper.root.sx] has quit [Ping timeout: 480 seconds]
18:38   -!- rootbeer [~rootbeer@81.4.123.134] has quit [Ping timeout: 480 seconds]
18:39   <pollo> bringing the interface down & up with ip does not work either
18:41   -!- dr0lan [~dr0lan@000224af.user.oftc.net] has joined #debian
18:41   -!- dr0lan is "dr0lan" on #debian
18:42   -!- rootbeer [~rootbeer@81.4.123.134] has joined #debian
18:42   -!- rootbeer is "rootbeer" on #debian-qa #debian-mentors #debian-bugs #debian-offtopic #debian #debian-next #bash-completion #debian-3dprinting #debian-68k #debian-amd64 #debian-alpha #debian-apache #debian-apt #debian-arm #debian-bluetooth #debian-boinc #debian-boot
18:43   -!- Seeder [~Seeder@copper.root.sx] has joined #debian
18:43   -!- Seeder is "Seeder" on #debian-mate #debian
18:46   -!- acald3ron [~acald3ron@48.189-204-180.bestel.com.mx] has joined #debian
18:46   -!- acald3ron is "realname" on #debian-next #debian-es #linode #debian-mx #debian
18:46   -!- demetris [~smuxi@213.140.200.188] has joined #debian
18:46   -!- demetris is "Demetris" on #debian #smuxi
18:47   -!- krabador [~krabador@000208ac.user.oftc.net] has joined #debian
18:47   -!- krabador is "krabador" on #debian-it #debian
18:47   -!- funnel [~funnel@0001c7d4.user.oftc.net] has joined #debian
18:47   -!- funnel is "funnel" on #powerdns #perl #pentadactyl #ovirt #openttd #openbox #oftc #munin #moocows #monkeysphere #mm #mci #linuxfs #linode #kvm #kernelnewbies #igloo #gcc #gc-linux #freedombox @#exvm #ext4 #dzen #debian #debian-mentors #debian-it #debian-ipv6 #debian-hurd #debian-glibc #debian-fr #debian-boot #debian-arm #davical @#cursive #ck #ceph #bitlbee #awesome #apparmor #antlr #acal
18:48   -!- thiagz [~nbu@186.206.135.188] has quit [Ping timeout: 480 seconds]
18:53   -!- ansel [~ansel@ip-109-44-3-165.web.vodafone.de] has joined #debian
18:53   -!- ansel is "Andreas Seltenreich" on #debian-ha #debian
18:53   -!- cruncher [~cruncher@00020ba0.user.oftc.net] has quit [Quit: Leaving]
18:54   <pollo> anyway, I think a no network install and then configuring the network is less hassle than writing files with echo, sed & grep :D
18:58   -!- CutMeOwnThroat [~k@00013546.user.oftc.net] has quit [Remote host closed the connection]
18:58   -!- pipedream [~pipedream@users.aims.ac.za] has quit [Remote host closed the connection]
18:58   -!- CutMeOwnThroat [~k@00013546.user.oftc.net] has joined #debian
18:58   -!- CutMeOwnThroat is "realname" on #debian #debian-offtopic
18:59   -!- mjampala [~mjampala@208.146.43.5] has quit [Ping timeout: 480 seconds]
19:02   -!- pipedream [~pipedream@oystercatcher.aims.ac.za] has joined #debian
19:02   -!- pipedream is "Jan Groenewald" on #debian-welcome #debian-ubuntu #debian-systemd #debian-science #debian-publicity #debian-printing #debian-next #debian-mirrors #debian-mentors #debian-lts #debian-live #debian-gnome #debian-edu #debian-desktop #debian-derivatives #debian-bugs #debian #debconf
19:05   -!- demetris [~smuxi@213.140.200.188] has quit [Read error: Connection reset by peer]
19:07   -!- AzaToth [~azatoth@h87-96-232-219.cust.se.alltele.net] has quit [Remote host closed the connection]
19:07   -!- mythos [~mythos@80-109-225-139.cable.dynamic.surfer.at] has joined #debian
19:07   -!- mythos is "mythos" on #debian-offtopic #debian-gnome #debian
19:07   -!- mjampala [~mjampala@208.146.43.5] has joined #debian
19:07   -!- mjampala is "Mukund Jampala" on #debian #debian-next
19:16   -!- mario [~mario@148.222.127.142] has joined #debian
19:16   -!- mario is "mario" on #debian
19:16   <mario> hola
19:17   -!- phls [~phls@177.16.210.255] has joined #debian
19:17   -!- phls is "Paulo Santana" on #debian-publicity #debian-devel-br #debian-mentors #debian-br #debian-l10n-br #debian
19:18   -!- sam_c [~sam_c@000228b9.user.oftc.net] has quit [Ping timeout: 480 seconds]
19:20   <mario> desde que te veo aquí es donde las cosas de l
19:20   -!- azamat [~azamat@r27-pw-pimpao.ibys.com.br] has joined #debian
19:20   -!- azamat is "realname" on #debian-games #debian-br #debian
19:20   <mario> pero de que sirve que
19:20   <mario> pero de que
19:20   <sney>  !es
19:20   <dpkg>  Este canal es de soporte técnico en Inglés para Debian. Si prefiere que el soporte sea en Español, puede ingresar en #debian-es tecleando /join #debian-es en la línea de chat.
19:20   <mario> no hagais caso, solo estoy escribiedo sin sentido
19:21   <mario> one more time, someone is ther?
19:21   -!- CutMeOwnThroat [~k@00013546.user.oftc.net] has quit [Ping timeout: 480 seconds]
19:22   -!- tdy [~tdy@00016994.user.oftc.net] has quit [Ping timeout: 480 seconds]
19:23   <mario> helo
19:23   <mario> hollo
19:23   <mario> hello
19:24   -!- superusr [~tf@p5B246D84.dip0.t-ipconnect.de] has quit [Quit: Leaving]
19:24   -!- mario [~mario@148.222.127.142] has quit [Quit: Saliendo]
19:26   *   sney shrug
19:26   -!- sunoano1 [~sa@193-81-176-229.adsl.highway.telekom.at] has joined #debian
19:26   -!- sunoano1 is "Suno Ano" on #debian-next #debian #awesome
19:26   -!- antgel [~topdog@host86-170-6-220.range86-170.btcentralplus.com] has joined #debian
19:26   -!- antgel is "TD" on #openvas #debian
19:27   -!- dr0lan [~dr0lan@000224af.user.oftc.net] has quit [Ping timeout: 480 seconds]
19:29   -!- dvs [~hibbard@00012127.user.oftc.net] has joined #debian
19:29   -!- dvs is "realname" on #debian
19:31   -!- sunoano2 [~sa@193-83-246-232.adsl.highway.telekom.at] has quit [Ping timeout: 480 seconds]
19:32   -!- Linked is now known as Guest2025
19:32   -!- Linked [~Chained@p4FC13BB7.dip0.t-ipconnect.de] has joined #debian
19:32   -!- Linked is "realname" on #debian
19:32   -!- azamat [~azamat@r27-pw-pimpao.ibys.com.br] has quit [Quit: fui]
19:32   -!- PityDaFool [~AfroThund@2601:147:c003:3954:5cbe:f59:bd0f:9ba] has joined #debian
19:32   -!- PityDaFool is "Eddie J Carswell II" on #debian #debian-next #debian-offtopic
19:33   -!- Guest1777 [~AfroThund@c-73-200-97-239.hsd1.md.comcast.net] has quit [Read error: Connection reset by peer]
19:33   -!- PityDaFool is now known as Guest2026
19:34   -!- pico [~vend3r@80-244-81-191.customer.t3.se] has joined #debian
19:34   -!- pico is "verbalins" on #debian
19:36   -!- knowledgejunkie [~knowledge@cpc77018-warw18-2-0-cust959.3-2.cable.virginm.net] has quit [Ping timeout: 480 seconds]
19:37   -!- AfroThundr [~AfroThund@2601:147:c003:3954:5cbe:f59:bd0f:9ba] has joined #debian
19:37   -!- AfroThundr is "Eddie J Carswell II" on #debian #debian-next #debian-offtopic
19:38   -!- AfroThundr is now known as Guest2028
19:38   -!- Guest2026 [~AfroThund@2601:147:c003:3954:5cbe:f59:bd0f:9ba] has quit [Read error: Connection reset by peer]
19:39   -!- knowledgejunkie [~knowledge@cpc77018-warw18-2-0-cust959.3-2.cable.virginm.net] has joined #debian
19:39   -!- knowledgejunkie is "Nick Morrott" on #debian #debian-perl
19:39   -!- Guest2025 [~Chained@p4FC13BAF.dip0.t-ipconnect.de] has quit [Ping timeout: 480 seconds]
19:40   -!- neiljp [~Neil@static-50-53-105-168.bvtn.or.frontiernet.net] has joined #debian
19:40   -!- neiljp is "realname" on #osm #osm-gb #osm-us #OpenRailwayMap #hot #debian
19:41   -!- jegc [~jegc@dynamic-190-27-96-5.dynamic.etb.net.co] has joined #debian
19:41   -!- jegc is "Jorge Ernesto Guevara Cuenca" on #debian
19:50   -!- peter1138 [~petern@00013681.user.oftc.net] has quit [Quit: Changing server]
19:51   -!- peter1138 [~petern@lachesis.fuzzle.org] has joined #debian
19:51   -!- peter1138 is "Peter Nelson" on #debian #tycoon #openttd
19:53   -!- sam_c [~sam_c@000228b9.user.oftc.net] has joined #debian
19:53   -!- sam_c is "sam <sam@cmpct.info>" on #debian-mentors #debian @#cmpctircd #alioth
19:54   -!- mtn [~mtn@72.168.160.131] has quit [Quit: Konversation terminated!]
19:59   -!- Linked [~Chained@p4FC13BB7.dip0.t-ipconnect.de] has quit [Read error: Connection reset by peer]
19:59   -!- Linked [~Chained@p4FC13BB7.dip0.t-ipconnect.de] has joined #debian
19:59   -!- Linked is "realname" on #debian
19:59   -!- cjac [~cjac@2607:ff08:f5:3a::3] has quit [Ping timeout: 480 seconds]
20:00   -!- nilez [~nilez@ec2-52-37-170-77.us-west-2.compute.amazonaws.com] has quit [Ping timeout: 480 seconds]
20:03   -!- Brigo [~Brigo@164.11.60.178.dynamic.reverse-mundo-r.com] has quit [Ping timeout: 480 seconds]
20:03   -!- cjac [~cjac@2607:ff08:f5:3a::3] has joined #debian
20:03   -!- cjac is "C.J. Adams-Collier KF7BMP" on #subgraph #debian #lartc @#deb-dpdk #debian-mentors #debian-perl #gnutls #virt #debian-installer #debian-openstack #debian-cli
20:04   -!- pico [~vend3r@80-244-81-191.customer.t3.se] has quit []
20:07   -!- michel [~michel@177.134.190.1] has joined #debian
20:07   -!- michel is "Michel Cruz" on #debian
20:07   -!- michel [~michel@177.134.190.1] has quit []
20:09   -!- nilez [~nilez@ec2-52-37-170-77.us-west-2.compute.amazonaws.com] has joined #debian
20:09   -!- nilez is "..." on #powerdns #awesome #osm #tor-project #debian-mentors #qemu #ceph #linode #tor #debian
20:12   -!- olinuxx [~capturixe@ANancy-653-1-517-245.w109-221.abo.wanadoo.fr] has quit [Remote host closed the connection]
20:14   -!- pipedream [~pipedream@oystercatcher.aims.ac.za] has quit [Remote host closed the connection]
20:14   -!- pipedream [~pipedream@oystercatcher.aims.ac.za] has joined #debian
20:14   -!- pipedream is "Jan Groenewald" on #debian-welcome #debian-ubuntu #debian-systemd #debian-science #debian-publicity #debian-printing #debian-next #debian-mirrors #debian-mentors #debian-lts #debian-live #debian-gnome #debian-edu #debian-desktop #debian-derivatives #debian-bugs #debian #debconf
20:19   -!- acald3ron [~acald3ron@48.189-204-180.bestel.com.mx] has quit [Remote host closed the connection]
20:19   -!- Riku [~Riku@186.122.138.71] has joined #debian
20:19   -!- Riku is "Riku" on #debian
20:21   -!- hewl [~hewl@pa49-183-75-35.pa.vic.optusnet.com.au] has joined #debian
20:21   -!- hewl is "Hewl" on #debian-offtopic #debian-kde #debian
20:23   -!- Riku [~Riku@186.122.138.71] has left #debian []
20:26   -!- CEP-2015-Jessie [~cep2015@181.93.22.100] has joined #debian
20:26   -!- CEP-2015-Jessie is "realname" on @#debian-live-ar #debian-live #debian-bluetooth #oftc #debian-ar #debian #debian-es
20:26   -!- AlexLikeRock [~AlexLikeR@0001b9bd.user.oftc.net] has quit [Remote host closed the connection]
20:27   -!- azamat [~azamat@r27-pw-pimpao.ibys.com.br] has joined #debian
20:27   -!- azamat is "realname" on #debian-games #debian-br #debian
20:32   -!- qws-user-1228 [~quassel@cpe-76-181-123-141.columbus.res.rr.com] has quit [Read error: Connection reset by peer]
20:33   -!- qws-user-1228 [~quassel@2605:a000:110c:a05e:9128:9b91:a886:8e00] has joined #debian
20:33   -!- qws-user-1228 is "qws-user-1228" on #otr #tor-bots #ohiolinux #tor #debian #mitmproxy #kvm #tor-project #ipv6 #i2p #xen #https-everywhere #lxde #virt #tor2web #qubes #qemu #bitlbee
20:35   -!- andres [~andres@crystalspace3d.org] has quit [Quit: -]
20:35   -!- jstein_ [~quassel@xdsl-213-196-243-112.netcologne.de] has quit [Quit: No Ping reply in 180 seconds.]
20:36   -!- jstein [~quassel@xdsl-213-196-243-112.netcologne.de] has joined #debian
20:36   -!- jstein is "Jonas Stein" on #smxi #osm-de @#mint @#fsfe #debian-mentors #debian #kernelnewbies
20:37   -!- andres [~andres@crystalspace3d.org] has joined #debian
20:37   -!- andres is "Andres Freund" on #debian #kernelnewbies #awesome
20:38   -!- jrtc27 [~jrtc27@jrtc27.com] has quit [Max SendQ exceeded]
20:38   -!- jrtc27 [~jrtc27@jrtc27.com] has joined #debian
20:38   -!- jrtc27 is "James Clarke" on #debian-superh #debian-sparc #debian-science #debian-reproducible #debian-qa #debian-mozilla #debian-mentors #debian-kbsd #debian-hurd #debian-glibc #debian-gaming #debian-ftp #debian-bootstrap #debian-alpha #debian-68k #debian @#cowdancer
20:40   -!- lostson [~lostson@00011d3e.user.oftc.net] has quit [Quit: Leaving]
20:41   -!- jstein [~quassel@xdsl-213-196-243-112.netcologne.de] has quit [Remote host closed the connection]
20:51   -!- egar [~egar@dslb-188-106-123-022.188.106.pools.vodafone-ip.de] has joined #debian
20:51   -!- egar is "edgar" on #debian
20:52   -!- azamat [~azamat@r27-pw-pimpao.ibys.com.br] has quit [Quit: fui]
20:52   -!- Linked [~Chained@p4FC13BB7.dip0.t-ipconnect.de] has quit [Ping timeout: 480 seconds]
20:53   -!- mutantez [~nbu@186.206.135.188] has joined #debian
20:53   -!- mutantez is "nbu" on #debian
20:53   -!- mutantez [~nbu@186.206.135.188] has quit []
20:54   -!- KaiserAres [~KaiserAre@00021968.user.oftc.net] has quit [Quit: ...]
20:57   -!- moose [~moose@noronha.iro.umontreal.ca] has joined #debian
20:57   -!- moose is "moose" on #debian
20:58   -!- poz2k4444 [uid22701@id-22701.charlton.irccloud.com] has joined #debian
20:58   -!- poz2k4444 is "Francisco Lopez" on #osrm #debian #debian-next
20:58   -!- moose [~moose@noronha.iro.umontreal.ca] has quit []
21:02   -!- pipedream [~pipedream@oystercatcher.aims.ac.za] has quit [Ping timeout: 480 seconds]
21:06   -!- pipedream [~pipedream@oystercatcher.aims.ac.za] has joined #debian
21:06   -!- pipedream is "Jan Groenewald" on #debian-welcome #debian-ubuntu #debian-systemd #debian-science #debian-publicity #debian-printing #debian-next #debian-mirrors #debian-mentors #debian-lts #debian-live #debian-gnome #debian-edu #debian-desktop #debian-derivatives #debian-bugs #debian #debconf
21:07   -!- kazaboum [~smuxi@b2s31-1-88-188-170-171.fbx.proxad.net] has joined #debian
21:07   -!- kazaboum is "kazaboum" on #debian #smuxi
21:07   -!- kazaboum [~smuxi@b2s31-1-88-188-170-171.fbx.proxad.net] has quit [Remote host closed the connection]
21:08   -!- gfedel__ [~gfedel@191.34.142.248] has joined #debian
21:08   -!- gfedel__ is "fedel" on #debian #debian-br #debian-l10n-br
21:10   -!- fstd_ [~fstd@x4e3066ee.dyn.telefonica.de] has joined #debian
21:10   -!- fstd_ is "fstd" on #gentoo #linuxfs #gcc #awesome #oftc #vserver #suckless #osm #linode #debian #kernelnewbies
21:11   -!- egar [~egar@dslb-188-106-123-022.188.106.pools.vodafone-ip.de] has quit [Quit: Verlassend]
21:17   -!- rbern [~rbern@00021abc.user.oftc.net] has quit [Ping timeout: 480 seconds]
21:18   -!- fstd [~fstd@x5ce4977f.dyn.telefonica.de] has quit [Ping timeout: 480 seconds]
21:18   -!- fstd_ is now known as fstd
21:19   -!- rbern [~rbern@00021abc.user.oftc.net] has joined #debian
21:19   -!- rbern is "rbern" on #debian-ubuntu #debian-systemd #debian #debian-arm #debian-apt #virtualization #reproducible-builds #lxde #ikiwiki
21:22   -!- renols [olsren@89.239.193.52] has quit [Ping timeout: 480 seconds]
21:33   -!- cybiko123 [~cybiko123@00020220.user.oftc.net] has joined #debian
21:33   -!- cybiko123 is "cybiko123" on #debian @##debian
21:34   -!- faw [~faw@faw.user.oftc.net] has quit [Ping timeout: 480 seconds]
21:37   -!- klatin__ [~klatin@p54AB46BC.dip0.t-ipconnect.de] has joined #debian
21:37   -!- klatin__ is "klatin" on #debconf #debian #debian-mirrors #multiarch
21:38   -!- fpires [~fpires@179.155.4.4] has joined #debian
21:38   -!- fpires is "realname" on #debian
21:39   -!- fpires [~fpires@179.155.4.4] has quit []
21:42   -!- pencilandpaper [~penciland@dynamic-acs-24-239-230-203.zoominternet.net] has joined #debian
21:42   -!- pencilandpaper is "pencilandpaper" on #debian-offtopic #debian-next #debian
21:44   -!- klatin_ [~klatin@p54AB56F4.dip0.t-ipconnect.de] has quit [Ping timeout: 480 seconds]
21:45   -!- awal1 [~awal1@199.241.132.84] has joined #debian
21:45   -!- awal1 is "realname" on #debian-es #openbox #debian-next #debian
21:48   -!- desert [~desert@212-129-33-61.freevpn.me] has joined #debian
21:48   -!- desert is "Desert" on #debian
21:51   <desert>    trying to get a dell 1130 laser printer to work, iv tried downloading a driver from gitub, but debian still thinks it doesen't have a driver installed, what do i do now?
21:51   -!- montj2 [~montj2@2600:3c02::f03c:91ff:fe16:33b6] has joined #debian
21:51   -!- montj2 is "montj2" on #ubuntu #debian #kernelnewbies
21:52   -!- montj2 [~montj2@2600:3c02::f03c:91ff:fe16:33b6] has quit []
21:52   -!- GreatAttitude [~great@46.166.148.142] has quit [Remote host closed the connection]
21:52   -!- GreatAttitude [~great@tsn109-201-154-159.dyn.nltelcom.net] has joined #debian
21:52   -!- GreatAttitude is "Great Attitude" on #debian-offtopic #debian #nottor #tor
21:52   -!- montj2 [~montj2@2600:3c02::f03c:91ff:fe16:33b6] has joined #debian
21:52   -!- montj2 is "montj2" on #ubuntu #debian #kernelnewbies
21:53   <desert>    heres the link to the driver iv tried installing https://github.com/cookiengineer/printer-driver-dell1130/releases
21:53   -!- montj2 [~montj2@2600:3c02::f03c:91ff:fe16:33b6] has quit []
21:53   -!- montyboy [~montj2@2600:3c02::f03c:91ff:fe16:33b6] has joined #debian
21:53   -!- montyboy is "montj2" on #ubuntu #debian #kernelnewbies
21:55   -!- sidmo_ [~sidmo@p5489C3B2.dip0.t-ipconnect.de] has joined #debian
21:55   -!- sidmo_ is "sidmo" on #debian-systemd #debian-kde #debian-next #debian-offtopic #debian
21:55   -!- krabador [~krabador@000208ac.user.oftc.net] has quit [Remote host closed the connection]
21:57   -!- montyboy [~montj2@2600:3c02::f03c:91ff:fe16:33b6] has quit []
21:57   -!- montyboy [~montj2@2600:3c02::f03c:91ff:fe16:33b6] has joined #debian
21:57   -!- montyboy is "montj2" on #ubuntu #debian #kernelnewbies
22:02   -!- sidmo [~sidmo@p5489C16B.dip0.t-ipconnect.de] has quit [Ping timeout: 480 seconds]
22:02   -!- GregoryK[m] [~gregorykm@2001:470:1af1:101::79] has joined #debian
22:02   -!- GregoryK[m] is "@Gregory.K:matrix.org" on #debian
22:07   -!- nagarjung [~nagarjung@183.83.161.3] has joined #debian
22:07   -!- nagarjung is "nagarjung" on #debian #bgp
22:08   <desert>    can someone help me with getting my printer to work?
22:09   -!- paxmark9 [~paxtormar@199.167.137.205] has quit [Ping timeout: 480 seconds]
22:10   -!- hello [~hello@itl1393044.lnk.telstra.net] has joined #debian
22:10   -!- hello is "hello" on #debian
22:10   <hello> hello anyone here has some spare time pplease
22:11   -!- hello is now known as Guest2039
22:11   -!- rbern [~rbern@00021abc.user.oftc.net] has quit [Ping timeout: 480 seconds]
22:12   -!- desert [~desert@212-129-33-61.freevpn.me] has quit [Quit: Leaving]
22:13   -!- mdik [~mdik@x5ce542ea.dyn.telefonica.de] has quit [Read error: Connection reset by peer]
22:13   -!- mdik [~mdik@x4db3e996.dyn.telefonica.de] has joined #debian
22:13   -!- mdik is "Malte Dik" on #debian-next #debian #noisysq #subgraph #cryptodotis #cryptoparty #nottor #tor
22:17   <hewl>  desert: If you're still here, what version of Debian are you running? Stable, testing or unstable?
22:19   -!- nowhereman [~pierre@2a01:cb10:5c:1300:1a5e:fff:fedf:bfb0] has quit [Remote host closed the connection]
22:19   -!- paxmark9 [~paxtormar@199.167.137.205] has joined #debian
22:19   -!- paxmark9 is "siducer693" on #debian-next #siduction #vsido #debian #debian-systemd #debian-boot #kvm #debian-live
22:20   <hewl>  I should read the chat log. Guest2039 are you still here?
22:20   -!- CEP-2015-Jessie [~cep2015@181.93.22.100] has quit [Quit: Me jui]
22:21   -!- rbern [~rbern@00021abc.user.oftc.net] has joined #debian
22:21   -!- rbern is "rbern" on #virtualization #reproducible-builds #debian #debian-apt
22:23   -!- gfedel__ [~gfedel@191.34.142.248] has quit [Ping timeout: 480 seconds]
22:23   -!- jegc [~jegc@dynamic-190-27-96-5.dynamic.etb.net.co] has quit [Ping timeout: 480 seconds]
22:23   -!- k [~quassel@189.143.91.157] has quit [Read error: Connection reset by peer]
22:24   <Guest2039> yes
22:24   <Guest2039> I am still here
22:24   <hewl>  what's up?
22:25   <Guest2039> openvasmd --progress --rebuild -v
22:25   <Guest2039> Rebuilding NVT cache... failed.
22:25   <Guest2039> I m trying to connect to openvas
22:26   <Guest2039> openvas-mkcert-client -n om -i
22:26   <Guest2039> i had run this cmd in terminal
22:26   <blast007>  are you running Kali?
22:26   <Guest2039> Write out database with 1 new entries
22:26   <Guest2039> Data Base Updated
22:26   <Guest2039> Your client certificates are in /tmp/openvas-mkcert-client.2505 .
22:26   <Guest2039> You will have to copy them by hand.
22:26   <Guest2039> which gave me this output
22:26   -!- Guest2039 was kicked from #debian by debhelper [flood. Please use http://paste.debian.net instead.]
22:26   -!- Ouroboros [~Ouroboros@c-24-4-10-141.hsd1.ca.comcast.net] has joined #debian
22:26   -!- Ouroboros is "..." on #debian
22:26   <hewl>  I should have warned him about the flood feature.
22:27   -!- hello_ [~hello@itl1393044.lnk.telstra.net] has joined #debian
22:27   -!- hello_ is "hello" on #debian
22:27   <hello_>    no i m running backbox
22:27   <hewl>  hello_ Be careful, submit logs to the paste.
22:27   <blast007>  !backbox
22:27   <dpkg>  BackBox Linux is a distribution based on <Ubuntu>, developed to perform penetration tests and security assessments. It is not supported in #debian. http://www.backbox.org/ #backbox on irc.autistici.org. See also <based on debian>.
22:27   <Ouroboros> dozer: did you figure it out
22:28   -!- montyboy [~montj2@2600:3c02::f03c:91ff:fe16:33b6] has quit [Quit: WeeChat 1.4]
22:28   -!- bnw [~bnw@183.17.255.247] has joined #debian
22:28   -!- bnw is "realname" on #dot #debian-zh #debian #debian-next
22:31   -!- mjampala [~mjampala@208.146.43.5] has quit [Ping timeout: 480 seconds]
22:33   -!- mjampala [~mjampala@208.146.43.5] has joined #debian
22:33   -!- mjampala is "Mukund Jampala" on #debian #debian-next
22:37   <hello_>    ok hwel
22:40   <hello_>    i created a certificate but i dnt know where to put that certificate
22:41   -!- azamat [~azamat@r27-pw-pimpao.ibys.com.br] has joined #debian
22:41   -!- azamat is "realname" on #debian-games #debian-br #debian
22:41   -!- PoPpiLLs [~damion@2602:306:cfb5:aaf0:dd75:7bbe:d44a:977] has quit [Quit: Leaving]
22:42   <blast007>  hello_: backbox is not supported here. please use the #backbox channel on irc.autistici.org
22:43   -!- hewl [~hewl@pa49-183-75-35.pa.vic.optusnet.com.au] has quit [Quit: Konversation terminated!]
22:45   -!- sleser [~sleser@ool-1892fdfe.dyn.optonline.net] has joined #debian
22:45   -!- sleser is "my name" on #debian-offtopic #debian-kde #debian
22:49   -!- hello_ [~hello@itl1393044.lnk.telstra.net] has quit [Quit: Leaving]
22:54   -!- bastiand1 [~bastian@port-5699.pppoe.wtnet.de] has joined #debian
22:54   -!- bastiand1 is "Bastian der Große" on #debian-systemd #debian
22:56   -!- real007 [~terminato@81.61.143.173.dyn.user.ono.com] has quit [Quit: Leaving]
23:01   -!- bastiandg [~bastian@port-32615.pppoe.wtnet.de] has quit [Ping timeout: 480 seconds]
23:01   -!- khalid [~khalid@37.98.231.50] has joined #debian
23:01   -!- khalid is "khalid" on #debian
23:03   -!- khalid [~khalid@37.98.231.50] has quit []
23:07   -!- jegc [~jegc@dynamic-190-27-96-5.dynamic.etb.net.co] has joined #debian
23:07   -!- jegc is "Jorge Ernesto Guevara Cuenca" on #debian
23:11   -!- lostson [~lostson@00011d3e.user.oftc.net] has joined #debian
23:11   -!- lostson is "lostson" on #debian-gnome #thevault #debian-offtopic #debian
23:11   -!- nagarjung [~nagarjung@183.83.161.3] has quit [Ping timeout: 480 seconds]
23:13   -!- lostson [~lostson@00011d3e.user.oftc.net] has quit []
23:14   -!- GreatAttitude [~great@tsn109-201-154-159.dyn.nltelcom.net] has quit [Remote host closed the connection]
23:15   -!- eagullone [~EagullOne@00020a19.user.oftc.net] has quit [Remote host closed the connection]
23:15   -!- eagullone [~EagullOne@96.98.9.109.rev.sfr.net] has joined #debian
23:15   -!- eagullone is "Alexandre" on @#w3sh #debian #smuxi
23:16   -!- illwieckz [~illwieckz@AToulon-256-1-176-82.w83-113.abo.wanadoo.fr] has quit [Ping timeout: 480 seconds]
23:16   -!- Texou [~Texou@000178ec.user.oftc.net] has quit [Ping timeout: 480 seconds]
23:16   -!- Yoda-BZH [~yodabzh@00016bb2.user.oftc.net] has quit [Ping timeout: 480 seconds]
23:16   -!- chaos [torment@000179de.user.oftc.net] has quit [Ping timeout: 480 seconds]
23:16   -!- guardian [~guardian@planet-d.net] has quit [Remote host closed the connection]
23:16   -!- Yoda-BZH [~yodabzh@demineuse.yoda-bzh.net] has joined #debian
23:16   -!- Yoda-BZH is "Yoda-BZH" on #debian
23:16   -!- guardian [~guardian@planet-d.net] has joined #debian
23:16   -!- guardian is "guardian" on #debian
23:18   -!- mode/#debian [+l 730] by debhelper
23:18   -!- xshuiniu [~goirc@150-241-47-212.rev.cloud.scaleway.com] has quit [Ping timeout: 480 seconds]
23:21   -!- MjrWingnut [~smuxi@205.197.253.4] has joined #debian
23:21   -!- MjrWingnut is "HP Garcia" on #debian #smuxi
23:21   -!- MjrWingnut [~smuxi@205.197.253.4] has quit [Remote host closed the connection]
23:22   -!- gattuso [~gattuso@gruppoculturale.it] has quit [Remote host closed the connection]
23:23   -!- gattuso [~gattuso@gruppoculturale.it] has joined #debian
23:23   -!- gattuso is "Got ZNC?" on #xen #virtualization #uml #tor #qemu #pwmt #polimi #llvmlinux #kvm #ipv6 #ii #i2p #debian #QuakeForge
23:25   -!- chaos is "chaos" on #perl
23:25   -!- chaos [torment@000179de.user.oftc.net] has joined #debian
23:25   -!- Texou [~Texou@000178ec.user.oftc.net] has joined #debian
23:25   -!- Texou is "Jean-Philippe MENGUAL" on #debian #debian-es #debian-it #debian-devel-es #debian-devel-it #debian-mate #debian-l10n-fr #nvda #brltty #debian-a11y
23:26   -!- xshuiniu [~goirc@150-241-47-212.rev.cloud.scaleway.com] has joined #debian
23:26   -!- xshuiniu is "Powered by GoIRC" on @#xshuiniu #debian
23:28   -!- illwieckz [~illwieckz@AToulon-256-1-173-160.w83-113.abo.wanadoo.fr] has joined #debian
23:28   -!- illwieckz is "Thomas DEBESSE" on #debian #debian-bugs
23:29   -!- nowhereman [~pierre@2a01:cb10:5c:1300:1a5e:fff:fedf:bfb0] has joined #debian
23:29   -!- nowhereman is "Pierre Thierry" on @#concatenative #emacs @#git @#erights #lisp #debian-kde #debian
23:33   -!- sunilmohan_ [~quassel@183.83.4.34] has joined #debian
23:33   -!- sunilmohan_ is "Sunil Mohan Adapa" on #debian-django #debian-in #monkeysphere #debian-blends #debian-arm #freedombox #debian-boot #debian-webapps #debian-reproducible #debian
23:33   -!- sleser [~sleser@ool-1892fdfe.dyn.optonline.net] has quit [Quit: Leaving]
23:36   -!- Madars [~null@0001ae97.user.oftc.net] has quit [Quit: reconnecting]
23:36   -!- illwieckz [~illwieckz@AToulon-256-1-173-160.w83-113.abo.wanadoo.fr] has quit [Ping timeout: 480 seconds]
23:36   -!- sunilmohan [~quassel@183.83.4.34] has quit [Ping timeout: 480 seconds]
23:37   -!- dvs [~hibbard@00012127.user.oftc.net] has quit [Remote host closed the connection]
23:37   -!- KOJIbKA [~nikobit@188.124.242.42] has joined #debian
23:37   -!- KOJIbKA is "Nikolay Bitsadze" on #debian
23:38   -!- Madars [~null@0001ae97.user.oftc.net] has joined #debian
23:38   -!- Madars is "Madars" on #zcash #tor #tahoe-lafs #subgraph @#partyline #pax #leastauthority-private #leastauthority #debian-next #debian
23:41   -!- Zeeps_ [~oftc-webi@c211-30-209-18.thorn2.nsw.optusnet.com.au] has joined #debian
23:41   -!- Zeeps_ is "OFTC WebIRC Client" on #debian
23:41   <Zeeps_>    hi
23:42   <Zeeps_>    how do I troubleshoot me debian 8 servers mail config. it can't send out emails atm
23:45   -!- illwieckz [~illwieckz@AToulon-256-1-159-41.w83-113.abo.wanadoo.fr] has joined #debian
23:45   -!- illwieckz is "Thomas DEBESSE" on #debian #debian-bugs
23:48   -!- pencilandpaper [~penciland@dynamic-acs-24-239-230-203.zoominternet.net] has quit [Quit: WeeChat 1.6]
23:51   -!- sunilmohan_ [~quassel@183.83.4.34] has quit [Ping timeout: 480 seconds]
23:53   <jmcnaught> Zeeps_: look at /var/log/mail.* and/or journalctl for your mail transport agent
23:55   -!- sunilmohan [~quassel@183.83.4.34] has joined #debian
23:55   -!- sunilmohan is "Sunil Mohan Adapa" on #debian-blends #debian-webapps #debian-in #debian-boot #debian-reproducible #debian-arm #freedombox #monkeysphere #debian-django #debian
23:57   -!- illwieckz [~illwieckz@AToulon-256-1-159-41.w83-113.abo.wanadoo.fr] has quit [Ping timeout: 480 seconds]
23:58   <Ouroboros> man, the way gcc package versions are done is incredibly annoying
23:59   <Ouroboros> specifically e.g. the 'gcc' metapackage that creates links to gcc-*; what if i want an older version? then i have to manually fix all those links
--- Log closed Fri Oct 14 00:00:12 2016
