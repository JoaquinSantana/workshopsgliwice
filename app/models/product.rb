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

class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates :title, :description, :price, presence: true
  validates_format_of :price, :with => /\A\d+(?:\.\d{0,2})?\z/

  def average_rating
    reviews.pluck(:rating).sum / reviews.size.to_f
  end
  
end
