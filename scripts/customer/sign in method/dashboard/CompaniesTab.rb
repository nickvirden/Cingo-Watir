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

# If the SETTINGS button EXISTS
if $browser.a(:href => /customers\/companies/).exists?
    
    # Click it & notify the user that you clicked it
    $browser.a(:href => /customers\/companies/).click
    puts "Aaaaand I clicked the Companies button."
    puts $newline
end

puts "\033[38;2;" + $headingColor +
     "#############################" + $newline +
     "### DASHBOARD || COMPANIES ###" + $newline +
     "#############################" + $newline +
     "\033[0m"

# Show the user what page the script is on
puts "I'm now on " + $browser.url
puts $newline

# Close browser
Close()