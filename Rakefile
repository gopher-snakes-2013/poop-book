require 'sinatra/activerecord/rake'
require './socialnetwork_app'

begin
  require "rspec/core/rake_task"
  desc "Run all examples"
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = %w[--color]
  end

  task :default => :spec
rescue LoadError
end

