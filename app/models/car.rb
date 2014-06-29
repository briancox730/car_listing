class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates_presence_of :manufacturer_id, :color, :year, :mileage
end
