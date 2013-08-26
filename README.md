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
    
    >> fred.series(nil, :series_id => 'GNPA')
    => #<Hashie::Mash seriess=#<Hashie::Mash realtime_end="2013-08-26" realtime_start="2013-08-26" series=#<Hashie::Mash frequency="Annual" frequency_short="A" id="GNPA" last_updated="2013-07-31 09:26:17-05" notes="BEA Account Code: A001RC1" observation_end="2012-01-01" observation_start="1929-01-01" popularity="46" realtime_end="2013-08-26" realtime_start="2013-08-26" seasonal_adjustment="Not Seasonally Adjusted" seasonal_adjustment_short="NSA" title="Gross National Product" units="Billions of Dollars" units_short="Bil. of $">>>

    >> fred.series('observations', :series_id => 'GNPA')
    => #<Hashie::Mash observations=#<Hashie::Mash count="84" file_type="xml" limit="100000" observation=[#<Hashie::Mash date="1929-01-01" realtime_end="2013-08-26" realtime_start="2013-08-26" value="105.3">,
    .....
    #<Hashie::Mash date="2012-01-01" realtime_end="2013-08-26" realtime_start="2013-08-26" value="16497.4">] observation_end="9999-12-31" observation_start="1776-07-04" offset="0" order_by="observation_date" output_type="1" realtime_end="2013-08-26" realtime_start="2013-08-26" sort_order="asc" units="lin">>
## Copyright

Contact me if you have any suggestions and feel free to fork it!

Copyright (c) 2009 Johnny Khai Nguyen, released under the MIT license
