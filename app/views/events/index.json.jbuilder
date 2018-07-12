json.array! @events do |event|
  fullcalendar_format = '%Y-%m-%dT%H:%M:%S'
  date_format = '<b>%d</b>/<b>%m</b>'
  
  json.id event.id
  json.title event.title
  json.start event.start.strftime(fullcalendar_format)
  json.end event.end.strftime(fullcalendar_format)
  json.color event.color unless event.color.blank?

  json.calendar_id event.calendar_id
  json.resourceId event.team_id
  json.event_type_id event.event_type_id

  if event.properties["Texte"]
    if event.properties["Texte"].length > 10
      json.texte "<b>#{event.properties["Texte"][0..9]}...</b>"
    elsif event.properties["Texte"] != ""
      json.texte "<b>#{event.properties["Texte"]}&#10240;</b>"
    else
      json.texte "&#10240;"
    end
  else
    json.texte "&#10240;"
  end

  if event.event_type_id == 1
    # Montage Vector Gros Cutter
    json.gamme "#{event.properties["Métier"]}-#{event.properties["Gamme"]}-#{event.properties["Largeur chassis"]}"

    json.pieces [
      "ATO <b>#{event.properties["ATO"]}</b>",
      "LAT <b>#{event.properties["Lattes"]}</b>",
      "TURB <b>#{event.properties["Turbine"]}</b>",
      "EM <b>#{event.properties["EM"]}</b>",
      "CODA <b>#{event.properties["CODA"]}</b>"
    ]

  elsif event.event_type_id == 2
    # Test Vector Gros Cutter

    json.gamme "#{event.properties["Métier"]}-#{event.properties["Gamme"]}-#{event.properties["Largeur chassis"]}-#{event.properties["ANT"]}"

    json.pieces [
      "CONV <b>#{event.properties["Convoyeur"]}</b>",
      "TÊTE <b>#{event.properties["Tête"]}</b>",
      "&#10240;",
      "&#10240;",
      "EXPE <b>#{event.properties["Expe"]}</b>"
    ]

  elsif event.event_type_id == 3
    # Montage Vector Petit Cutter

    json.gamme "#{event.properties["Métier"]}-#{event.properties["Gamme"]}-#{event.properties["Largeur chassis"]}"

    json.pieces [
      "DEC <b>#{event.properties["Découpeur"]}</b>",
      "LAT <b>#{event.properties["Lattes"]}</b>",
      "ASPI <b>#{event.properties["Caisson Aspi"]}</b>",
      "EM <b>#{event.properties["EM"]}</b>",
      "CODA <b>#{event.properties["CODA"]}</b>"
    ]

  elsif event.event_type_id == 4
    # Test Vector Petit Cutter

    json.gamme "#{event.properties["Métier"]}-#{event.properties["Gamme"]}-#{event.properties["Largeur chassis"]}-#{event.properties["ANT"]}"

    json.pieces [
      "CONV <b>#{event.properties["Convoyeur"]}</b>",
      "TÊTE <b>#{event.properties["Tête"]}</b>",
      "ATO <b>#{event.properties["ATO"]}</b>",
      "&#10240;",
      "EXPE <b>#{event.properties["Expe"]}</b>"
    ]

  elsif event.event_type_id == 5
    # Versalis
    json.gamme event.properties["Pièce"]

    json.pieces [
      "<b>#{event.properties["Description"]}</b>",
      "&#10240;",
      "&#10240;",
      "&#10240;",
      "&#10240;"
    ]

  elsif event.event_type_id == 6
    # Carte Classique
    json.gamme ""

    json.pieces [
      "<b>#{event.properties["Description"]}</b>",
      "&#10240;",
      "&#10240;",
      "&#10240;",
      "&#10240;"
    ]
    
  end

  json.update_url event_path(event, method: :patch)
  json.edit_url edit_event_path(event)
end
