class EcartStock < ApplicationRecord
  before_validation :setup_commas

  private

  def setup_commas
    self.ecart = self.ecart.tr(',', '.')
    self.obj = self.obj.tr(',', '.')
  end
end
