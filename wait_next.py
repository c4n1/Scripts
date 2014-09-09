#!/usr/bin/python

#Import stuff
import sys,time,dbus

#Get first cmd line arg as input
innumb = sys.argv[1]

#Convert input to int
innumbint = int(innumb)
print ('Sleeping for:',innumbint,'minutes')

#Do input * 60 so we get seconds to use in sleep
seconds = innumbint * 60
print ('which is',seconds,'seconds')

#Sleep for however long
time.sleep(seconds)
print ('Slept for',seconds,'seconds')

# Clementine lives on the Session bus
session_bus = dbus.SessionBus()

# Get Clementine's player object, and then get an interface from that object,
# otherwise we'd have to type out the full interface name on every method
player = session_bus.get_object('org.mpris.clementine', '/Player')
iface = dbus.Interface(player, dbus_interface='org.freedesktop.MediaPlayer')

iface.Next()
