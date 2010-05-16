# Fred

This is a Ruby wrapper for the St. Louis Federal Reserve Economic Data [Fred API](http://api.stlouisfed.org/).

## Installation

In your Rails directory:

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
    => {"categories"=>{"category"=>{"name"=>"Trade Balance", "id"=>"125", "parent_id"=>"13"}}}
    
    >> fred.series("categories", :series_id => 'EXJPUS')
    => {"categories"=>{"category"=>[{"name"=>"Monthly Rates", "id"=>"95", "parent_id"=>"15"}, {"name"=>"Japan", "id"=>"275", "parent_id"=>"158"}]}}

## Copyright

Contact me if you have any suggestions and feel free to fork it!

Copyright (c) 2009 Johnny Khai Nguyen, released under the MIT license
