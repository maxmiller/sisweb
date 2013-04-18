class AddFieldsToProducer2 < ActiveRecord::Migration
  def change
    add_column :producers, :state_id, :integer

  end
end
