require_relative '../SettingsTab'

successMessage = 'Profile successfully updated'

if $browser.text_field(:tag_name => 'input', :id => 'inputNickname').exists?

	# Input a random nickname
	$browser.text_field(:tag_name => 'input', :id => 'inputNickname').value = 'Dangerfield'

	# Save Changes
	SaveChanges(successMessage)
	
else

	puts "Uh oh. Check your syntax."

end

Close()