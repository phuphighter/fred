require 'test/unit'
require 'pathname'
require 'rubygems'

require 'shoulda'
require 'matchy'
require 'fakeweb'

begin require 'redgreen'; rescue LoadError; end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'fred'

# Set the default allow_net_connect option--usually you'll want this off.
# You don't usually want your test suite to make HTTP connections, do you?

FakeWeb.allow_net_connect = false

class Test::Unit::TestCase
end

def fixture_file(filename)
  return '' if filename == ''
  file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/' + filename)
  File.read(file_path)
end

def fred_url(url, options={})
  url =~ /^http/ ? url : "http://api.stlouisfed.org/fred#{url}"
end

def stub_get(url, filename, options={})
  opts = {:body => fixture_file(filename)}.merge(options)

  FakeWeb.register_uri(:get, fred_url(url), opts)
end