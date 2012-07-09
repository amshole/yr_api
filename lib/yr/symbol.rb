module Yr
  class Symbol
    attr_accessor :number, :name, :icon
    def initialize(number,name)
      self.number = number
      self.name = name
      self.icon = Yr::Raw::Weathericon.build(:symbol => number, :content_type => "image/png").to_s
    end
  end
end