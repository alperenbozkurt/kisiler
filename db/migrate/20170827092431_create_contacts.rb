class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.text :name
      t.text :surname
      t.date :birthday
      t.text :address
      t.text :city
      t.text :town
      t.text :country
      t.text :email
      t.text :website

      t.timestamps
    end
  end
end
