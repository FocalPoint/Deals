require 'spec_helper'

describe DealsController do
  describe "GET 'home'" do
    it "should deliver" do
      get 'home'
      response.should be_success
    end 
    it "a title should be present" do
      get 'home'
      response.should have_selector("title", :content => "Deals!")
    end 
  end
  
  describe "GET 'show' " do
    it "should deliver" do
      get 'show'
      response.should be_success
    end 
  end
  
end