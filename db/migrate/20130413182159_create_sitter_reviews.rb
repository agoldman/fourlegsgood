class CreateSitterReviews < ActiveRecord::Migration
  def change
    create_table :sitter_reviews do |t|

      t.integer :reviewer_id
      t.integer :reviewee_id
      t.integer :score
      t.text :comment
      t.timestamps
    end
    add_index :sitter_reviews, :reviewer_id
    add_index :sitter_reviews, :reviewee_id
  end
end
