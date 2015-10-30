require_relative '../rails_helper'
require_relative '../spec_helper'


include Capybara::DSL
describe "adding tag to a recipe" do
  it "should allow a user to add a tag to a recipe" do
    visit '/recipes/new'
    fill_in 'Title', :with => 'myTitle'
    fill_in 'Author', :with => 'myAuthor'
    fill_in 'Ingredients', :with => 'myIngredients'
    fill_in 'Instructions', :with => 'myInstructions'
    click_button 'Create Recipe'
    fill_in 'Tag Name', :with => 'myTag'
    click_button 'Add Tag'
    page.should have_content 'myTag'
  end
end
