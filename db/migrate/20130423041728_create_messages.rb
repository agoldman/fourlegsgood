class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|

    	t.integer :sender_id
    	t.integer :receiver_id
    	t.string :title
    	t.text :content
      t.boolean :read, default: false
      t.integer :parent_id, default: 0

      t.timestamps
    end
    add_index :messages, :sender_id
    add_index :messages, :receiver_id
    add_index :messages, :parent_id
  end
end