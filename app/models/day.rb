class Day < ActiveRecord::Base
  attr_accessible :date, :name, :yday
  has_many :tasks
end
