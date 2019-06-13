#!/bin/ksh
# This script is invoked by /usr/lpp/X11/bin/xinit

#****************************************************************
#								*
#     Set the X server's keyboard keysyms to the match the	*
#     engravings of the user's keyboard.			*
#								*
#****************************************************************

KBD=""
XDIR=/usr/lpp/X11/defaults/xmodmap

#*****************************************************************
#
#   - Querying odm (querykbd) to get keyboard id (e.g. En_US).
#
#   - If querykbd returns NULL or there is no keyboard file found,
#  then the environment variable $LANG is used for the keymap.
#
#*****************************************************************


if [ -r $HOME/.Xkeyboard ]
then
    KBD=$HOME/.Xkeyboard
else
    KBD_LANG=`/usr/lpp/X11/bin/querykbd`
    if [ $KBD_LANG = "NULL" ]
    then
	dspmsg $MSG/xinit.cat 1 '1356-801 xinit: Failed to query omd for keyboard id'
    fi

    if [ "$KBD_LANG" != "En_US" ]
    then
        if [ -r $IMKEYMAPPATH/$KBD_LANG/keyboard ]
        then
             KBD=$IMKEYMAPPATH/$KBD_LANG/keyboard
        else
            if [ "$IMKEYMAPPATH" = "/usr/lib/nls/im.alt"     	\
                -a -r $XDIR/$KBD_LANG/keyboard.alt ]
            then
                KBD=$XDIR/$KBD_LANG/keyboard.alt
            else
                if [ -r $XDIR/$KBD_LANG/keyboard ]
                then
                    KBD=$XDIR/$KBD_LANG/keyboard
                fi
            fi
        fi
    fi
fi


###
# sleep 1 to make sure xclock can get started.
###

if [ "$KBD" != "" ]
then
    xclock -geometry -0+0 -fg Blue -bg Wheat -hd CadetBlue -hl Blue &
    xbiff -geometry 130x50-200+0 &
    sleep 1
    xmodmap $KBD
else
    if [ -r $XDIR/$LANG/keyboard ]
    then
	xclock -geometry -0+0 -fg Blue -bg Wheat -hd CadetBlue -hl Blue &
        xbiff -geometry 130x50-200+0 &
        sleep 1
	xmodmap $XDIR/$LANG/keyboard
    fi
fi


#****************************************************************
#								*
#  Start the X clients.  Change the following lines to		*
#  whatever command(s) you desire!				*
#								*
#  The default clients are an analog clock (xclock), an hft 	*
#  terminal emulator (aixterm), the X Desktop Manager (xdt), 	*
#  and the Motif Window Manager (mwm).				*
#								*
#****************************************************************

xrdb -load $HOME/.Xresources

aixterm -sb -sl 128 -i -T "CommandShell" -geometry 80x25+0-0 -fg Wheat -bg MidnightBlue & 

# if [ -x /usr/lpp/X11/bin/xdt3 ]
# then 
#	/usr/lpp/X11/bin/xdt3 &
# fi

exec mwm
