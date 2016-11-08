#############
### START ###
#############
puts "\033[38;2;" + $headingColor +
     "#############" + $newline +
     "### START ###" + $newline +
     "#############" + $newline +
     "\033[0m"

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
        if ($button === "Expert")
            
            # Continue
            $contScript = true
            # initialPage = "www.cingo.io"
            initialPage = 'www.cingo.co/experts/login'

        elsif ($button === "Customer")
            
            $contScript = true
            # initialPage = "www.cingo.co/customers/login"
            initialPage = 'www.cingo.co/customers/login'

        end # END IF
    
    end # END IF
    
end until $contScript === true # END WHILE

# Make $contScript false again to ensure that user is on right page
$contScript = false

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

# Show current URL to user
CurrentPage()

# Get the title of page
puts "You are now on the website for \033[38;2;" + $neonGreen + $browser.title + "\033[0m"
puts $newline

# Base Path
$path = File.dirname(__FILE__) + "/../screenshots/" + $button.downcase + "/operations/" + File.basename($0, ".rb")
puts "Assigning screenshot path..."
puts $path
puts $newline

# Make custom directory for script that's executed
# $0 is the script that's being run
if (File.directory? $path) === true
    
    # Do nothing
    puts "That file path already exists. Nothing to see here."
    
else
    
    FileUtils.mkpath($path)
    puts $path
    
end

# Iterate over buttons by their indexes to see what's on the page
#$browser.buttons.each_with_index do |b, index|
    
    # Tells which buttons were found
#    puts "I found the " + b.text + " button."
#end

# If the button exists
# if $browser.button(:text => $button).exists?
    
    # Click the button & Let us know you've clicked it
#    $browser.button(:text => $button).click
#    puts $newline + "I clicked the " + $button + " button!"
    
# NOT FOUND
#else
    
#    puts $newline
#    puts "It looks like the " + $button + " button doesn't exist."
#    abort
    
#end

# Add new line for readability
puts $newline