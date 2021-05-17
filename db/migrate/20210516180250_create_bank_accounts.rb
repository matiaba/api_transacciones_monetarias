class CreateBankAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :bank_accounts do |t|
      t.decimal :cash, null: false, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :currency, null: false, foreign_key: true

      t.timestamps
    end
  end
end
