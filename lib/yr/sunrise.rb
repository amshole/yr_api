module Yr
  class Sunrise
    attr_reader :details, :doc
    def initialize(lat, lng, date=Date.today)
      @latitude = lat
      @longitude = lng
      @date = date
    end

    def details_hash
      @details ||= parse_sunrise(doc)
    end

    def details
      details_hash.values
    end

    def doc
      @doc ||= Raw::Sunrise.parse(:lat => @latitude, :lon => @longitude, :date => @date)
    end

    protected

    def parse_sunrise(doc)
      sun = doc.search('sun').first
      moon = doc.search('moon').first
      {:sun => {:rise => Time.xmlschema(sun[:rise]), :set => Time.xmlschema(sun[:set]) }, :moon => {:rise => Time.xmlschema(moon[:rise]), :set => Time.xmlschema(moon[:set]) }}
    end
  end
end