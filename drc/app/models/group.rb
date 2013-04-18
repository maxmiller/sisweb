class Group < ActiveRecord::Base
  attr_accessible :name
  extend FriendlyId
  friendly_id :name, use: :slugged
end
