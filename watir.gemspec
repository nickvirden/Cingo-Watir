# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
    
    s.name        = 'Automated Scripting'
    s.version     = '1.0'
    s.platform    = Gem::Platform::RUBY
    s.authors     = 'Nick Virden'
    s.email       = 'nickvirden@gmail.com'
    s.homepage    = 'www.cingo.co'
    s.summary     = 'Automated Testing Scripts for Cingo'
    s.description = "These are various scripts that test the functionality of the Cingo website."

    s.license     = 'MIT'
    
    s.add_development_dependency 'watir'
    s.add_development_dependency 'watir-webdriver'
    
end