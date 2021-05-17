class BankAccountController < ApplicationController
  include BankAccountHelper
  before_action :authenticate_user!

  def transferir
    account_from = BankAccount.find(params[:account_from].to_i)
    account_to = BankAccount.find(params[:account_to].to_i)
    amount = params[:amount].to_d
    description = params[:description]
    if account_from.currency_id != account_to.currency_id
      send_amount = conversion_cash(account_from, account_to, amount)
      new_amount_from = account_from.cash - amount
      new_amount_to = account_to.cash + send_amount
      account_from.update(cash: new_amount_from)
      account_to.update(cash: new_amount_to)
      render json: { message: "Transfered completed."}
    else
      render json: {error: "You can't transfer between these accounts"}
    end
  end
end
