class Chore < ActiveRecord::Base

  validates_presence_of :title, :frequency

end
