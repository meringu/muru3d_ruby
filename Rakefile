require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

task 'muru3d' do
  $LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
  require 'muru3d'

  Muru3d::Window.new.show
end
