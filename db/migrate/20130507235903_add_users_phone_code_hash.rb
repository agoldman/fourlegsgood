class AddUsersPhoneCodeHash < ActiveRecord::Migration

  def change
    add_column :users, :phone_code_hash, :string
  end

end
