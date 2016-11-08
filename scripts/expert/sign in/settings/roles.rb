require_relative '../SettingsTab'

# Success message to be passed to the SaveChanges function
successMessageOne = "Topic successfully created."
successMessageTwo = "Topic successfully deleted."
successMessageThree = "Group successfully created."
successMessageFour = "Group successfully deleted."

listOfTopics = ['Lost Items', 'Lost Kittens', 'Superheroes', 'Dragons', 'Norse Mythology']
randomTopic = listOfTopics[rand(0..4)]

#############
### TOPIC ###
#############

$browser.divs(:class_name => 'col-sm-6').each_with_index do |d, index|

	if index === 0

		# CREATE NEW TOPIC

		# Click Create New Topic button
		d.button(:text => "Create New Topic").click
		puts "Creating a new topic..."
		puts $newline

		sleep(1)
		
		Screenshot()

		# Input a random topic
		$browser.text_field(:tag_name => 'input', :placeholder => 'Topic').value = randomTopic
		puts "The new topic is #{randomTopic}."
		puts $newline

		sleep(1)

		Screenshot()
		
		# Click OK to save topic
		$browser.button(:text => 'OK').click
		puts "Topic saved."
		puts $newline

		sleep(1)

		Screenshot()

		# ADD NEW TOPIC TO EXPERT'S LIST OF TOPICS

		# For each table row in this div 
		d.trs.each_with_index do |t, index|

			# If the topic text is equal to the random topic in this particular row and it exists
			if t.span(:class_name => 'label', :text => randomTopic).exists?

				# Then click the button in this row
				t.button(:class_name => /enable/).click
				puts "Adding topic."
				puts $newline

				$browser.li(:class_name => /messenger-shown/).div(:text => successMessageOne).wait_until_present(5)

				Screenshot()

				# Select the expert to add it to
				$browser.select_list(:id => 'editId').select('Nick Virden')
				puts "I selected the expert."
				puts $newline

				sleep(1)

				Screenshot()

				sleep(1)

				# Click OK to save topic
				$browser.button(:text => 'OK').click
				puts "I saved the #{randomTopic} with an expert"
				puts $newline

				sleep(3)

				Screenshot()

			end

		end

		# CHANGE NEW TOPIC'S NAME


		# REFRESH & CHECK FOR UPDATE


		# DELETE TOPIC FROM EXPERT'S LIST OF TOPICS


		# DELETE TOPIC ENTIRELY




	else


	end

end


#############
### GROUP ###
#############