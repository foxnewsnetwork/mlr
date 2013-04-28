class CreateOffers < ActiveRecord::Migration
  def change
    create_table(:offers) do |t|
      t.decimal :price, :precision => 12, :scale => 4, :default => 0, :null => false
      t.integer :user_id, :null => false
      t.integer :discussion_id, :null => false

      t.timestamps
    end
  end
end
