require_relative '../expert'

### Environment Variables
$signUpCredentials = ['PidgeonWorks', 'pidgeonworks', 'Tyrone', 'Swoopes', ENV["HONEYBADGER"], ENV["FERRET"]]

#########################
### EXPERT LOGIN PAGE ###
#########################
puts "\033[38;2;" + $headingColor +
     "#########################" + $newline +
     "### EXPERT LOGIN PAGE ###" + $newline +
     "#########################" + $newline +
     "\033[0m"

puts "I'm now on " + $browser.url

# Add new line for readability
puts $newline

# WAIT for PAGE to LOAD
sleep(5)

# SCREENSHOT
Screenshot()

# If the Sign In button exists
if $browser.a(:text => /Sign Up/).exists?
    
    # Click on it to submit the info
    $browser.a(:text => /Sign Up/).click
    
    # And notify the user that it was clicked
    puts "Aaaaand I clicked Sign Up."
    puts $newline
else
    puts "I didn't find the Sign Up button on " + $browser.url + " that you were looking for."
    abort
end

####################
### SIGN UP PAGE ###
####################
puts "\033[38;2;" + $headingColor +
     "####################" + $newline +
     "### SIGN UP PAGE ###" + $newline +
     "####################" + $newline +
     "\033[0m"

# Current page
CurrentPage()

# SCREENSHOT
Screenshot()

# Find the username and password boxes by their class since only they have this particular class attached to them
$browser.text_fields(:class => /form-control border-focus-green/).each_with_index do |r, index|
    
    # Should say that the 'email' and 'password' fields were found
    puts "I found the " + r.type + " field."
    
    # Sets username and password
    $browser.text_fields(:class => /form-control border-focus-green/)[index].set($signUpCredentials[index])
        
    # Prints username and then password
    puts "I typed \033[38;2;255;64;129;1m" + $browser.text_fields(:class => /form-control border-focus-green/)[index].value + "\033[0m in the " + r.type + " input box."
        
    puts $newline
end

# SCREENSHOT
Screenshot()

# If the Sign In button exists
if $browser.button(:class => /btn-cingo/, :text => /Sign Up/).exists?
    
    # Click on it to submit the info
    $browser.button(:class => /btn-cingo/, :text => /Sign Up/).click
    
    # And notify the user that it was clicked
    puts "Aaaaand I clicked Sign Up."
    puts $newline
else
    puts "I didn't find the Sign In button on " + $browser.url + " that you were looking for."
    abort
end