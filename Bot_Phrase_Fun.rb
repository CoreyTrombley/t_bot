#!/usr/bin/env ruby

require 'rubygems'
require 'chatterbot/dsl'
require 'faker'
require 'pry'

# remove this to send out tweets
# debug_mode

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

  users = []

  tweet phrase

  client.trends.each do |term|
    t = term.name
    search t do |tweet|
      users << tweet.user.screen_name
    end
  end

  users.shuffle.first(15).each do |user|
    client.follow(user)
    puts "I followed ==|#{user}|=="
  end

  # explicitly update our config
  update_config
  
  # sleep 920 # 12hours = 43200 1hour = 3600


