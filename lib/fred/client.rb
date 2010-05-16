module Fred
  
  class Client
    include HTTParty
    base_uri "http://api.stlouisfed.org/fred"
            
    def initialize(options={})
      api_key = options[:api_key] || Fred.api_key
    end

    def category(secondary, options={})
      if secondary.nil?
        response = self.class.get("/category?#{hash_to_query(options)}")
      else
        response = self.class.get("/category/#{secondary}?#{hash_to_query(options)}")			
      end
    end
    
    def releases(secondary, options={})
      if secondary.nil?
        response = self.class.get("/releases?#{hash_to_query(options)}")
      else
        response = self.class.get("/releases/#{secondary}?#{hash_to_query(options)}")			
      end
    end
    
    def release(secondary, options={})
      if secondary.nil?
        response = self.class.get("/release?#{hash_to_query(options)}")
      else
        response = self.class.get("/release/#{secondary}?#{hash_to_query(options)}")			
      end
    end
    
    def series(secondary, options={})
      if secondary.nil?
        response = self.class.get("/series?#{hash_to_query(options)}")
      else
        response = self.class.get("/series/#{secondary}?#{hash_to_query(options)}")			
      end
    end
    
    def sources(secondary, options={})
      if secondary.nil?
        response = self.class.get("/sources?#{hash_to_query(options)}")
      else
        response = self.class.get("/sources/#{secondary}?#{hash_to_query(options)}")			
      end
    end
    
    def source(secondary, options={})
      if secondary.nil?
        response = self.class.get("/source?#{hash_to_query(options)}")
      else
        response = self.class.get("/source/#{secondary}?#{hash_to_query(options)}")			
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
end