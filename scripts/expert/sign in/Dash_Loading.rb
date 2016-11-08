require_relative 'SI'

# WAIT on DASHBOARD to LOAD
begin
    puts "Waiting on the experts dashboard to load..."
    puts $newline
    
    # WAIT 20 SECONDS FOR DASHBOARD TO LOAD
    $browser.window(:url => "http://www.cingo.io/experts/dashboard").wait_until_present(20)
    
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
     "########################" + $newline +
     "### EXPERT DASHBOARD ###" + $newline +
     "########################" + $newline +
     "\033[0m"

# URL of Current Page
CurrentPage()

# Wait for page to load
sleep(5)

# Remove push notification dialogue
WaitOnPushNotification()