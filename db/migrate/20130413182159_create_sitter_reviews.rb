class CreateSitterReviews < ActiveRecord::Migration
  def change
    create_table :sitter_reviews do |t|

      t.integer :sitter_reviewer_id
      t.integer :sitter_reviewee_id
      t.integer :score
      t.text :comment
      t.timestamps
    end
    add_index :sitter_reviews, :sitter_reviewer_id
    add_index :sitter_reviews, :sitter_reviewee_id
  end
end
