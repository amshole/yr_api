module Yr
  class Detail
    attr_accessor :symbol, :precipitation, :wind, :temperature, :pressure, :time, :sea_surface_height # :sunrise
    attr_reader :from, :to

    def time_range
      from..to
    end

    def time_range=(a_range)
      @from = a_range.begin
      @to = a_range.end
      @time = @from.strftime("%H-%M")
    end

    def to_s
      "Temperature #{temperature}"
    end

    def to_json
      {:time => @from.strftime("%H-%M"), :wind => @wind, :symbol => @symbol,
        :precipitation => @precipitation, :pressure => @pressure, :temperature => @temperature}.to_json
    end

  end
end