require 'spec_helper'

describe "StaticPages" do

  describe "Temp home" do
    it "should work" do
      get '/'
      response.status.should be(200)
    end
    it "should have the Hello string" do
      visit root_path
      expect( page ).to have_content( "Hello" )
    end
  end
end
