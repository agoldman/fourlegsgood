class CreatePetReviews < ActiveRecord::Migration
  def change
    create_table :pet_reviews do |t|

    	t.integer :pet_reviewer_id
    	t.integer :pet_reviewee_id
    	t.integer :score
    	t.text :comment
    	
      t.timestamps
    end
    add_index :pet_reviews, :pet_reviewer_id
    add_index :pet_reviews, :pet_reviewee_id
  end
end
