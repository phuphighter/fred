# Fred
require 'rubygems'
gem 'httparty'
require 'httparty'

directory = File.expand_path(File.dirname(__FILE__))

module Fred
  
  # create config/initializers/fred.rb
  # 
  # Fred.configure do |config|
  #   config.api_key = 'api_key'
  # end
  # client = Fred::Client.new
  #
  # or
  #
  # Fred.api_key = 'api_key'
  #
  # or
  #
  # Fred::Client.new(:api_key => 'api_key')
  
  def self.configure
    yield self
    true
  end

  class << self
    attr_accessor :api_key
  end
  
end

require File.join(directory, 'fred', 'client')
