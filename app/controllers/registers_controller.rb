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
    @start, @finish = fetch_dates
    @registers = Register.filter_by_date(@start, @finish)
    respond_with @registers
  end

  private

  def fetch_dates
    begin
      dates = []
      dates << Date.parse(params[:start]) if params[:start]
      dates << Date.parse(params[:finish]) if params[:finish]
      dates
    rescue ArgumentError => e
      nil
    end
  end

end
