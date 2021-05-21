class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :account_from, null: false
      t.integer :account_to, null: false
      t.decimal :amount, null: false
      t.string :description, null: false
      t.string :amount_converted, null: false
      t.boolean :income, null: false, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
