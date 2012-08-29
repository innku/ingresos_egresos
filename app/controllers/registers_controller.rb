class RegistersController < ApplicationController
  def new
    @register = Register.new
  end

  def create
    @register = Register.new(params[:register])
    @register.save
    redirect_to @register, notice: "El registro fue creado exitosamente"
  end

  def show
    @register = Register.find(params[:id])
  end
end
