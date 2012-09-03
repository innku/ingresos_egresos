class RegistersController < ApplicationController
  respond_to :html, :json

  def new
    @register = Register.new
  end

  def create
    @register = Register.new(params[:register]) 
    if @register.save
      redirect_to @register, notice: I18n.t("notice.register.created_successfully")
    else
      render :new
    end
  end

  def show
    @register = Register.find(params[:id])
  end

  def edit
    @register = Register.find(params[:id])
  end

  def update
    @register = Register.find(params[:id])
    if @register.update_attributes(params[:register])
      redirect_to @register, notice: I18n.t("notice.register.updated_successfully")
    else
      render :edit
    end
  end

  def index
    @navigator = Services::Navigator.new(params[:start], params[:finish])
    @registers = Register.filter_by_date(@navigator.start_date, @navigator.finish_date)
    respond_with @registers
  end
end
