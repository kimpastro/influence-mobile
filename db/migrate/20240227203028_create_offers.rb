class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.integer :gender, null: false
      t.integer :min_age, null: false, default: 0
      t.integer :max_age, null: false, default: 199
      t.text :description, default: ""

      t.timestamps
    end
  end
end
