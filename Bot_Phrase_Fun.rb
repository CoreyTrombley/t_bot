#!/usr/bin/env ruby

require 'rubygems'
require 'chatterbot/dsl'
require 'faker'

# remove this to send out tweets
# debug_mode


#
# Set some date defaults for Sequel
#
Sequel.datetime_class = DateTime
Sequel.default_timezone = :utc

#
# grab a copy of the db handle
#
db = Sequel.connect('postgres://x:x@ec2-107-20-217-22.compute-1.amazonaws.com:5432/de395fd2kr3i38')


# remove this to update the db
# no_update

# create a new client connection
client = Twitter::Client.new(:consumer_key => "q4tCkWhYwpRMDb509AJzHA", :consumer_secret => "HZ4BFFhmVTkgUIxWSjvNa921n4MS3J0PTsZPH0fZfM", :oauth_token => "1433884764-o9PtsVgvUSMOqHwkBgQunTtRX9sLGRxxqMdQgcN", :oauth_token_secret => "gR8Q5quHUhBkKh8vvgp2VtRBfFXIKXrugroF1G2cqw")
phrase = Faker::Company.catch_phrase
# remove this to get less output when running
# verbose

# here's a list of users to ignore
blacklist 

# here's a list of things to exclude from searches
exclude "spammer", "junk", "http://"

  users = {}
  user = ""
  next_tweet_id = 0
  highest_retweet = 0

  client.trends.each do |term|
    t = term.name
    search(t, :lang => "en") do |tweet|
      users[tweet.user.screen_name] = tweet.retweet_count
      # puts tweet.id
      # puts tweet.retweet_count
      if highest_retweet < tweet.retweet_count
        highest_retweet = tweet.retweet_count
        next_tweet_id = tweet.id
        user = tweet.user.screen_name
      end
      # puts ""
    end
  end

  users.each_pair do |key, value|
    if value == users.values.max
      puts "the user is @#{key} and their tweet was retweeted #{value} times."
    end
  end

  client.follow(user)
  retweet(next_tweet_id)
  puts "I followed @#{user}"

  # users.shuffle.first(3).each do |user|
  #   client.follow(user)
  #   puts "I followed @#{user}"
  # end

  # explicitly update our config
  update_config
  
  # sleep 920 # 12hours = 43200 1hour = 3600


