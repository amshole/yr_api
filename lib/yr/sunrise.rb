module Yr
  class Sunrise
    attr_reader :details, :doc
    def initialize(lat, lng, from=Date.today, to=Date.today)
      @latitude = lat
      @longitude = lng
      @from = from
      @to = to
    end

    def details
      @details ||= parse_sunrise(doc)
    end

    def doc
      @doc ||= Raw::Sunrise.parse(:lat => @latitude, :lon => @longitude, :from => @from.to_date, :to => @to.to_date)
    end

    protected

    def parse_sunrise(doc)
      doc.search('time').map do |t|
        {:date => t[:date], :sun => {:rise => Time.xmlschema(t.search('sun').first[:rise]), :set => Time.xmlschema(t.search('sun').first[:set]) },
          :moon => {:rise => Time.xmlschema(t.search('moon').first[:rise]), :set => Time.xmlschema(t.search('moon').first[:set]) }}
      end
    end
  end
end