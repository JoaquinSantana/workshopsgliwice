Category.destroy_all
User.destroy_all
Product.destroy_all
Review.destroy_all

# => Generate product name based on category
def food_types(category_name)
  case category_name
  when "Fruit"
    Faker::Food.fruit
  when "Herb or spiece"
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
5.times do 
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
  password_confirmation: 'test_1234',
  admin: true
)

# => Categories with products
Category.create(name: "Fruit")
Category.create(name: "Herb or spice")
Category.create(name: "Ingredient")
Category.create(name: "Meat")
Category.create(name: "Vegetable")
Category.create(name: "Other")

25.times do |n|
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