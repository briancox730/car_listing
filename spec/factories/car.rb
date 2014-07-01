FactoryGirl.define do
  factory :car do
    color 'Blue'
    year 1998
    mileage '170000'
    description 'Its a sweet car'

    manufacturer
  end
end
