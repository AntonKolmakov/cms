require 'spec_helper'

describe "Pages" do
  describe "Home page Site" do
   it "should have the content @page.content" do
      visit '/pages/1'
      page.should have_content('Home page')
    end
  end
end
