$LOAD_PATH.unshift(File.expand_path('.'))


require 'socialnetwork_app'
require 'capybara/rspec'

Capybara.app = Sinatra::Application

