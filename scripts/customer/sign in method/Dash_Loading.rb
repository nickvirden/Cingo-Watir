require_relative 'ESI'
require_relative 'FBSI'
require_relative 'GSI'

# WAIT on DASHBOARD to LOAD
begin
    puts "Waiting on the experts dashboard to load..."
    puts $newline

    # WAIT 20 SECONDS FOR DASHBOARD TO LOAD
    $browser.window(:url => "http://www.cingo.co/customers/requests").wait_until_present(20)

    # TAKE SCREENSHOT ONCE LOADED
    Screenshot()

# OTHERWISE
rescue
    
    # SCREENSHOT of DASHBOARD for DEBUGGING
    Screenshot()
    puts "The page didn't load. :( Check your screenshots."
    abort
    
end