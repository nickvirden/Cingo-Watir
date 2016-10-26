require 'watir'
require 'watir-webdriver'
require 'headless'

headless = Headless.new
headless.start

browser = Watir::Browser.new :phantomjs
browser.goto 'www.google.com'

browser.text_field(:name => 'q').set 'Hello World!'
browser.button(:type => 'submit').click

# Show output
puts browser.title => 'Hello World! - Google Search'
puts "Success!"

# Close browser
browser.close
headless.destroy