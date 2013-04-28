class CreateTableListingPictures < ActiveRecord::Migration
  def change
    create_table(:listing_pictures) do |t|
      t.attachment :picture, :null => false
      t.integer :listing_id, :null => false
      t.timestamps
    end
  end
end
