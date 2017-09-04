class AddDetailsToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :company, :string
    add_column :contacts, :job, :string
    add_column :contacts, :gender, :string
    add_column :contacts, :race, :string
  end
end
