require_relative '../rails_helper'

RSpec.describe Recipe, type: :model do

  it "has a title" do
    aRecipe = Recipe.new
    aRecipe.title = 'myTitle'
    expect(aRecipe.title).to eq('myTitle')
  end

  it "has validations on title" do
    aRecipeEmpty = Recipe.new
    aRecipeEmpty.ingredients = 'y'
    aRecipeEmpty.instructions = 'x'
    expect(aRecipeEmpty.valid?).to eq false
    # aRecipeEmpty.title = '   z   '
    # expect(aRecipeEmpty.valid?).to eq true
  end

  it "has an author (maybe)" do
    aRecipe = Recipe.new
    aRecipe.author = 'myAuthor'
    expect(aRecipe.author).to eq('myAuthor')
  end

  it "has ingredients" do
    aRecipe = Recipe.new
    aRecipe.ingredients = 'myIngredients'
    expect(aRecipe.ingredients).to eq('myIngredients')
  end

  it "has validations on ingredients" do
      aRecipe = Recipe.new
      aRecipe.title= 'y'
      aRecipe.instructions = 't'
      expect(aRecipe.valid?).to eq false
      # aRecipe.ingredients='  x   '
      # expect(aRecipe.valid?).to eq true
  end

  it "has instructions" do
    aRecipe = Recipe.new
    aRecipe.instructions = "myInstructions"
    expect(aRecipe.instructions).to eq('myInstructions')
  end

  it "has validations on instructions" do
      aRecipe = Recipe.new
      aRecipe.title= 'y'
      aRecipe.ingredients = 't'
      expect(aRecipe.valid?).to eq false
      # aRecipe.instructions='  x   '
      # expect(aRecipe.valid?).to eq true
  end

  it "has a ratings" do

  end


  it "has a average rating" do

    aRecipe = Recipe.new

    aRecipe.save

    aRating1 = Rating.new
    aRating1.rate = 1
    aRating1.save
    aRating2 = Rating.new
    aRating2.rate = 2
    aRating2.save

    aRecipe.ratings << aRating1
    aRecipe.ratings << aRating2
    aRecipe.save

    expect(aRecipe.avg_rating).to eq 1.5

  end

end
