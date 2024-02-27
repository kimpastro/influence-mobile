class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.integer :gender, null: false
      t.integer :age, null: false, default: 0
      t.text :description, default: ""

      t.timestamps
    end
  end
end
