class Transaction < ApplicationRecord
  belongs_to :user

  scope :own_transactions, ->(user_id, start_date, end_date) { where("user_id = ? AND created_at >= ? AND created_at <= ?", user_id, start_date, end_date) }
  validates_presence_of :account_from, :account_to, :amount, :description, :amount_converted
  validates :amount, numericality: { greater_than_or_equal_to: 0}
  validates :amount_converted, numericality: { greater_than_or_equal_to: 0}
  validate :cash_transfer_between_same_acccount

  def cash_transfer_between_same_acccount
    if account_from == account_to
      errors.add(:account_to, "can't be the same account as account_from")
    end
  end

  # Si el cash < 0 en la bank account, no debería poder registrarse
end
