#!/bin/bash
# ------------------------------------------------------
# file:     $HOME/Scripts/wmfstatus.sh
# author:   Ramon Solis - http://cyb3rpunk.wordpress.com
# modified: February 2011
# vim:fenc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=sh:
# ------------------------------------------------------

# -----
# Paths
# -----
ICONPATH="$HOME/.wmfsicons/status/"

# -------------
# Defining VARS
# -------------
		DATE=$(date "+%H:%M")
		SDA4=$(df -h /home | awk '/home/ {print $4}')
		SDA2=$(df -h / | awk '/\/$/ {print $3}')
		TEMP=$(acpi -t | awk '{print $4}' | tr -d '.0')
		VOL=$(amixer get Master | awk '/Front\ Left:/ {print $5}' | tr -d '[]')
		MEM=$(free -t -m | grep '^Total:' | awk '{print $3}')
		# CPU lines courtesy Procyon: https://bbs.archlinux.org/viewtopic.php?pid=661592
		CPU0=$(eval $(awk '/^cpu0 /{print "previdle=" $5 "; prevtotal=" $2+$3+$4+$5 }' /proc/stat); 
            sleep 0.4; 
            eval $(awk '/^cpu0 /{print "idle=" $5 "; total=" $2+$3+$4+$5 }' /proc/stat); 
            intervaltotal=$((total-${prevtotal:-0})); 
            echo "$((100*( (intervaltotal) - ($idle-${previdle:-0}) ) / (intervaltotal) ))")
		CPU1=$(eval $(awk '/^cpu1 /{print "previdle=" $5 "; prevtotal=" $2+$3+$4+$5 }' /proc/stat); 
            sleep 0.4; 
            eval $(awk '/^cpu1 /{print "idle=" $5 "; total=" $2+$3+$4+$5 }' /proc/stat); 
            intervaltotal=$((total-${prevtotal:-0})); 
            echo "$((100*( (intervaltotal) - ($idle-${previdle:-0}) ) / (intervaltotal) ))")

# ---------
# The print 
# ---------
wmfs -s " 
		\i[900;3;0;0;$ICONPATH/temp.png]\ 
		\s[914;11;#DCDCDC;$TEMP °]\ 
		\s[937;12;#8F8F8F;|]\ 
		\i[944;3;0;0;$ICONPATH/cpu.png]\ 
		$(gauge 959 3 40 3 '#df0031' 1 '#333333' $CPU0) 
		$(gauge 959 9 40 3 '#df0031' 1 '#333333' $CPU1) 
		\s[1007;12;#8F8F8F;|]\ 
		\i[1014;3;0;0;$ICONPATH/mem.png]\ 
		\s[1028;11;#DCDCDC;$MEM MB]\ 
		\s[1064;12;#8F8F8F;|]\ 
		\i[1072;3;0;0;$ICONPATH/hd.png]\ 
		\s[1085;11;#DCDCDC;/: $SDA2]\ 
		\s[1120;11;#DCDCDC;/home: $SDA4]\ 
		\s[1173;12;#8F8F8F;|]\ 
		\i[1180;3;0;0;$ICONPATH/spkr_01.png]\ 
		$(gauge 1194 4 35 6 '#2c8cd7' 1 '#333333' $VOL) 
		\s[1237;12;#8F8F8F;|]\ 
		\i[1243;3;0;0;$ICONPATH/clock.png]\ 
		\s[1257;11;#DCDCDC;$DATE]\ 
		"
