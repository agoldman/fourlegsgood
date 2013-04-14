class CreateSittingRequest < ActiveRecord::Migration
  def change
    create_table :sitting_request do |t|

    	t.integer :owner_id
    	t.date :start_date
    	t.date :end_date
    	t.boolean :cash_option

      t.timestamps
    end
    add_index :sitting_request, :owner_id
  end
end
