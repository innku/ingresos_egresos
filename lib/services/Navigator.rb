module Services
  class Navigator
    attr_reader :start_date, :finish_date

    def initialize(start, finish = nil)
      @start_date = define_start(start)
      @finish_date = define_finish(finish)
    end

    def define_start(start)
      default_if_error_in_date(Date.today) do    
        if start.present?
          Date.parse(start)
        else
          Date.today
        end    
      end
    end

    def previous_month
      (start_date - 1.month).beginning_of_month
    end

    def define_finish(finish)
      default_if_error_in_date(start_date.end_of_month) do    
        if finish.present?
          Date.parse(finish)
        else
          start_date.end_of_month
        end
      end
    end

    private

    def default_if_error_in_date(default, &block)
      yield block
    rescue ArgumentError => e
      default  
    end
  end
end