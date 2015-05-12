# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  price       :float
#  created_at  :datetime
#  updated_at  :datetime
#  category_id :integer
#  user_id     :integer
#

FactoryGirl.define do
  factory :product do
    title "MyString"
    description "MyText"
    price 1.5
    user
    category
  end
end
