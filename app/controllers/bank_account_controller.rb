class BankAccountController < ApplicationController
  include BankAccountHelper
  before_action :authenticate_user!

  def transferir
    account_from = BankAccount.find(params[:account_from].to_i)
    account_to = BankAccount.find(params[:account_to].to_i)
    amount = params[:amount].to_d
    description = params[:description]
    send_amount = conversion_cash(account_from, account_to, amount)
    new_amount_from = account_from.cash - amount
    new_amount_to = account_to.cash + send_amount
    transaction = transaction_record(account_from, account_to, amount, description, send_amount, current_user)
    update_bank_account = BankAccount.new(cash: new_amount_from, user_id: account_from.user_id, currency_id: account_from.currency_id)
    if transaction.valid? && update_bank_account.valid?
      account_from.update(cash: new_amount_from)
      account_to.update(cash: new_amount_to)
      transaction.save
      render json: { message: "Transfer completed.", bank_account: account_from, bank_destiny_account: account_to}
    else
      render json: {error: transaction.errors, error2: update_bank_account.errors}
    end
  end

  def transaction_record(origin_bank, destiny_bank, cash, description, cash_converted, current_user)
    Transaction.new(account_from: origin_bank.id, account_to: destiny_bank.id, amount: cash,
                       description: description, amount_converted: cash_converted, user_id: current_user.id)
  end

end
