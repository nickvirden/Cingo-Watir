# Requirements
require 'rubygems'
require 'watir'
require 'watir-webdriver'
require 'headless'
require 'dotenv'
require 'fileutils'

# Load .env
# Must be on same level of the directory as the .env
# Dotenv.load("../../../../.env") # Since this gets shared to other files, it has to specify the path relative to that file
Dotenv.load(File.dirname(__FILE__) + "/../.env") # Since this gets shared to other files, it has to specify the path relative to that file

# Going headless
$headless = Headless.new
$headless.start

# Start a new instance of PhantomJS or Chrome
# $browser = Watir::Browser.new :phantomjs
$browser = Watir::Browser.new :chrome

# VARIABLES
# Cosmetic
$newline = "\n" # creates new line for readability
$headingColor = "76;175;80m"
$neonGreen = "0;255;0m"
expertStyling = "\033[38;2;64;196;255;1m" + "Expert" + "\033[0m"
customerStyling = "\033[38;2;255;255;0;1m" + "Customer" + "\033[0m"

# Logic
$button = ""
$contScript = false # determines whether script continues or not
$initialPage = ''
$count = 1

# Names
$fileName = File.basename($0, ".rb")
$properFileName = File.basename($0, ".rb").capitalize

### FUNCTIONS ###

# Screenshot Function
def Screenshot
    
    return $browser.screenshot.save($path + "/(#{$count}) " + $fileName + ".jpg"), $count += 1
    
end

# Current Page Getter Function
def CurrentPage

    puts "I'm now on " + $browser.url
    puts $newline

end

# Close Browser at End of Process
def Close

    # Close browser
    $browser.close
    $headless.destroy

end

# Handles Push Notification Dialgoue Boxes
def WaitOnPushNotification

    # If the push notifications pop-up exists
    if $browser.button(:id => 'onesignal-popover-cancel-button', :text => "No Thanks").exists?

        # Click it
        $browser.div(:id => 'onesignal-popover-container').button(:id => 'onesignal-popover-cancel-button', :text => "No Thanks").click
        puts "I denied push notifications."
        puts $newline

    else

        # Error message
        puts "The push notifications pop up didn't show up."

    end

    # Wait for push notifications dialogue to go away
    sleep(4)

end

# Save Changes
def SaveChanges(strSuccessMessage)

    # Click on Save Changes button
    $browser.button(:type => 'submit', :class_name => /btn btn-outlined btn-green/, :text => /Save Changes/).click

    # Wait for success message
    begin

        $browser.li(:class_name => /messenger-shown/).div(:text => strSuccessMessage).wait_until_present(5)
        puts "Changes saved!"

        Screenshot()

    rescue

        puts "Uh oh. Your changes appear not to have been saved."
        Screenshot()

    end

end

# Email Log In
def EmailLogIn

    # Find the username and password boxes by their class since only they have this particular class attached to them
    $browser.text_fields(:class => /form-control border-focus-green/).each_with_index do |r, index|
        
        # Should say that the 'email' and 'password' fields were found
        puts "I found the " + r.type + " field."
        
        # Sets username and password
        $browser.text_fields(:class => /form-control border-focus-green/)[index].set($emailCredentials[index])
            
        # Prints username and then password
        puts "I typed \033[38;2;255;64;129;1m" + $browser.text_fields(:class => /form-control border-focus-green/)[index].value + "\033[0m in the " + r.type + " input box."
            
        puts $newline
    end

    # SCREENSHOT
    Screenshot()

    # If the Sign In button exists
    if $browser.form.button(:class => /btn-cingo/).exists?
        
        # Click on it to submit the info
        $browser.form.button(:class => /btn-cingo/).click
        
        # And notify the user that it was clicked
        puts "Aaaaand I clicked Sign In."
        puts $newline
    else
        puts "I didn't find the Sign In button on " + $browser.url + " that you were looking for."
        abort
    end

end

# Log Out -- Works on Customer & Expert
def LogOut

    # If the button exists
    if $browser.li(:class => 'logout').a.exists?

        # Click it
        $browser.li(:class => 'logout').a.click
        puts "I clicked it!"
        puts $newline

    elsif $browser.li(:name => "Sign Out").a.exists?

        # Click it
        $browser.li(:name => "Sign Out").a.click
        puts "I clicked it!"
        puts $newline

    else

        # Error message
        puts "The Logout button doesn't exist, man."
        abort

    end

    # WAIT on LOGIN PAGE to LOAD
    begin
        puts "Waiting on the experts login page to load..."
        puts $newline
        
        # WAIT 20 SECONDS FOR DASHBOARD TO LOAD
        $browser.window(:url => $initialPage).wait_until_present(20)
        
        # TAKE SCREENSHOT ONCE LOADED
        Screenshot()
        
        # SUCCESS
        puts "Yahoo! The login page loaded!"

    # OTHERWISE
    rescue
        
        puts $browser.url

        # SCREENSHOT of DASHBOARD for DEBUGGING
        Screenshot()
        
        puts "The experts login didn't load. :( Check screenshots in " + $path + " to debug."
        abort
    end

end


### END FUNCTION SECTION ###