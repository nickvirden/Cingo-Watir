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

    # Locate email and password input fields
    $browser.text_fields(:class => /form-control/).each_with_index do |r, index|

        # Tells which buttons were found
        puts "I found the " + r.type + " field."

        # Sets username & password
        $browser.text_fields(:class => /form-control border-focus-green/)[index].set($emailCredentials[index])

        # Prints username on first iteration and password on second
        puts "I typed \033[38;2;255;64;129m" + $browser.text_fields(:class => /form-control border-focus-green/)[index].value + "\033[0m in the " + r.type + " input box."

        puts $newline
    end
    
    # SCREENSHOT
    Screenshot()
    
    # FIND SIGN IN BUTTON
    $browser.form.button(:class => /btn-cingo/, :text => /Sign In/).click

end # END EMAIL LOGIN SCRIPT