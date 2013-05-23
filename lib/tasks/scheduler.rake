desc "This searches twitters top trending terms"


task :search_trends => :environment do
  puts "Searching Trends"

  file = File.join(Rails.root, 'Bot_Phrase_Fun.rb')
  puts "Runnng #{file}"
  load(file) if File.exist?(file)

  puts "done."
end