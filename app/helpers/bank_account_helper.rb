module BankAccountHelper

  def conversion_cash(account_from, account_to, cash)
    if (account_from.currency_id != 1 && account_to.currency_id != 1)
      cash_euros = cash/account_from.currency.last_value
      cash_euros*account_to.currency.last_value
    else
      if account_from.currency_id != 1
        cash/account_from.currency.last_value
      else
        cash * account_to.currency.last_value
      end
    end
  end
end
