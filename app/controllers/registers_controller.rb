class RegistersController < ApplicationController
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
    @registers = Register.all
  end
end
