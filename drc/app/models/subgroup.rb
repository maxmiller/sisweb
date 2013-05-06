class Subgroup < ActiveRecord::Base
  attr_accessible :name

  validates_presence_of :name, :message => 'obrigatorio'

  extend FriendlyId
  friendly_id :name, use: :slugged
end
