class CreateSittingRequest < ActiveRecord::Migration
  def change
    create_table :sitting_requests do |t|

    	t.integer :owner_id
    	t.datetime :start_date
    	t.datetime :end_date
    	t.string :status, default: "requested"

      t.timestamps
    end
    add_index :sitting_requests, :owner_id
  end
end
