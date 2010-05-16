# Fred
require 'rubygems'
gem 'httparty'
require 'httparty'
require 'uri'

directory = File.expand_path(File.dirname(__FILE__))

# Hash.send :include, Hashie::HashExtensions

module Fred
  
  # create config/initializers/fred.rb
  # 
  # Fred.configure do |config|
  #   config.api_key = 'api_key'
  # end
  # client = Fred::Client.new
  
  def self.configure
    yield self
    true
  end

  class << self
    attr_accessor :api_key
  end
  
end

require File.join(directory, 'fred', 'client')
