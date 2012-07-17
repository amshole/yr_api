module Yr
  class Symbol
    attr_accessor :number, :name, :icon, :is_night

    def initialize(number,name,is_night=0)
      self.number = number
      self.name = name
      self.is_night = is_night
      self.icon = Yr::Raw::Weathericon.build(:symbol => number, :content_type => "image/png", :is_night => is_night).to_s
    end
  end
end