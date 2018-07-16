class Backlog < ApplicationRecord
    before_save :set_quart, :setup_commas
    validates_presence_of :week, :mac, :mfc, :mfcl, :ytd, :ytdl, :mb, :ob

    private

    def setup_commas
        self.mfc = self.mfc.to_s.gsub(',', '.')
        self.mfcl = self.mfcl.to_s.gsub(',', '.')
        self.mac = self.mac.to_s.gsub(',', '.')

        self.ytd = self.ytd.to_s.gsub(',', '.')
        self.ytdl = self.ytdl.to_s.gsub(',', '.')

        self.mb = self.mb.to_s.gsub(',', '.')
        self.ob = self.ob.to_s.gsub(',', '.')
    end

    def set_quart
        self.quart = (Date.commercial(Date.today.year, self.week.to_i, 3).month / 3.0).ceil
    end
end
