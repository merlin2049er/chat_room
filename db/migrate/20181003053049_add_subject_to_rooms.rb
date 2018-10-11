class AddSubjectToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :subject, :string
  end
end
