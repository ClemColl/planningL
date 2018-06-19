class Machine < ApplicationRecord
    has_many :rapports

    def underscore_id
        return self.name.parameterize.underscore
    end

    def last_week
        last_week = Rapport.where(machine_id: self.id,).last ? Rapport.where(machine_id: self.id,).last.week : "Pas de données"
    end

    def rapports_quarter
        self.rapports.where(quart: (Date.today.month/3.0).ceil, created_at: (Date.today-4.months)..(Date.today+1.week))
    end
end
