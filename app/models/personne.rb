class Personne < ApplicationRecord
  belongs_to :equipe, optional: true
end
