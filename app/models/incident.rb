class Incident < ActiveRecord::Base
validates_presence_of :dateofincident,:valueofclaim,:typeofincident,:description
belongs_to :user

end
