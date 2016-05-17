# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks
## got to finish cron this daily
desc "setting data for cron daily job"
task :set_days_data => [:environment] do
  today = Day.new(Date.today)
  puts "DAY SUCCESSFULLY CREATED"
  puts "Date: #{today.date}"
  puts "Quote: #{today.quote.text}"
  puts "Quote Author: #{today.quote.author}"
end

# review of rake stuff slated for chopping block
# , "daily_setup:set_news", "daily_setup:set_poem", "daily_setup:set_quote", "daily_setup:set_fact"
#  namespace :daily_setup do

#     task :set_news do
#       puts "news set"
#     end

#     task :set_poem do
#       puts "poem set"
#     end

#     task :set_quote do
#       puts "quote set"
#     end

#     task :set_fact do
#       puts "fact set"
#     end

  # end