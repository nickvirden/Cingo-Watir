require_relative '../Dash_Loading'

#################
### DASHBOARD ###
#################
puts "\033[38;2;" + $headingColor +
     "#############################" + $newline +
     "### DASHBOARD || REQUESTS ###" + $newline +
     "#############################" + $newline +
     "\033[0m"

# SAVE SCREENSHOT of DASHBOARD
Screenshot()

# Show user current URL
puts "I'm now on " + $browser.url
puts $newline

# Close browser
Close()