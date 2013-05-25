class AddAboutMeDefault < ActiveRecord::Migration
  def change
  	add_column :users, :about_me, :text, default: "I haven't said anything about myself yet, but I'm probably rad."
  end
end
