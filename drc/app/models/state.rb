class State < ActiveRecord::Base
  resourcify
  attr_accessible :acronym, :name
  extend FriendlyId
    friendly_id :name, use: :slugged
end
