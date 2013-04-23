class CreateSittingRequest < ActiveRecord::Migration
  def change
    create_table :sitting_requests do |t|

    	t.integer :sitter_id, default: nil
    	t.integer :sat_for_owner_id
    	t.date :start_date
    	t.date :end_date
    	t.string :status
      t.decimal :cash_price
      t.integer :swap_price

      t.timestamps
    end
    add_index :sitting_requests, :sitter_id
    add_index :sitting_requestss, :sat_for_owner_id
  end
end
