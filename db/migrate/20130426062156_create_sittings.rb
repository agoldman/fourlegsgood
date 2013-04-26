class CreateSittings < ActiveRecord::Migration
  def change
    create_table :sittings do |t|

    	t.integer :sitter_id
    	t.integer :sat_for_owner_id
    	t.string :status
    	t.date :start_date
    	t.date :end_date
    	t.decimal :cash_price
    	t.integer :swap_price

      t.timestamps
    end
    add_index :sittings, :sitter_id
    add_index :sittings, :sat_for_owner_id
  end
end
 