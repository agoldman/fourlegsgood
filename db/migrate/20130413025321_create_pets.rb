class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
    	t.string :name
    	t.age :integer
    	t.text :care_instructions

      t.timestamps
    end
  end
end
