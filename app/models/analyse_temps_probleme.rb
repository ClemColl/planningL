# Attributes
# id: integer
# tmpdef: string
# obj: string
# hdirect: string
# created_at: datetime
# updated_at: datetime
class AnalyseTempsProbleme < ApplicationRecord
  before_validation :setup_commas

  private

  def setup_commas
    self.tmpdef = self.tmpdef.tr(',', '.')
    self.obj = self.obj.tr(',', '.')
  end
end
