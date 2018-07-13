class Equipe < ApplicationRecord
    has_many :personnes
    has_many :analyzes
end
