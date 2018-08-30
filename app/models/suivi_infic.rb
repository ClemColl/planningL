class SuiviInfic < ApplicationRecord
  before_validation :setup_commas

  private

  def setup_commas
    self.sps = self.sps.tr(',', '.')
    self.obj_p = self.obj_p.tr(',', '.')
    self.spc = self.spc.tr(',', '.')
    self.sls = self.sls.tr(',', '.')
    self.obj_l = self.obj_l.tr(',', '.')
    self.slc = self.slc.tr(',', '.')
  end
end
