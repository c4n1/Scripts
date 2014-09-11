#!/bin/ruby

#Take inputs
#	time to wait
#	what to do


#adds optparse and creates empty hash for options
require 'optparse'
require 'ruby-progressbar'
require 'dbus'


options = {}

#Starts option parser
OptionParser.new do|opts|
	#Creates banner 
	#Need to learn how
	opts.banner = "Usage: example.rb [options]"
	#Sets up time input
	opts.on('-t', '--time TIME', 'time in format hours:minutes') { |v| options[:time] = v }


end.parse!


#Process inputs

time = options[:time]

#Blank vars
hours = '0'
minutes = '00'
#If time has : split it into two vars and the convert to int
if time.include? ":"
	hours, minutes = time.split(":")
	Integer hours
	hours = hours.to_i
	Integer minutes
	minutes = minutes.to_i
#If not empty assume is minutes and covert to int
else 
	Integer time
	minutes = time.to_i
end


#Test time vars and then output how long to wait
if hours == '0'
	puts "Sleeping for #{minutes}m"
	#sleep_seconds = minutes * 60
else
	puts "Sleeping for #{hours}h#{minutes}m"
end

#Convert input into seconds
hours_in_minutes = hours.to_f * 60
sleep_minutes = hours_in_minutes + minutes
sleep_seconds = sleep_minutes * 60

#divide seconds by 100 so we can sleep for each one and incriment progress bar by one each time
sleep_percent = sleep_seconds / 100

puts sleep_percent


#Create progress bar
pbar = ProgressBar.create(:title => "Time To", :remainder_mark => "-", :format => '%t: |%B| %e')



#Loop 100 times sleeping for sleep_percent each time and incrimenting the progress bar
for i in 1..100 do
	pbar.increment
	#sleep 1
	sleep sleep_percent
end




bus = DBus::SessionBus.instance

clementine = bus.service("org.mpris.clementine").object('/org/mpris/MediaPlayer2')
clementine.introspect
clementine.default_iface = 'org.mpris.MediaPlayer2.Player'

#clementine.PlayPause
clementine.Next
#clementine.Previous
#clementine.Stop

