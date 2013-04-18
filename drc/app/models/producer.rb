class Producer < ActiveRecord::Base
  belongs_to :state
  attr_accessible :address, :city, :cnpj, :cpf, :email, :mobile_number, :name, :phone_number, :state_id
  usar_como_cpf :cpf
  usar_como_cnpj :cnpj
  validates_presence_of :name, :address,:mobile_number
  validates_email_format_of :email

  extend FriendlyId
    friendly_id :name, use: :slugged

end
