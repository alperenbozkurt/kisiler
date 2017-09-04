class AddAvatarToContacts < ActiveRecord::Migration[5.1]
  def up
    add_attachment :contacts, :avatar
  end

  def down
    remove_attachment :contacts, :avatar
  end
end
