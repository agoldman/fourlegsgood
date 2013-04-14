class CreateScheduledSitting < ActiveRecord::Migration
  def change
    create_table :scheduled_sittings do |t|

    	t.integer :sitter_id
    	t.integer :owner_id
    	t.integer :rate
    	t.date :start_date
    	t.date :end_date
    	t.string :status
      t.boolean :swap_payment?, default: nil
      t.boolean :cash_payment?, default: nil
      t.decimal :cash_price
      t.integer :swap_price

      t.timestamps
    end
    add_index :scheduled_sittings, :sitter_id
    add_index :scheduled_sittings, :owner_id
  end
end
