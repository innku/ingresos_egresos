module RegistersHelper

  def amount_for(register)
    if register.income?
      register.amount
    else
      register.amount * -1
    end
  end

end
