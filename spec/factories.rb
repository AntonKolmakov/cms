FactoryGirl.define do
  factory :page do
   name    "Home page"
   content "Info home page goes here..."

   factory :page_child do |f|
   	f.name    "Sub page"
   	f.content "Info sub page goes here..."
   	f.parent FactoryGirl.create(:page)
   end
  end
 end