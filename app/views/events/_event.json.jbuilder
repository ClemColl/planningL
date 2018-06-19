
date = event.properties["Date"]
pièce = event.properties["Pièce"]
notes = event.properties["Notes"]

json.id event.id
json.title event.title
json.start event.start
json.color event.color unless event.color.blank?

json.calendar_id event.calendar_id
json.resourceId event.team_id
json.event_type_id event.event_type_id

json.job event.properties["Métier"]
json.gamme event.properties["Gamme"]
json.size event.properties["Largeur chassis"]

json.ato event.properties["ATO"]
json.lattes event.properties["Lattes"]
json.turbine event.properties["Turbine"]
json.em event.properties["EM"]
json.coda event.properties["CODA"]
json.caisson_aspi event.properties["Caisson Aspi"]
json.decoupeur event.properties["Découpeur"]

  # Si on a "X", "/", "AM" ou "" => On donne la valeur
  # Sinon on formatte la date
  # Si c'est vide, on annule tout
  json.date date.to_date.strftime('%d/%m/%Y') unless date.blank?
  json.piece piece
  json.notes notes



  json.update_url event_path(event, method: :patch)
  json.edit_url edit_event_path(event)