class CreateProducers < ActiveRecord::Migration
  def change
    create_table :producers do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :cnpj
      t.string :cpf
      t.string :state
      t.string :phone_number
      t.string :mobile_number
      t.string :email

      t.timestamps
    end
  end
end
