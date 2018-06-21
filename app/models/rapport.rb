class Rapport < ApplicationRecord
  belongs_to :machine
  before_save  :set_quart, :set_cta, :check_pdp, :set_dav

  private

  def set_cta
      if last_record = Rapport.where(machine_id: self.machine_id).last
        if last_record.quart == self.quart
          self.cta = last_record.cta + self.cas
        else 
          rapports = Rapport.where(machine_id: self.machine_id, quart: (self.quart)%4 + 1, created_at: (Date.today - 4.months)..Date.today)
          self.cta = last_record.cta + self.cas + rapports.each.sum{|r| r.next_cas}
        end
      else
        self.cta = self.cas
      end
  end

  def check_pdp
    if self.pdp.blank?
      last_pdp = Rapport.where(machine_id: self.machine_id).last.pdp
      self.pdp = last_pdp
    end
  end

  def set_dav
    if self.cta
      self.dav = self.pdp - self.cta
    else
      self.dav = 0
    end
  end

  def set_quart
    self.quart = (Date.commercial(Date.today.year, self.week.to_i, 3).month / 3.0).ceil
  end

end
