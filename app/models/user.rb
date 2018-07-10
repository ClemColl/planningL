class User < ApplicationRecord
    belongs_to :team

    before_save :avoid_empty

    private

    def avoid_empty
        if self.name == "" || self.name == "-"
            self.name = "Non Assigné"
        end
    end
end
