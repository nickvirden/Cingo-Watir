require_relative '../expert'

### Environment Variables
$emailCredentials = [ENV["HONEYBADGER"], ENV["FERRET"]]

#########################
### EXPERT LOGIN PAGE ###
#########################
puts "\033[38;2;" + $headingColor +
     "#########################" + $newline +
     "### EXPERT LOGIN PAGE ###" + $newline +
     "#########################" + $newline +
     "\033[0m"

# URL of Page
CurrentPage()

# WAIT for PAGE to LOAD
sleep(5)

# SCREENSHOT
Screenshot()

# Log In via Email
EmailLogIn()