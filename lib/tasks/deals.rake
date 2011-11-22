require "net/http"

desc "Fetches deals from the Groupon API"
task :fetch_deals => :environment do
      search_str = "San Francisco"
      query = search_str.gsub(/\s/, '-')
      api_key = "207ba5e7159ca2f98f3561ca11524ad86801d031" 
      raw_data = Net::HTTP.get(URI.parse("http://api.groupon.com/v2/deals?client_id=#{api_key}&division_id=#{query}&format=json"))
      @data = JSON.parse(raw_data)
      
      @data["deals"].each do |deal_hash|
        perma_link = deal_hash["id"]
        lg_image = deal_hash["largeImageUrl"]
        buy_url = deal_hash["buyUrl"]
        title = deal_hash["title"]
        
        description = ""
        if deal_hash["details"].present?
          details = deal_hash["details"]
          if details.present? && details.first["description"].present?
            description = details.first["description"]
          end
        end
        
        orig_price = 0
        if deal_hash["value"].present? && deal_hash["value"]["amount"].present?
          orig_price = deal_hash["value"]["amount"]/100
        end
        discount = 0
        if deal_hash["discount"].present? && deal_hash["discount"]["amount"].present?
          discount = deal_hash["discount"]["amount"]/100
        end
        
        Deal.create(:title => title, :large_image_url => lg_image, :description => description, 
        :buy_url => buy_url, :original_price => orig_price, :discount => discount, :perma_link => perma_link)
        
      end 
      
end