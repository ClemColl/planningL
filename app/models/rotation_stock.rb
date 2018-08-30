class RotationStock < ApplicationRecord
  before_validation :setup_commas

  private

  def setup_commas
    self.rotation = self.rotation.tr(',', '.')
    self.objectif = self.objectif.tr(',', '.')
  end
end
