require 'dbus'

bus = DBus::SessionBus.instance

clementine = bus.service("org.mpris.clementine").object('/org/mpris/MediaPlayer2')
clementine.introspect
clementine.default_iface = 'org.mpris.MediaPlayer2.Player'

#clementine.PlayPause
clementine.Next
#clementine.Previous
#clementine.Stop

