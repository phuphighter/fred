# Fred
require 'rubygems'
gem 'httparty'
require 'httparty'
require 'uri'

module Fred
	
	def self.fred(parent, child, options={})
	  if secondary.nil?
      response = HTTParty.get("http://api.stlouisfed.org/fred/#{parent}?#{hash_to_query(options)}&api_key=#{FRED_API_KEY}")
    else
      response = HTTParty.get("http://api.stlouisfed.org/fred/#{parent}/#{child}?#{hash_to_query(options)}&api_key=#{FRED_API_KEY}")      
    end
	end
  
  private
  
  def hash_to_query(hash)
    hash.keys.inject('') do |query_string, key|
      query_string << '&' unless key == hash.keys.first
      query_string << "#{URI.encode(key.to_s)}=#{URI.encode(hash[key])}"
    end
  end

end
