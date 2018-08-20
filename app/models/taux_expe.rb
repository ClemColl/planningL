# id: integer
# taux: string
# obj: string
# created_at: datetime
# updated_at: datetime
class TauxExpe < ApplicationRecord
  before_validation :setup_commas

  private

  def setup_commas
    self.taux = self.taux.tr(',', '.')
    self.obj = self.obj.tr(',', '.')
  end
end
