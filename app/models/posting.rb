# == Schema Information
#
# Table name: postings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  item_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Posting < ApplicationRecord
    
    belongs_to :user
    belongs_to :item
    has_many :likes, :dependent => :destroy
end
