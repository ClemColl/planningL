class Event < ApplicationRecord
  belongs_to :calendar
  belongs_to :team
  belongs_to :event_type
  before_save :setup_time, if: :new_record?
  before_save :set_color

  serialize :properties, Hash
  validates :title, presence: true
  attr_accessor :date_range

  def all_day_event?
    # self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end

  def is_conge?
    # Si le title ressemble à congé, event.color = gris
    if self.title == "Congé" || self.title == "Conge" || self.title == "congé" || self.title == "conge" || self.title == "Absent" || self.title == "absent"
      self.color = "#999"
    end
  end

  private

  def setup_time
    nombre_jour = {#"Carte Classique" => 2,
            "Montage Vector Gros Cutter" => 2.5,
            "Test Vector Gros Cutter" => 4,
            "Montage Vector Petit Cutter" => 2,
            "Test Vector Petit Cutter" => 2,
            "Versalis" => 2}

    name = EventType.find(self.event_type_id).name

    self.end = self.start + (nombre_jour[name]).days
  end

  def set_color
    colors = {'IQ50-71' => '#ffd200',     # Jaune
              'IQ80-71' => '#ffd200',    
              'IQ50-86' => '#fc4a1a',     # Orange
              'IQ80-86' => '#fc4a1a',     
              'IX6-71' => '#f953c6',      # Rose
              'IX9-71' => '#f953c6',      
              'IX6-86' => '#56ab2f',      # Vert
              'IX9-86' => '#56ab2f',    
              'Q25' => '#1565c0',         # Bleu
              'IX' => '#1565c0' }         
    gamme = self.properties["Gamme"]

    actual_color = "#{gamme}"

    if self.properties["Largeur chassis"] && self.properties["Largeur chassis"] != ''
      largeur = self.properties["Largeur chassis"]
      actual_color = "#{gamme}-#{largeur}"
    end
    

    self.color = colors[actual_color]
  end

end