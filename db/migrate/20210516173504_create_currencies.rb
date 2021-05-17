class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies do |t|
      t.string :name, null: false
      t.decimal :last_value, null: false, default: 0

      t.timestamps
    end

    add_index :currencies, :name, unique: true
  end
end
