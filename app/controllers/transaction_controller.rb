class TransactionController < ApplicationController
  before_action :authenticate_user!

  def historical_transactions
    first_record = Transaction.where(user_id: current_user.id).first
    last_record = Transaction.where(user_id: current_user.id).last
    start_date = params[:start_date].nil? ? first_record.created_at : params[:start_date]
    end_date = params[:end_date].nil? ? last_record.created_at : params[:end_date]
    transactions = Transaction.own_transactions(current_user.id, start_date, end_date)
    render json: transactions.empty? ? {transactions: "there isn't any"} : {transactions: transactions}
  end
end
