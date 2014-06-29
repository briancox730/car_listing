class Manufacturer < ActiveRecord::Base
  belongs_to :car

  validates_presence_of :name
  validates_presence_of :country
end
