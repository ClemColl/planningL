# id: integer
# cmd: string
# obj: string
# total: string
# created_at: datetime
# updated_at: datetime
class TauxExpecc < ApplicationRecord
  before_validation :setup_commas

  private

  def setup_commas
    self.cmd = self.cmd.tr(',', '.')
    self.obj = self.obj.tr(',', '.')
    self.total = self.total.tr(',', '.')
  end
end
