require 'spec_helper'

describe "Page" do

  let(:page_child) {FactoryGirl.create(:page_child) }
  before { @parent = page_child.parent }

  it "should be the child page" do
    page_child.should equal(page_child)
  end
  it "should be the root page" do
    @parent.should_not be_nil
    @parent.root? == true
    @parent.children == page_child
  end

  describe "create new root page" do
  	
  	before { visit new_page_path }

  	let(:submit) { "Create page" }

    describe "with valid format" do
      before do
      	visit new_page_path
        fill_in "Name",    with: @parent.name
        fill_in "Content", with: @parent.content
      end

  	  it "should create a page" do
        expect { click_button submit }.to change(Page, :count).by(1)
      end

      describe "after creating on a page" do

      	subject { page }

      	before { visit page_path(@parent) }

      	it { should have_selector('title', text: @parent.name) }
      	it { should have_selector('p', text: @parent.content)  }
      	it { should have_link(@parent.name, href: page_path(@parent)) }
      	it { expect(page).to have_content 'Sub page' }
      	it { has_link?('Sub page') }
      	it { find_link(page_child.name).visible? }
      end
    end
  end
end
