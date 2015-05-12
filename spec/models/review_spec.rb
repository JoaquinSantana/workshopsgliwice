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

require 'spec_helper'

describe Review do
  describe 'validations' do
    it { should validate_presence_of :content }
    it { should validate_presence_of :rating }
    it { should validate_presence_of :user_id }
    it { should belong_to :user }

  end
end
