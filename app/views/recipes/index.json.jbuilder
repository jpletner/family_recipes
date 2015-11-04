json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :title, :author, :ingredients, :instructions, :image
  json.url recipe_url(recipe, format: :json)
end
