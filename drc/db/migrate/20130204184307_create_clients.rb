class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address
      t.string :cep
      t.references :state
      t.string :city
      t.string :cpf
      t.string :phone_number

      t.timestamps
    end
    add_index :clients, :state_id
  end
end
