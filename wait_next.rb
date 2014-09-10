#!/bin/ruby

#Take inputs
#	time to wait
#	what to do


#adds optparse and creates empty hash for options
require 'optparse'
require 'ruby-progressbar'


options = {}

#Starts option parser
OptionParser.new do|opts|
	#Creates banner 
	#Need to learn how
	opts.banner = "Usage: example.rb [options]"
	#Sets up time input
	opts.on('-t', '--time TIME', 'time in format hours:minutes') { |v| options[:time] = v }


end.parse!

#puts "time = #{options[:time]}"


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


hours_in_minutes = hours * 60
sleep_minutes = hours_in_minutes + minutes
sleep_seconds = sleep_minutes * 60

puts sleep_seconds


#Countdown timer







#waitseconds = 20

#ProgressBar.create




#
#wait = Time.now + waitseconds
#	while Time.now < wait
#		ProgressBar.incriment
#		sleep 1
#	end
#








#Functions for options




#Call correct function
