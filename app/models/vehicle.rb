class Vehicle < ActiveRecord::Base
validates_presence_of :registration,:mileage,:value,:parkinglocation,:policystart
#http://en.wikipedia.org/wiki/Vehicle_registration_plates_of_the_United_Kingdom,_Crown_dependencies_and_overseas_territories
validates_numericality_of :mileage,
                            greater_than_or_equal_to: 100
validates_numericality_of :value,
                            greater_than_or_equal_to: 100
belongs_to :quotation

end
