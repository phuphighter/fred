# Fred

This is a Ruby wrapper for the St. Louis Federal Reserve Economic Data [Fred API](http://api.stlouisfed.org/).

## Installation

As a gem:

    sudo gem install fred

As a plugin (in your Rails directory):

    script/plugin install git://github.com/phuphighter/fred.git
    
## Get a FRED API key

Sign up for a Fred API key: [http://api.stlouisfed.org/api_key.html](http://api.stlouisfed.org/api_key.html)
    
## Usage

### Instantiate a client

    >> fred = Fred::Client.new(:api_key => 'your_api_key')
    
### or configure once

    >> Fred.configure do |config|
    >>   config.api_key = 'your_api_key'
    >> end
    >> fred = Fred::Client.new
    
#### Examples

    >> fred.category(nil, :category_id => '125')
    => <#Hashie::Mash categories=<#Hashie::Mash category=<#Hashie::Mash id="125" name="Trade Balance" parent_id="13">>>
    
    >> fred.series(nil, :series_id => 'GNPC')
    => <#Hashie::Mash seriess=<#Hashie::Mash realtime_end="2008-07-29" realtime_start="2008-07-29" series=<#Hashie::Mash frequency="Annual" frequency_short="A" id="GNPCA" last_updated="2008-03-27 11:16:06-05" observation_end="2007-01-01" observation_start="1929-01-01" realtime_end="2008-07-29" realtime_start="2008-07-29" seasonal_adjustment="Not Applicable" seasonal_adjustment_short="NA" title="Real Gross National Product" units="Billions of Chained 2000 Dollars" units_short="Bil. of Chained 2000 $">>>

## Copyright

Contact me if you have any suggestions and feel free to fork it!

Copyright (c) 2009 Johnny Khai Nguyen, released under the MIT license
