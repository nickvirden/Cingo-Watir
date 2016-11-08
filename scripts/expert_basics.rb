require_relative 'basics'

#############
### START ###
#############
puts "\033[38;2;" + $headingColor +
     "######################" + $newline +
     "### START - EXPERT ###" + $newline +
     "######################" + $newline +
     "\033[0m"

$initialPage = 'http://www.cingo.io/experts/login'

puts "Loading " + $initialPage + $newline

# Webpage we want to start at
$browser.goto $initialPage

# Wait a few seconds for page to load
sleep(4)

# Get the title of page
puts "You are now on \033[38;2;" + $neonGreen + $browser.title + "\033[0m" + "'s website"
puts $newline

# Base Path
$path = File.dirname(__FILE__) + "/../screenshots/expert/operations/" + File.basename($0, ".rb")
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