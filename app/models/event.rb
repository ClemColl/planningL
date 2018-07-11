class Event < ApplicationRecord
  belongs_to :calendar
  belongs_to :team
  belongs_to :event_type

  before_save :setup_end, if: :new_record?
  #before_save :update_time

  before_save :set_color

  serialize :properties, Hash
  validates :title, presence: true
  attr_accessor :date_range

  def all_day_event?
  end

  private
  
  # ON NEW RECORD
  def setup_end
    self.end = self.start + self.event_type.duree.gsub(',', '.').to_f.days - 1.minute

    if self.properties['Gamme'] == "iXEML"
      self.end = self.end + 2.days
    end
  end
  
  def update_time
    days_off = check_for_weekends
    self.duration = (self.end - self.start) / 1.day - days_off.days

    self.end = self.start.to_date + self.duration.days + days_off.days
  end

  def check_for_weekends
    jours = self.start.to_date..self.end.to_date
    weekend_days = 0

    jours.each do |j|
      if j.saturday? && j.sunday?
        weekend_days += 2
      elsif j.saturday?
        weekend_days += 2
      else
        weekend_days = 0
      end
    end
    
    return weekend_days
  end

  def set_color
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

  end

end