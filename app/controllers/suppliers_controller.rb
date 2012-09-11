class SuppliersController < ApplicationController
  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(params[:supplier])
    if @supplier.save
      redirect_to @supplier, notice: I18n.t("notice.supplier.created_successfully")
    else
      render :action => 'new'
    end
  end

  def show
    @supplier = Supplier.find(params[:id])
  end
end