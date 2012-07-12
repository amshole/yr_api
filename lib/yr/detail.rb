module Yr
  class Detail
    attr_accessor :symbol, :precipitation, :wind, :temperature, :pressure, :from, :to#, :sunrise
    def time_range
      from..to
    end

    def time_range=(a_range)
      self.from   = a_range.begin
      self.to     = a_range.end
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