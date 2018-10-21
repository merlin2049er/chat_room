class AddUserToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :user, :string
  end
end
