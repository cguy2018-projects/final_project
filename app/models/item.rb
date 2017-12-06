# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string
#  url        :string
#  comment    :text
#  tagline    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ApplicationRecord
    
    has_one :user, :through => :posting, :source => :user
end
