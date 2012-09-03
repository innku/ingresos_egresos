module Services
  class AccountingStats
    attr_reader :registers

    def initialize(registers)
      @registers = registers
    end

    def incomes_total
      registers.select {|r| r.income? }.map(&:amount).inject(0) {|result,element| result + element}
    end

    def expenses_total
      registers.select { |r| !r.income?  }.map(&:amount).inject(0) {|result,element| result + element}
    end

    def difference_total
      incomes_total - expenses_total
    end
  end
end