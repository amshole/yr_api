module Yr
  class OceanForecast

    def initialize(lat, lng)
      @latitude = lat
      @longitude = lng
    end

    def details
      @details ||= parse_ocean_forecast
    end

    def doc
      @doc ||= Raw::OceanForecast.parse(:lat => @latitude, :lon => @longitude)
    end

    protected

    def parse_ocean_forecast
      ocean_forecast = {}

      doc.xpath('//mox:Forecasts/mox:forecast/metno:OceanForecast').each do |forecast|
        time = Time.xmlschema(forecast.xpath('mox:validTime/gml:TimePeriod/gml:begin').first.children.first.to_s)
        ocean_forecast[time] = forecast.xpath('mox:seaSurfaceHeight').first.children.first.to_s
      end

      ocean_forecast
    end

    # http://api.yr.no/weatherapi/oceanforecast/0.9/?lat=60.10;lon=9.58
    # xpath('//mox:Forecasts/mox:forecast/metno:OceanForecast').first.xpath('mox:seaSurfaceHeight').first.children.first.to_s
  end
end