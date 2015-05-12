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

class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :content, :rating, :user_id, presence: true
end
