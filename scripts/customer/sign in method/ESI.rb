# $button = "E"

require_relative '../customer'

# EMAIL LOGIN SCRIPT
if $button === "E"

    ### Environment Variables
    $emailCredentials = [ENV["LILY"], ENV["LILAC"]]

    ########################
    ### EMAIL LOGIN PAGE ###
    ########################
    puts "\033[38;2;" + $headingColor +
         "########################" + $newline +
         "### EMAIL LOGIN PAGE ###" + $newline +
         "########################" + $newline +
         "\033[0m"

    puts "I'm now on " + $browser.url

    # WAIT for PAGE to LOAD
    sleep(4)
    
    # SCREENSHOT
    Screenshot()

    # Email Log In
    EmailLogIn()

end # END EMAIL LOGIN SCRIPT