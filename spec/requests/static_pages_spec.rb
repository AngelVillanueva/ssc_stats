require 'spec_helper'

describe "StaticPages" do

  describe "Temp home" do
    before { visit root_path }
    subject { page }
    it "should work" do
      get '/'
      response.status.should be(200)
    end
    it { should have_content( "Bienvenidos" ) }
    it { should have_title( "Santa Cristina | Inicio" ) }
  end
end
