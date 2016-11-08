require_relative 'Dash_Loading'

# SCREENSHOT
Screenshot()

# If the SETTINGS section exists
if $browser.a(:href => /experts\/settings/)
    
    # Click it & notify the user that you clicked it
    $browser.a(:href => /experts\/settings/).click
    puts "Aaaaand I clicked the Settings button."
    puts $newline
else
    puts "Uh oh. The settings tab is not there like I expected."
    abort
end

#####################################
### SETTINGS SECTION // DASHBOARD ###
#####################################
puts "\033[38;2;" + $headingColor +
     "#####################################" + $newline +
     "### SETTINGS SECTION // DASHBOARD ###" + $newline +
     "#####################################" + $newline +
     "\033[0m"

# URL of Current Page
CurrentPage()

# If the RESPONSES tab exists
$browser.lis(:class => "b-tab").each_with_index do |l, index|
    
    puts "I found the " + l.a.text + " tab."
    
end

puts $newline

# If the tab exists
if $browser.a(:text => $properFileName).exists?
    
    $browser.a(:text => $properFileName).click
    puts "I clicked the " + $properFileName + " tab for ya!"
    puts $newline
    
    # Wait for tab to load
    sleep(2)

    # SCREENSHOT
    Screenshot()

elsif $browser.a(:text => $fileName).exists?

    $browser.a(:text => $fileName).click
    puts "I clicked the " + $fileName + " tab for ya!"
    puts $newline

    # Wait for tab to load
    sleep(2)
        
    # SCREENSHOT
    Screenshot()

else

    Screenshot()
    puts "The " + $properFileName + " tab isn't here. :O"
    abort

end

# Wait two seconds for it to load everything
sleep(3)