class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :content, :null => false
      t.belongs_to :user, :index => true
      t.belongs_to :movement, :index => true
      t.timestamps
    end
  end
end
