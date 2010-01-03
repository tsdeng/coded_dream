# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

task :deploy do
  sh "git add ."
  puts "-------------input commit message------------"
  message=STDIN.gets.chomp
  
  sh "git commit -m '#{message}' "
  sh "git push heroku master"
  sh "heroku rake db:migrate"
  sh "heroku open"
end

task :all_users=>:environment do
  users=User.find(:all)
  p users
end