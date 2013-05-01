class Task < ActiveRecord::Base
  attr_accessible :content, :day_id, :start, :stop
  belongs_to :day
end
