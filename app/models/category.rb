class Category < ActiveRecord::Base
  has_many :products
  has_many :reviews, through: :products

  validates :name, uniqueness: true
end
