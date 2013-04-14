class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
    	t.string :name
    	t.integer :age
    	t.integer :owner_id
    	t.text :care_instructions

      t.timestamps
    end
  end
end
