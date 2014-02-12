class Booking < ActiveRecord::Base

belongs_to :reservation

 validates :reservation_id, presence: true

end
