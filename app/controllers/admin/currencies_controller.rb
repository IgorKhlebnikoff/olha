class Admin::CurrenciesController < ApplicationController
  def index
    currencies = Currency.all
  end

  def new
    @currency = Currency.new
  end

  def create
    Currency.create(params[:currency])
  end

  def destroy
    Currency.find_by_id(params[:id]).destroy
  end
end
