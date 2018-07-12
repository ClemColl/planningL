class Event < ApplicationRecord
  belongs_to :calendar
  belongs_to :team
  belongs_to :event_type

  before_save :first_setup, if: :new_record?

  before_save :set_color

  serialize :properties, Hash
  validates :title, presence: true
  attr_accessor :date_range

  def all_day_event?
  end

  private
  
  # ON NEW RECORD
  def first_setup
    self.end = self.start + self.event_type.duree.gsub(',', '.').to_f.days - 1.second

    if self.properties['Gamme'] == "iXEML"
      self.end = self.end + 2.days
    end

    days_off = check_for_weekends

    self.end = self.end + days_off.days
  end

  # ANNEXE  
  def check_for_weekends
    jours = self.start.to_date..self.end.to_date
    weekend_days = 0

    jours.each do |j|
      if j.saturday?
        weekend_days += 2
      end
    end
    
    return weekend_days
  end

  def set_color
    if !self.properties["Couleur"]
      colors = {
        jaune: '#ffd200',
        orange: '#fc4a1a',
        rose: '#f953c6',
        vert: '#56ab2f',
        bleu: '#1565c0',
        bleu_clair: '#00bfff',
        gris: '#a9a9a9'
      }
      if self.properties["Gamme"] && self.properties["Largeur chassis"]
        gamme = self.properties["Gamme"]
        largeur = self.properties["Largeur chassis"]

        if largeur == "71"

            if gamme == "iQ50" || gamme == "iQ80"
              self.color = colors[:jaune]
            elsif gamme == "iX6" || gamme == "iX9"
              self.color = colors[:rose]
            else
              self.color = colors[:gris]
            end

        elsif largeur == "86"

            if gamme == "iQ50" || gamme == "iQ80"
              self.color = colors[:orange]
            elsif gamme == "iX6" || gamme == "iX9"
              self.color = colors[:vert]
            end

        elsif gamme == "Q25" || gamme == "iX"

            self.color = colors[:bleu]

        elsif gamme == "iXEML"

            self.color = colors[:bleu_clair]

        else

            self.color = colors[:gris]

        end
      else
        self.color = colors[:gris]
      end
    else
      self.color = self.properties["Couleur"]
    end

  end

end