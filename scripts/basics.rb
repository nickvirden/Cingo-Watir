# Requirements
require 'rubygems'
require 'watir'
require 'watir-webdriver'
require 'headless'
require 'dotenv'
require 'fileutils'

# Load .env
# Must be on same level of the directory as the .env
Dotenv.load("../../../../.env") # Since this gets shared to other files, it has to specify the path relative to that file

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
initialPage = 'www.cingo.co'
$count = 1

# Base Path
$path = "/vagrant/screenshots/" + $button.downcase + "/operations/" + File.basename($0, "Tab.rb")

# Screenshot Function
def Screenshot
    
    return $browser.screenshot.save($path + "/(#{$count}) " + File.basename($0, ".rb") + ".jpg"), $count += 1
    
end

# CORRECT WEBSITE? 
while $contScript === false

    # Make sure that we're on the page we actually wanted to visit
    puts $newline
    puts "So, you wanted to go to \033[38;2;" + $neonGreen + initialPage + "\033[0m, right? [Y/n]"
    response = gets.chomp
    
    # YES
    if (response.upcase === "YES") | (response.upcase === "Y")
        
        # CONTINUE SCRIPT
        $contScript = true
        
        puts $newline
        puts "Great! Onward!" 
        
        puts $newline
        puts "Loading..." + $newline
                
    # NO
    else
        
        puts "Oops! Where did you want to go?"
        response = gets.chomp
        
    end # End IF

end # End WHILE

# Webpage we want to start at
$browser.goto initialPage

# Get the title of page
puts "You are now on the website for \033[38;2;" + $neonGreen + $browser.title + "\033[0m"
puts $newline

#############
### START ###
#############
puts "\033[38;2;" + $headingColor +
     "#############" + $newline +
     "### START ###" + $newline +
     "#############" + $newline +
     "\033[0m"

# Iterate over buttons by their indexes to see what's on the page
$browser.buttons.each_with_index do |b, index|
    
    # Tells which buttons were found
    puts "I found the " + b.text + " button."
end

# Readability
puts $newline

# LOG IN TYPE
begin
    
    # Reset to false
    $contScript = false
    
    # Expert or Customer?
    if ($button != "Expert") | ($button != "Customer")
        
        # Find out which button to click
        puts "Are you trying to log in as an " + expertStyling + " or a " + customerStyling + "?"
        $button = gets.chomp.capitalize
        
        # IF EITHER
        if ($button === "Expert") | ($button === "Customer")
            
            # Continue
            $contScript = true
        
        end # END IF
    
    end # END IF
    
end until $contScript === true # END WHILE
    
# Make custom directory for script that's executed
# $0 is the script that's being run
if FileUtils.mkpath($path).exists? === true
    
    # Do nothing
    
else
    
    FileUtils.mkpath($path)
    
end

# If the button exists
if $browser.button(:text => $button).exists?
    
    # Click the button & Let us know you've clicked it
    $browser.button(:text => $button).click
    puts $newline + "I clicked the " + $button + " button!"
    
# NOT FOUND
else
    
    puts $newline
    puts "It looks like the " + $button + " button doesn't exist."
    abort
    
end

# Add new line for readability
puts $newline