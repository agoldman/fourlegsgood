class CreateMessageAncestors < ActiveRecord::Migration
  def change
    create_table :message_ancestors do |t|

      t.timestamps
    end
  end
end
