   30 rem
   40 rem   eliza/doctor
   50 rem   created by joseph weizenbaum
   60 rem
   70 rem  ----------initialization------------
   75 poke 53280,0: poke53281,0
   80 printchr$(147):t$="initializing...":gosub790
   90 dimc$(72),i$(72),k$(72),f$(72),s$(72),r$(72),p$(72),z$(72)
  100 dim s(36),r(37),n(36)
  110 n1=36:n2=12:n3=112
  120 forx=1ton1+n2+n3:readz$:nextx:rem same as restore
  130 forx=1ton1
  140 reads(x),l:r(x)=s(x):n(x)=s(x)+l-1
  150 nextx
  155 t$="hello, i'm eliza. what is your problem?":gosub780
  160 rem
  170 rem    ------- user  input  section----------
  180 rem
  190 poke 646,1:print
  195 print:poke19,1:input"> ";i$:poke19,0:print:print
  198 poke646,14
  200 ifi$=""thent$="you're not particularly verbal, are you?":gosub790:goto190
  210 ifi$="bye"ori$="quit"ori$="exit"ori$="shut up"then860
  220 i$=" "+i$+"  "
  230 forl=1tolen(i$)
  240 ifmid$(i$,l,1)="'"theni$=left$(i$,l-1)+right$(i$,len(i$)-l):goto230
  260 nextl
  270 ifi$=p$thent$="please don't repeat yourself!":gosub790:goto160
  271 t$="thinking...    ":gosub790
  280 rem
  290 rem    --------find keyword in i$-----
  300 rem
  310 restore
  320 s=0
  330 fork=1ton1
  340 readk$
  350 ifs>0then390
  360 forl=1tolen(i$)-len(k$)+1
  370 ifmid$(i$,l,len(k$))=k$thens=k:t=l:f$=k$
  380 nextl
  390 nextk:ifs>0thenk=s:l=t:goto420
  400 k=36:goto620:rem we didn't find any keywords
  410 rem
  420 rem     take right part of string and conjugate it
  430 rem     using the list of strings to be swapped
  440 rem
  450 restore:forx=1ton1:readz$:nextx:rem skip over keywords
  460 c$=" "+right$(i$,len(i$)-len(f$)-l+1)
  470 forx=1ton2/2
  480 reads$,r$
  490 forl=1tolen(c$)
  500 ifl+len(s$)=len(c$)then550
  510 ifmid$(c$,l,len(s$))<>s$then550
  520 c$=left$(c$,l-1)+r$+right$(c$,len(c$)-l-len(s$)+1)
  530 l=l+len(r$)
  540 goto580
  550 ifl+len(r$)>len(c$)then580
  560 ifmid$(c$,l,len(r$))<>r$then580
  570 c$=left$(c$,l-1)+s$+right$(c$,len(c$)-l-len(r$)+1)
  580 nextl
  590 nextx
  600 ifmid$(c$,2,1)=" "thenc$=right$(c$,len(c$)-1):rem only 1 space
  610 rem
  620 rem   now using the keyword number (k) get reply
  630 rem
  640 restore:forx=1ton1+n2:readz$:nextx
  650 forx=1tor(k):readf$:nextx:rem  read right reply
  660 r(k)=r(k)+1:ifr(k)>n(k)thenr(k)=s(k)
  670 ifright$(f$,1)<>"*"andright$(f$,1)<>"#"thent$=f$:gosub780:p$=i$:goto160
  680 ifright$(f$,1)="*"then720
  690 ifright$(c$,1)=" "thenc$=left$(c$,len(c$)-1):goto690
  700 ifright$(c$,1)="."orright$(c$,1)="?"orright$(c$,1)="!"thengoto740
  710 ifright$(f$,1)="#"thent$=left$(f$,len(f$)-1)+c$+"?":gosub780:goto730
  720 t$=left$(f$,len(f$)-1)+c$:gosub780
  730 p$=i$:goto160
  740 c$=left$(c$,len(c$)-1):goto700
  750 rem
  760 rem   -------- output routine --------------
  770 rem
  780 fori=1to15:printchr$(20);:forj=1to25:nextj:nexti
  790 fori=1tolen(t$)
  800 printmid$(t$,i,1);
  810 forj=1to25:next
  820 next
  830 return
  840 rem
  850 rem   -------- exit program ----------------
  860 rem
  870 t$="talk to you soon. good bye!":gosub790
  880 fori=1to2000:next
  890 poke53280,14:poke53281,6:printchr$(147)
  900 end
 1000 rem
 1010 rem   ---------program data follows----------
 1020 rem
 1030 rem       keywords
 1040 rem
 1050 data "can you","can i","you are","youre","i dont","i feel"
 1060 data "why dont you","why cant i","are you","i cant","i am","im "
 1070 data "you ","i want","what","how","who","where","when","why"
 1080 data "name","cause","sorry","dream","hello","hi ","maybe"
 1090 data "no ","your","always","think","alike","yes","friend"
 1100 data "computer","nokeyfound"
 1110 rem
 1120 rem     string data for conjugations
 1130 rem
 1140 data " are "," am ","were ","was "," you "," i "," your ","my "
 1150 data " ive "," yourve "," im "," youre "
 1160 rem
 1170 rem    replies
 1180 rem
 1190 data "don't you believe that i can#"
 1200 data "perhaps you would like to be able to*"
 1210 data "you want me to be able to#"
 1220 data "perhaps you don't want to*"
 1230 data "do you want to be able to#"
 1240 data "what makes you think i am#"
 1250 data "does it please you to believe i am?"
 1260 data "perhaps you would like to be*"
 1270 data "do you sometimes wish you were#"
 1280 data "don't you really?"
 1290 data "why don't you#"
 1300 data "do you wish to be able to#"
 1310 data "does that trouble you?"
 1320 data "tell me more about such feelings."
 1330 data "do you often feel#"
 1340 data "do you enjoy feeling#"
 1350 data "do you really believe i don't#"
 1360 data "perhaps in good time i will*"
 1370 data "do you want me to#"
 1380 data "do you think you should be able to#"
 1390 data "why can't you#"
 1400 data "why are you interested in whether or not i am#"
 1410 data "would you prefer if i were not#"
 1420 data "perhaps in your fantasies i am*"
 1430 data "how do you know you can't#"
 1440 data "have you tried?"
 1450 data "perhaps you can now*"
 1460 data "did you come to me because you are#"
 1470 data "how long have you been#"
 1480 data "do you believe it is normal to be#"
 1490 data "do you enjoy being#"
 1500 data "we were discussing you - not me."
 1510 data "oh, i*"
 1520 data "you're not really talking about me, are you?"
 1530 data "what would it mean to you if you got#"
 1540 data "why do you want#"
 1550 data "suppose you soon got#"
 1560 data "what if you never got#"
 1570 data "i sometimes also want*"
 1580 data "why do you ask?"
 1590 data "does that question interest you?"
 1600 data "what answer would please you the most?"
 1610 data "what do you think?"
 1620 data "are such questions on your mind often?"
 1630 data "what is it that you really what to know?"
 1640 data "have you asked anyone else?"
 1650 data "have you asked such questions before?"
 1660 data "what else comes to mind when you ask that?"
 1670 data "names don't interest me."
 1680 data "i don't care about names --  please go on."
 1690 data "is that the real reason?"
 1700 data "don't any other reasons come to mind?"
 1710 data "does that reason explain anything else?"
 1720 data "what other reasons might there be?"
 1730 data "please don't apologize!"
 1740 data "apologies are not necessary."
 1750 data "what feeling do you have when you apologize?"
 1760 data "don't be so defensive!"
 1770 data "what does that dream suggest to you?"
 1780 data "do you dream often?"
 1790 data "what persons appear in your dreams?"
 1800 data "are you disturbed by your dreams?"
 1810 data "how do you do?  please state your problem."
 1820 data "you don't seem quite certain."
 1830 data "why the uncertain tone?"
 1840 data "can't you be more positive?"
 1850 data "you aren't sure?"
 1860 data "don't you know?"
 1870 data "are you saying 'no' just to be negative?"
 1880 data "you are being a bit negative."
 1890 data "why not?"
 1900 data "are you sure?"
 1910 data "why 'no'?"
 1920 data "why are you concerned about my#"
 1930 data "what about your own#"
 1940 data "can you think of a specific example?"
 1950 data "when?"
 1960 data "what are you thinking of?"
 1970 data "really?  *always*?"
 1980 data "do you really think so?"
 1990 data "but you are not sure you#"
 2000 data "do you doubt you#"
 2010 data "in what way?"
 2020 data "what resemblance do you see?"
 2030 data "what does the similarity suggest to you?"
 2040 data "what other connections do you see?"
 2050 data "could there really be some connection?"
 2060 data "how?"
 2070 data "you seem quite positive."
 2080 data "are you sure?"
 2090 data "i see."
 2100 data "i understand."
 2110 data "why bring up the topic of friends?"
 2120 data "do your friends worry you?"
 2130 data "do your friends pick on you?"
 2140 data "are you sure you have any friends?"
 2150 data "do you impose on your friends?"
 2160 data "perhaps your love for friends worries you."
 2170 data "do computers worry you?"
 2180 data "are you talking about me in particular?"
 2190 data "are you frightened by machines?"
 2200 data "why do you mention computers?"
 2210 data "what do you think machines have to do with your problem?"
 2220 data "don't you think computers can help people?"
 2230 data "what is it about computers that worries you?"
 2240 data "say, do you have any psychological problems?"
 2250 data "what does that suggest to you?"
 2260 data "i see."
 2270 data "i'm not sure i understand you fully."
 2280 data "come, come, elucidate your thoughts."
 2290 data "can you elaborate on that?"
 2300 data "that is quite interesting."
 2310 rem
 2320 rem    data for finding right replies
 2330 rem
 2340 data 1,3,4,2,6,4,6,4,10,4,14,3,17,3,20,2,22,3,25,3
 2350 data 28,4,28,4,32,3,35,5,40,9,40,9,40,9,40,9,40,9,40,9
 2360 data 49,2,51,4,55,4,59,4,63,1,63,1,64,5,69,5,74,2,76,4
 2370 data 80,3,83,7,90,3,93,6,99,7,106,6
 2380 end
