class Objectif < ApplicationRecord
    before_save :setup_commas

    private

    def setup_commas
        self.value = self.value.to_s.gsub(',', '.')
    end
end
