require 'ruby-progressbar'

progressbar = ProgressBar.create

progressbar.methods(false)

50.times { progressbar.increment }

