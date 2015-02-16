class Admin::CurrenciesController < ApplicationController
  def index
    currencies = Currency.all
  end

  def new
    @currency = Currency.new
  end

  def create
    Currency.create(currency_params)
  end

  def destroy
    Currency.find_by_id(params[:id]).destroy
  end

  private

  def currency_params
    params.require(:currency).permit(:name)
  end
end
