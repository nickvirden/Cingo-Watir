### IMPORTANT: ALL URLS SHOULD BE 'HTTP', NOT 'HTTPS'

##################################
### TEST AUTOMATION WITH WATIR ###
##################################

# Any variable with a $ in front can be found in basics.rb
require_relative '../basics'

# Cosmetic Variables
emailStyle = "\033[38;2;221;83;71;1m" + "Email (E)" + "\033[0m"
facebookStyle = "\033[38;2;25;118;210;1m" + "Facebook (F)" + "\033[0m"
googleStyle = "\033[38;2;72;133;237;1m" + "G" + "\033[0m" +
            "\033[38;2;219;50;54;1m" + "o" + "\033[0m" +
            "\033[38;2;244;194;13;1m" + "o" + "\033[0m" +
            "\033[38;2;72;133;237;1m" + "g" + "\033[0m" +
            "\033[38;2;60;186;84;1m" + "l" + "\033[0m" +
            "\033[38;2;219;50;54;1m" + "e" + "\033[0m" +
            "\033[38;2;229;57;53;1m" + " (G)" + "\033[0m"

###########################
### SIGN IN METHOD PAGE ###
###########################
puts "\033[38;2;" + $headingColor +
     "###########################" + $newline +
     "### SIGN IN METHOD PAGE ###" + $newline +
     "###########################" + $newline +
     "\033[0m"

puts "I'm now on " + $browser.url

# SCREENSHOT
Screenshot()

# Add new line for readability
puts $newline

# WAIT for PAGE to LOAD
puts "Waiting for page to load..."
sleep(5)

# LOG IN TYPE
begin
    
    # Reset to false
    $contScript = false
    
    # Email, Facebook, or Google login?
    if ($button != "E") | ($button != "F") | ($button != "G")
        
        # Find out which button to click
        puts "Are you trying to log in with " + emailStyle + ", " + facebookStyle + ", or " + googleStyle + " [ E/F/G ]?"
        
        # Response
        $button = gets.chomp.upcase
        
        puts $newline
                
        # IF ANY
        if ($button === "E")
            
            # Click the 'Sign in with email' button
            $browser.button(:class => /btn-default/).click
            
            puts emailStyle + " it is!"
            puts $newline
            
            # Continue
            $contScript = true
        
        elsif ($button === "F")
            
            # Click the 'Sign in with Facebook' button
            $browser.button(:class => /btn-facebook/).click
            
            puts facebookStyle + " it is!"
            puts $newline
            
            # Continue
            $contScript = true
            
        elsif ($button === "G")
            
            # Click the 'Sign in with Google' button
            $browser.button(:class => /btn-google/).click
            
            puts googleStyle + " it is!"
            puts $newline
            
            # Continue
            $contScript = true
            
        end # END IF
    
    else
        
        puts "The options are email, Facebook, or Gmail, so let's try this again."
        puts $newline
    
    end # END IF
    
end until $contScript === true # END WHILE