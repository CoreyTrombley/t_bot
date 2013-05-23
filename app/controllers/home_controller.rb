class HomeController < ApplicationController
  def index
    @client = Twitter::Client.new(:consumer_key => "q4tCkWhYwpRMDb509AJzHA", :consumer_secret => "HZ4BFFhmVTkgUIxWSjvNa921n4MS3J0PTsZPH0fZfM", :oauth_token => "1433884764-o9PtsVgvUSMOqHwkBgQunTtRX9sLGRxxqMdQgcN", :oauth_token_secret => "gR8Q5quHUhBkKh8vvgp2VtRBfFXIKXrugroF1G2cqw")
  end
end
