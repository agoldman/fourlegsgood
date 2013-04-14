class CreatePetReviews < ActiveRecord::Migration
  def change
    create_table :pet_reviews do |t|

    	t.integer :reviewer_id
    	t.integer :reviewee_id
    	t.integer :score
    	t.text :comment
    	
      t.timestamps
    end
    add_index :pet_reviews, :reviewer_id
    add_index :pet_reviews, :reviewee_id
  end
end
