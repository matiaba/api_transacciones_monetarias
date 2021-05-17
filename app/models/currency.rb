class Currency < ApplicationRecord
  has_many :bank_accounts

  validates :last_value, numericality: { greater_than_or_equal_to: 0}
  validates_presence_of :name, :last_value
  validates_associated :bank_accounts
end
