class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email               
      t.string :name
      t.text :about_me
      t.string :address
      t.integer :dog_karma, default: nil
      t.integer :sitter_karma, default: nil
      t.integer :swaps_earned, default: 1
  
      t.timestamps
    end

  end
end
