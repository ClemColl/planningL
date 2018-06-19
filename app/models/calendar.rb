class Calendar < ApplicationRecord
    has_many :teams
    has_many :events, :through => :teams
    has_many :users, :through => :teams
end
