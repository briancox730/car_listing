class Manufacturer < ActiveRecord::Base
  has_many :cars

  validates_presence_of :name
  validates_presence_of :country
  validates_uniqueness_of :name
end
