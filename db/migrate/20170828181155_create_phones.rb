class CreatePhones < ActiveRecord::Migration[5.1]
  def change
    create_table :phones do |t|
      t.references :contact, foreign_key: true
      t.text :phone

      t.timestamps
    end
  end
end
