require_relative '../rails_helper'

RSpec.describe Tag, type: :model do
  it "has a name" do
    aTag = Tag.new
    aTag.name = 'tagName'
    expect(aTag.name).to eq('tagName')
  end

  it "has a non-empty tag" do
    aTag = Tag.new
    expect(aTag.valid?).to eq false
    aTag.name = "blah"
    expect(aTag.valid?).to eq true
  end

  it "should have a recipe" do
    aTag = Tag.new
    aTag.name = "new tag"
    aRecipe = Recipe.new
    aTag.recipe = aRecipe
    expect(aTag.recipe).to eq aRecipe
  end

end
