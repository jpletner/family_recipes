require_relative "../rails_helper"

include Capybara::DSL
describe "search recipes by tag" do

  it "should have an empty recipe search field on home page" do
    visit '/recipes'
    expect(find_field('Enter Tag').value).to eq nil
  end

  it "should take us to the search page when search button is clicked on home page" do
    visit '/recipes'
    expect(find_field('Enter Tag').value).to eq nil
    fill_in 'Enter Tag', :with => 'tagName'
    click_button 'Search'
    page.should have_content 'Recipe Search Page'
  end

  it "should have an empty recipe search field on search page" do
    visit '/tags/search'
    expect(find_field('Enter Tag').value).to eq nil
    page.should have_no_content 'Recipes Found:'
    page.should have_no_content 'No Recipes Found:'
  end

# It "should tell us nothing is found if there are no recipes for search tag"
#     visit '/tags/search?search_string=frog'  #steal from page url
#     Create recipe and tag
#     Save them
#     Then test
#
# end
#
#
# it "should display recipes corresponding to tag search" do
#     visit '/tags/search?search_string=chicken'  #steal from page url
#     Create recipe and tag
#     Save them
#     Then test
#
# end

end
