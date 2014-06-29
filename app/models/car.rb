class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates_presence_of :manufacturer_id, :color, :year, :mileage
  validates :year, length: { is: 4 }, on: :create
  validates_numericality_of :year, greater_than: 1919
  validates_numericality_of :year, less_than: Time.now.year + 1
end
