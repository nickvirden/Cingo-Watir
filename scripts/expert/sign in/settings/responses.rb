require_relative '../SettingsTab'

myBtnLabel = 'Anything else...'

if $browser.button(:text => myBtnLabel).exists?

	puts "I found the " + myBtnLabel + " button!"
    puts $newline

	# ITERATE over ROWS
	$browser.trs.each_with_index do |r, index|

	    # ITERATE over CELLS in ROWS
	    r.tds.each_with_index do |t, index|

	    	# If the label text is the same as the response whose content I want to modify
	    	if t.text === myBtnLabel

            	# CLICK the EDIT BUTTON in the ROW that contains myBtnLabel
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

			end

		end # End of Cells

	end # End of Rows

else
	
	CurrentPage()
	Screenshot()
	puts "I couldn't find the " + myBtnLabel + " label."
	abort

end

# SCREENSHOT
Screenshot()

# Close browser
Close()