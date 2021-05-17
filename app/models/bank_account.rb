class BankAccount < ApplicationRecord
  belongs_to :user
  belongs_to :currency

  validates :cash, numericality: { greater_than_or_equal_to: 0}
end
