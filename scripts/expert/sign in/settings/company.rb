require_relative '../SettingsTab'

# Success message to be passed to the SaveChanges function
successMessage = "Company details successfully updated"

# If phone number input field exists
if $browser.text_field(:tag_name => 'input', :id => 'inputPhone').exists?

	# Put in a non-numeric input
	$browser.text_field(:tag_name => 'input', :id => 'inputPhone').value = 'abcdefg'

	# Save the changes
	SaveChanges(successMessage)

	# Log out
	LogOut()

	# Log back in
	EmailLogIn()

    ### WAIT ON DASHBOARD TO LOAD ###
    begin

	    puts "Waiting on the experts dashboard to load..."
	    puts $newline
	    
	    # WAIT 20 SECONDS FOR DASHBOARD TO LOAD
	    $browser.window(:url => "http://www.cingo.io/experts/dashboard").wait_until_present(20)
	    
	    # TAKE SCREENSHOT ONCE LOADED
	    Screenshot()
    
	# OTHERWISE
	rescue
	    
	    # SCREENSHOT of DASHBOARD for DEBUGGING
	    Screenshot()
	    
	    puts "The dashboard didn't load. :( Check screenshots to debug."
	    abort
	end

	#################
	### DASHBOARD ###
	#################
	puts "\033[38;2;" + $headingColor +
	     "########################" + $newline +
	     "### EXPERT DASHBOARD ###" + $newline +
	     "########################" + $newline +
	     "\033[0m"

	# URL of Current Page
	CurrentPage()

	# Wait for page to load
	sleep(5)

	# Remove push notification dialogue
	WaitOnPushNotification()
	puts $newline

	# Click the Settings tab & notify the user that you clicked it
    $browser.a(:href => /experts\/settings/).click
    puts "Aaaaand I clicked the Settings button."
    puts $newline

    # Click the Company tab
    $browser.a(:text => $properFileName).click
    puts "I clicked the " + $properFileName + " tab for ya!"
    puts $newline
        
    # SCREENSHOT
    Screenshot()

    # Check to see if the phone number field has been cleared after putting in bad data
    if ($browser.text_field(:tag_name => 'input', :id => 'inputPhone').value === '') & ($browser.text_field(:tag_name => 'input', :id => 'inputPhone').value != 'abcdefg')

    	puts "There's no erroneous data here, so it looks like everything is okay."
    	puts $newline

    	puts "Assigning valid data..."
    	puts $newline

    	# Random 10-digit phone number
    	randomPhoneNumber = rand(1..9).to_s +
    						rand(9).to_s +
    						rand(9).to_s +
    						rand(1..9).to_s +
    						rand(9).to_s +
    						rand(9).to_s +
    						rand(9).to_s +
    						rand(9).to_s +
    						rand(9).to_s +
    						rand(9).to_s


    	# Assign random US phone number
    	$browser.text_field(:tag_name => 'input', :id => 'inputPhone').value = randomPhoneNumber

    	# Check to see if the value is okay
    	puts "The new phone number is " + $browser.text_field(:tag_name => 'input', :id => 'inputPhone').value
    	puts $newline

    	# Screenshot
    	Screenshot()

    	# Save the changes
		SaveChanges(successMessage)
		puts $newline

		# Wait for changes to fully save
		sleep(1)

		# Refresh the page
		$browser.refresh

		# Wait for page to refresh
		sleep(4)

		# Click the Company tab
	    $browser.a(:text => $properFileName).click
	    puts "I clicked the " + $properFileName + " tab for ya!"
	    puts $newline

	    # Screenshot
	    Screenshot()

	    # Finish
	    puts "Finished!"

    else

    	puts "Uh oh. The old, erroneous data must still be there. :O"
    	Screenshot()
    	abort

    end

else

	puts "An input field with that tag name doesn't exist."
	abort

end

# Close browser
Close()