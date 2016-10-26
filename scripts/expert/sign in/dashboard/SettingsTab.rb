require_relative '../Dash_Loading'

# Case Specific
myTab = "Responses"
myBtnLabel = "Anything else..."

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

puts "I'm now on " + $browser.url
puts $newline

# If the RESPONSES tab exists
$browser.lis(:class_name => "b-tab").each_with_index do |l, index|
    
    # If the text in the <a> tag within the <li> is 'Responses'
    if l.a.text === myTab
        
        # Then click that <a> && let the user know it's been clicked
        l.a.click
        puts "I clicked the " + myTab + " tab for ya!"
        
        # SCREENSHOT
        Screenshot()
        
        puts $newline
    end
    
end

# Wait two seconds for it to load everything
sleep(2)

# ITERATE over ROWS
$browser.trs.each_with_index do |r, index|
    
    # ITERATE over CELLS in ROWS
    r.tds.each_with_index do |t, index|
                
        # If the LABEL MATCHES what I'm looking for
        if t.text === myBtnLabel

            # FOUND
            puts "I found the " + myBtnLabel + " button!"
            puts $newline

            # CLICK the EDIT BUTTON in that ROW
            r.button(:class => /btn btn-outlined btn-info action-button edit/).click

            puts "Editing..."
            puts $newline

            # WAIT for it to LOAD
            sleep(2)
            
            originalValue = $browser.div(:class => "vex-dialog-input").text_fields(:tag_name => "input")[1].value
            
            # SCREENSHOT
            Screenshot()
            
            # REPLACE TEXT in MODAL
            newValue = ($browser.div(:class => "vex-dialog-input").text_fields(:tag_name => "input")[1].value = "Yeah, so I definitely changed this field.")
            
            # WHAT WAS REPLACED
            puts "I replaced \033[38;2;255;110;64m" + originalValue + "\033[0m with \033[38;2;" + $neonGreen + newValue + "\033[0m"
            puts $newline
            
            # SCREENSHOT
            Screenshot()
            
            # CLICK OK
            $browser.div(:class => "vex-dialog-buttons").button(:type => "submit", :text => "OK").click

            puts "\033[38;2;0;255;0m" + "Edited!" + "\033[0m"
            puts $newline

        end # End of IF
    
    end # End of Cells

end # End of Rows

# SCREENSHOT
Screenshot()

# Close browser
$browser.close
$headless.destroy