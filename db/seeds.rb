Category.destroy_all
User.destroy_all
Product.destroy_all
Review.destroy_all

# => Generate product name based on category
def food_types(category_name)
  case category_name
  when "Fruit"
    Faker::Food.fruit
  when "Spice"
    Faker::Food.herb_or_spice
  when "Ingredient"
    Faker::Food.ingredient
  when "Meat"
    Faker::Food.meat
  when "Vegetable"
    Faker::Food.vegetable
  else
    Faker::Product.product
  end
end

# => Users accounts
25.times do 
  User.create(
    firstname: Faker::Name.first_name, 
    lastname: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'test1234',
    password_confirmation: 'test1234'
  )
end

# => Admin
User.create(
  firstname: 'Janko',
  lastname: 'Muzykant',
  email: 'admin@example.com',
  password: 'test1234',
  password_confirmation: 'test1234',
  admin: true
)

# => Categories with products
Category.create(name: "Fruit", image_url: "http://images.all-free-download.com/images/graphiclarge/fruit_pictures_02_hd_pictures_167531.jpg")
Category.create(name: "Spice", image_url: "http://spiritualityhealth.com/sites/default/files/styles/fb_share/public/100520504-spices.jpg?itok=hj7cRCwS")
Category.create(name: "Ingredient", image_url: "http://images.all-free-download.com/images/graphiclarge/colorful_spices_194600.jpg")
Category.create(name: "Meat", image_url: "http://images.all-free-download.com/images/graphiclarge/beef_raw_ingredient_221942.jpg")
Category.create(name: "Vegetable", image_url: "http://images.all-free-download.com/images/graphiclarge/fruits_and_vegetables_a_collection_of_picture_167168.jpg")
Category.create(name: "Other", image_url: "http://images.all-free-download.com/images/graphiclarge/ingredients_picture_167111.jpg")

50.times do |n|
  category = Category.all.sample(1).first
  title = food_types(category.name)

  Product.create!(title: title,
    description: Faker::HealthcareIpsum.sentence,
    price: rand(1..255),
    category: category
  )
end

# => Reviews
Product.all.each do |product|
  rand(10..25).times do 
    Review.create!(
      content: Faker::HealthcareIpsum.sentence,
      rating: rand(1..5),
      user: User.all.sample(1).first,
      product: product
   )
  end
end