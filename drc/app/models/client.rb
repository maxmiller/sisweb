class Client < ActiveRecord::Base
  belongs_to :state
  attr_accessible :address, :cep, :city, :cpf, :name, :phone_number ,:state_id
  validates :name,:address, :cep, :city , :presence => true
  validates :phone_number, :presence => true, :numericality => true
  usar_como_cpf :cpf
end
