require_relative 'SI'

# WAIT on DASHBOARD to LOAD
begin
    puts "Waiting on the experts dashboard to load..."
    puts $newline
    
    # WAIT 20 SECONDS FOR DASHBOARD TO LOAD
    $browser.window(:url => "http://www.cingo.co/experts/dashboard").wait_until_present(20)
    
    # TAKE SCREENSHOT ONCE LOADED
    Screenshot()
    
# OTHERWISE
rescue
    
    # SCREENSHOT of DASHBOARD for DEBUGGING
    Screenshot()
    
    puts "The dashboard didn't load. :( Check screenshots to debug."
    abort
end

#################
### DASHBOARD ###
#################
puts "\033[38;2;" + $headingColor +
     "#################" + $newline +
     "### DASHBOARD ###" + $newline +
     "#################" + $newline +
     "\033[0m"

puts "I'm now on " + $browser.url
puts $newline