### IMPORTANT: ALL URLS SHOULD BE 'HTTP', NOT 'HTTPS'

##################################
### TEST AUTOMATION WITH WATIR ###
##################################

# Any variable with a $ in front can be found in basics.rb
require_relative '../basics'

# This file is mostly empty because the Customer folder tree has a deep scope. If the commands from the bottom of that tree are executed, the Dotenv loader needs to scope all the way up from those files to the .env variable.