class CreateMessagesTable < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id, :null => false
      t.integer :discussion_id, :null => false
      t.text :content

      t.timestamps
    end
  end
end
