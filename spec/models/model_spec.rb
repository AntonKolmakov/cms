# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Page do

  before { @page = Page.new(name: "Site", content: "Home page") }

  subject { @page }

  it { should respond_to(:name) }
  it { should respond_to(:content) }

  it { should be_valid }

  describe "when name is not present" do
    before { @page.name = " " }
    it { should_not be_valid }
  end
  describe "when name is too long" do
    before { @page.name = "a" * 21 }
    it { should_not be_valid }
  end
  describe "when name format is invalid" do
    it "should be invalid" do
      @page.name = "名前"
      @page.should_not be_valid
    end
  end
  describe "when name format is valid" do
    it "should be valid" do
      records = %w[name1 name3 имя_страницы]
      records.each do |valid_record|
        @page.name = valid_record
        @page.should be_valid
      end
    end
  end
end