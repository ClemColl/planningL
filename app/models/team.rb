class Team < ApplicationRecord
  has_many :users
  has_many :events
  belongs_to :calendar

  after_save :add_users

  private
  
  def add_users
    self.user_count.times do
      self.users.create({name: 'Non assigné'})
    end
  end
end
