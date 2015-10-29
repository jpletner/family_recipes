require 'rails_helper'

RSpec.describe "recipes/new", type: :view do
  before(:each) do
    assign(:recipe, Recipe.new(
      :title => "MyString",
      :author => "MyString",
      :ingredients => "MyText",
      :instructions => "MyText"
    ))
  end

  it "renders new recipe form" do
    render

    assert_select "form[action=?][method=?]", recipes_path, "post" do

      assert_select "input#recipe_title[name=?]", "recipe[title]"

      assert_select "input#recipe_author[name=?]", "recipe[author]"

      assert_select "textarea#recipe_ingredients[name=?]", "recipe[ingredients]"

      assert_select "textarea#recipe_instructions[name=?]", "recipe[instructions]"
    end
  end
end
