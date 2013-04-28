class CreateDiscussionsTable < ActiveRecord::Migration
  def change
    create_table(:discussions) do |t|
      t.integer :listing_id
      t.integer :buyer_id

      t.timestamps
    end
  end
end
