soup = Recipe.create(title: 'Best Chicken Soup', author: 'Pletner', ingredients: 'Chicken, Noodles, Broth', instructions: 'Mix it!' )
pasta = Recipe.create(title: 'Best Pasta Ever', author: 'Brysiewicz', ingredients: 'Tomatoes, Noodles, Sausage', instructions: 'Cook it!' )


['Chicken', 'Soup', 'Snack'].each do |s|
  soup.tags.create(name: s)
end

['Dinner', 'Night', 'Meal'].each do |s|
  pasta.tags.create(name: s)
end

[5, 4].each do |s|
  soup.ratings.create(rate: s)
end

[3, 4].each do |s|
  pasta.ratings.create(rate: s)
end 
