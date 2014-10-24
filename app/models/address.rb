class Address < ActiveRecord::Base
validates_presence_of :street,:city,:county,:postcode
 #https://gist.github.com/simonwhitaker/5748487
 validates_format_of :postcode,
                      with:/[A-Z]{1,2}[0-9][0-9A-Z]?\s?[0-9][A-Z]{2}/i,
                      message: 'Bad postcode format'
belongs_to :user

end