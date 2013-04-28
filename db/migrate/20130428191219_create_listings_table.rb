class CreateListingsTable < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.integer :seller_id
      t.decimal :price, :precision => 14, :scale => 4

      t.timestamps
    end
  end
end
