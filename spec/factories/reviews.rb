# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  content    :text
#  rating     :integer
#  created_at :datetime
#  updated_at :datetime
#  product_id :integer
#  user_id    :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    content "MyText"
    rating 1
  end
end
