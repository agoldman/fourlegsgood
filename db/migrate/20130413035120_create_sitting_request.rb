class CreateSittingRequest < ActiveRecord::Migration
  def change
    create_table :sitting_requests do |t|

    	t.integer :owner_id
    	t.date :start_date
    	t.date :end_date
    	t.boolean :cash_option

      t.timestamps
    end
    add_index :sitting_requests, :owner_id
  end
end
