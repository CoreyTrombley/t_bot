desc "This task is called by the Heroku scheduler add-on"


task :search_trends => :environment do
  puts "Searching Trends"

  file = File.join(Rails.root, 'Bot_Phrase_Fun.rb')
  puts "Runnng #{file}"
  load(file) if File.exist?(file)

  puts "done."
end