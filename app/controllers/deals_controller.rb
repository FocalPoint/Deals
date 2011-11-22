require "net/http"
class DealsController < ApplicationController
  
  def home
    #@title = "Show me the DeAlS!! | Home"
    search_str = "San Francisco"
    query = search_str.gsub(/\s/, '-')
    api_key = "207ba5e7159ca2f98f3561ca11524ad86801d031" 
    raw_data = Net::HTTP.get(URI.parse("http://api.groupon.com/v2/deals?client_id=#{api_key}&division_id=#{query}&format=json"))
    #raw_data = Net::HTTP.get(URI.parse("http://api.groupon.com/v2/deals?division_id=Chicago&client_id=#{api_key}&format=json"))
#debugger

#    deals_object = ActiveSupport::JSON.decode(raw_data) same as what's below
    @data = JSON.parse(raw_data)

  end
  
end