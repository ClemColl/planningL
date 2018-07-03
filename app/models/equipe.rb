class Equipe < ApplicationRecord
    has_many :personnes
    has_many :analyzes # :foreign_key => 'equipe_id'
end
