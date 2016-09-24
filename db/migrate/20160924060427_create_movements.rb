class CreateMovements < ActiveRecord::Migration[5.0]
  def change
    create_table :movements do |t|
      t.string :name, :null => false
      t.string :description, :null => false
      t.string :location, :null => false
      t.string :status, :null => false
      t.string :creator, :null => false
      t.timestamps
    end
  end
end
