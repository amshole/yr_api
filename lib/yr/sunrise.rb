module Yr
  class Sunrise
    attr_reader :details, :doc
    def initialize(lat, lng, from=Date.today, to=Date.today+10.days)
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
      details_hash = {}
      doc.search('time').each do |t|
        details_hash[t[:date]] = {:sun => {:rise => Time.xmlschema(t.search('sun').first[:rise]).strftime("%H:%M"), :set => Time.xmlschema(t.search('sun').first[:set]).strftime("%H:%M") },
          :moon => {:rise => Time.xmlschema(t.search('moon').first[:rise]).strftime("%H:%M"), :set => Time.xmlschema(t.search('moon').first[:set]).strftime("%H:%M") }}
      end
      details_hash
    end
  end
end