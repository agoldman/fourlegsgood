class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email
      t.string :password_digest
      t.string :name
      t.text :about_me
      t.string :address
      t.decimal :sitter_rate, default: nil
      t.integer :dog_karma, default: nil
      t.integer :sitter_karma, default: nil
      t.integer :swaps_earned, default: 1
      t.integer :swap_price, default: nil
      t.float :longitude
      t.float :latitude

      t.timestamps
    end

    add_index :users, :email,                :unique => true
  end
end
