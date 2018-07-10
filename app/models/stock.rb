class Stock < ApplicationRecord
    before_save :set_quart, :setup_commas

    private
    
    def set_quart
        self.quart = (Date.commercial(Date.today.year, self.week.to_i, 3).month / 3.0).ceil
    end

    def setup_commas
        self.smc = self.smc.to_s.gsub(',', '.')
        self.rmc = self.rmc.to_s.gsub(',', '.')
        self.sma = self.sma.to_s.gsub(',', '.')
        self.rma = self.rma.to_s.gsub(',', '.')
    end
end
