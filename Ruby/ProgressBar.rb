require 'ruby-progressbar'

ProgressBar.create

ProgressBar.methods(false)

50.times { ProgressBar.decrement }

