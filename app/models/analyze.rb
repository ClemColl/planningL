# id: integer
# equipe_id: integer
# duree: string
# efficacite: float
# utilisation: float
# eff_obj: float
# util_obj: float
# created_at: datetime
# updated_at: datetime
class Analyze < ApplicationRecord
  belongs_to :equipe
end
