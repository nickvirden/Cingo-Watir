require_relative '../SettingsTab'

# Local variables
notificationBtns = {
	'Email Notifications' => ['queueingOption', '1', '0'],
	'SMS Notifications' => ['schedulingOption', '0', '1']
}

successMessage = 'Notification preferences successfully updated'

# Change radio button settings
notificationBtns.each do |key, value|

	# If the radio button exists and is set
	if $browser.radio(:name => value[0], :value => value[1]).exists? & $browser.radio(:name => value[0], :value => value[1]).set?

		# If it's set, that means that notifications are enabled
		puts "#{key} were enabled."

		# Disable Email Notifications
		$browser.radio(:name => value[0], :value => value[2]).set
		puts "#{key} are now disabled."
		puts $newline

		Screenshot()

	else

		puts "It seems the radio button you're looking for doesn't exist or isn't set as expected."
		Screenshot()

		abort

	end

end

# If the SMS Notification radio button exists
if $browser.select_list(:id => 'inputCompany').exists?

	# Get a random whole number from 1 to 30
	randomMinutes = rand(30).to_s + " minutes"

	# Select the 20 minutes option
	$browser.select_list(:id => 'inputCompany').select(randomMinutes)

	# For verification of change
	puts "The Pre-call reminder was set to " + randomMinutes + "."
	puts $newline

	Screenshot()

else

	puts "It seems the select list item you're looking for doesn't exist."
	Screenshot()
	
	abort

end

# Save New Changes
SaveChanges(successMessage)
puts $newline

# Send Test Notification (Optional)
# $browser.button(:type => 'submit', :class_name => /btn btn-outlined btn-green/, :text => /Test Notification/).click
# puts "Test notification sent. Please check your texts, email, or both."

# Reset the buttons to their defaults
puts "Restoring default settings..."

$browser.radio(:name => 'queueingOption', :value => '1').set      # Email enabled
$browser.radio(:name => 'schedulingOption', :value => '0').set    # SMS disabled
$browser.select_list(:id => 'inputCompany').select('3 minutes')   # Pre-call notification @ 3 minutes

# Save Default Settings
SaveChanges(successMessage)

# Screenshot
Screenshot()

# Close browser
Close()