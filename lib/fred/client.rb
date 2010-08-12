module Fred
  
  class Client
    include HTTParty
    base_uri "http://api.stlouisfed.org/fred"
    format :xml
        
    attr_reader :api_key
                
    def initialize(options={})
      @api_key = options[:api_key] || Fred.api_key
    end

    def category(secondary, options={})
      if secondary.nil?
        mashup(self.class.get("/category", :query => options.merge(self.default_options)))
      else
        mashup(self.class.get("/category/#{secondary}", :query => options.merge(self.default_options)))			
      end
    end
    
    def releases(secondary, options={})
      if secondary.nil?
        mashup(self.class.get("/releases", :query => options.merge(self.default_options)))
      else
        mashup(self.class.get("/releases/#{secondary}", :query => options.merge(self.default_options)))			
      end
    end
    
    def release(secondary, options={})
      if secondary.nil?
        mashup(self.class.get("/release", :query => options.merge(self.default_options)))
      else
        mashup(self.class.get("/release/#{secondary}", :query => options.merge(self.default_options)))			
      end
    end
    
    def series(secondary, options={})
      if secondary.nil?
        mashup(self.class.get("/series", :query => options.merge(self.default_options)))
      else
        mashup(self.class.get("/series/#{secondary}", :query => options.merge(self.default_options)))			
      end
    end
    
    def sources(secondary, options={})
      if secondary.nil?
        mashup(self.class.get("/sources?", :query => options.merge(self.default_options)))
      else
        mashup(self.class.get("/sources/#{secondary}", :query => options.merge(self.default_options)))			
      end
    end
    
    def source(secondary, options={})
      if secondary.nil?
        mashup(self.class.get("/source", :query => options.merge(self.default_options)))
      else
        mashup(self.class.get("/source/#{secondary}", :query => options.merge(self.default_options)))			
      end
    end
    
    protected
    
    def default_options
      {:api_key => @api_key}
    end
    
    def mashup(response)
      case response.code
      when 200
        if response.is_a?(Hash)
          Hashie::Mash.new(response)
        else
          if response.first.is_a?(Hash)
            response.map{|item| Hashie::Mash.new(item)}
          else
            response
          end
        end
      end
    end

  end
end