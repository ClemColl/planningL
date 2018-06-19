class Backlog < ApplicationRecord
    before_save :set_quart, :setup_commas

    private

    def setup_commas
        self.mfc.to_s.gsub!(',', '.')
        self.mac.to_s.gsub!(',', '.')
        self.mb.to_s.gsub!(',', '.')
        self.ob.to_s.gsub!(',', '.')
    end

    def set_quart
        self.quart = (Date.commercial(Date.today.year, self.week.to_i, 3).month / 3.0).ceil
    end
end
