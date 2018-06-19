class Team < ApplicationRecord
  has_many :users
  has_many :events
  belongs_to :calendar

end
