require 'test_helper'

class FredTest < Test::Unit::TestCase

  context "Fred API" do
    setup do
      @client = Fred::Client.new(:api_key => 'wtf')
    end
    
    context "and get categories" do
      should "find a specific category" do
        stub_get("http://api.stlouisfed.org/fred/category?category_id=125&api_key=wtf", "category.xml")
        category_result = @client.category(nil, :category_id => '125')
        category_result.categories.category.name.should == "Trade Balance"
      end
    end
    
    context "and get releases" do
      should "find all releases" do
        stub_get("http://api.stlouisfed.org/fred/releases?api_key=wtf", "releases.xml")
        releases_result = @client.releases(nil)
        releases_result.first.last.release.first.name.should == "Advance Monthly Sales for Retail and Food Services"
        releases_result.first.last.release.last.name.should == "Wall Street Journal"
      end
    end
        
    context "and get a release" do
      should "find a specific release" do
        stub_get("http://api.stlouisfed.org/fred/release?release_id=53&api_key=wtf", "release.xml")
        release_result = @client.release(nil, :release_id => "53")
        release_result.releases.release.name.should == "Gross Domestic Product"
      end
    end
    
    context "and get series" do
      should "find a specific series" do
        stub_get("http://api.stlouisfed.org/fred/series?api_key=wtf&series_id=GNPC", "series.xml")
        series_result = @client.series(nil, :series_id => "GNPC")
        series_result.seriess.series.title.should == "Real Gross National Product"
      end
    end
    
    context "and get source" do
      should "find a specific source" do
        stub_get("http://api.stlouisfed.org/fred/source?source_id=1&api_key=wtf", "source.xml")
        source_result = @client.source(nil, :source_id => "1")
        source_result.sources.source.name.should == "Board of Governors of the Federal Reserve System"
      end
    end
    
    context "and get sources" do
      should "find all sources" do
        stub_get("http://api.stlouisfed.org/fred/sources?&api_key=wtf&source_id=1", "sources.xml")
        sources_result = @client.sources(nil, :source_id => "1")
        sources_result.sources.source.first.name.should == "Board of Governors of the Federal Reserve System"
        sources_result.sources.source.last.name.should == "Central Bank of the Republic of Turkey"
      end
    end
    
  end

end