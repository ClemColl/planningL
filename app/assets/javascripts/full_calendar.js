// FullCalendar - https://github.com/fullcalendar/fullcalendar
let today = moment(new Date()).format('YYYY-MM-DD')

var initialize_calendar;
initialize_calendar = function() {
  $('.calendar').each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
      // Choix des bouttons du header
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'customWeek' // customWeek2
      },

      buttonText: {
        today: "Aujourd'hui"
      },

      // PARAMETRES
      // se référer à la doc - https://fullcalendar.io/docs
      locale: 'fr',
      schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
      defaultView: 'customWeek',
      hiddenDays: [0], // 0 = Dimanche, 1 = Lundi ...
      editable: true,
      resourceAreaWidth: "20%",
      selectable: true,
      selectHelper: true,
      resources: '/teams.json',
      eventLimit: true,
      events: '/events.json',
      longPressDelay: 200,
      dateAlignment: 'week',
      slotDuration: {hours: 12},
      nowIndicator: true,
      height: "auto",
      resourceColumns: [
        {
          labelText: '',
          width: '30%'
        },
        {
          labelText: '',
          field: 'id'
        }
      ],
      views: {
        customWeek: {
          type: 'timeline',
          duration: { days: 14 },
          buttonText: '2 semaines'
        }
        // customWeek2: {
        //   type: 'timeline',
        //   duration: { days: 21 },
        //   buttonText: '3 semaines'
        // }
      },

      //CALLBACKS
      resourceRender: function(resourceObj, labelTds) {
        // Lien Best_in_place (in-place editing)
        // Permet de modifier au click la team / le user
        labelTds[0].children[0].children[0].innerHTML = resourceObj.link
        labelTds[1].children[0].innerHTML = resourceObj.user1 + "<br>" + resourceObj.user2
      },

      dayRender: function(date, cell) {
        var cellDate = date.format('YYYY-MM-DD')
          if (cellDate < today) {
            cell[0].className += " before-date";
          }
      },

      eventRender: function(event, element) { 
        var size = event.size
        var gamme = event.gamme
        var job = event.job

        // Métier-Gamme-Largeur
        if (gamme == null) {
          result = event.piece
        } else if (size == null) {
          result = job + "-" + gamme
        } else {
          result = job + "-" + gamme + "-" + size
        }

        var pieces = ["", "", "", "", ""]
        if (event.event_type_id == 1) {
          // Montage Vector Gros Cutter
           
           var ato = "ATO " + "<b>" + event.ato + "</b>"
           var lattes = "Lattes " + "<b>" + event.lattes + "</b>"
           var turbine = "Turbine " + "<b>" + event.turbine + "</b>"
           var em = "EM " + "<b>" + event.em + "</b>"
           var coda = "CODA " + "<b>" + event.coda + "</b>"

          pieces = [ato, lattes, turbine, em, coda]

        } else if (event.event_type_id == 2 || event.event_type_id == 4) {
          // Test Vector Gros/Petit Cutter
          
          var date = "Date <b>" + event.date + "</b>"
          var piece = "Pièce " + "<b>" + event.piece + "</b>"
          var notes = "Notes " + "<b>" + event.notes + "</b>"

          pieces = [date, piece, notes, "", ""]

        } else if (event.event_type_id == 3) {
            // Montage Vector Petit Cutter
          
          var decoupeur = "Découpeur " + "<b>" + event.decoupeur + "</b>"
          var lattes = "Lattes " + "<b>" + event.lattes + "</b>"
          var caisson_aspi = "Aspi " + "<b>" + event.caisson_aspi + "</b>"
          var em = "EM " + "<b>" + event.em + "</b>"
          var coda = "CODA " + "<b>" + event.coda + "</b>"

          pieces = [decoupeur, lattes, caisson_aspi, em, coda]

        } else if (event.event_type_id == 5) { // Versalis
          
          var notes = "Notes " + "<b>" + event.notes + "</b>"
          pieces = [notes, "", "", "", ""]
        }
        
        var card = element.find('.fc-content')
          card.html("<div class='card'>" +
                      "<div class='card-header'>" +
                        "<div class='card-title'>" +
                          event.title +
                        "</div>" +
                        "<div class='card-gamme'>" +
                          result +
                        "</div>" +
                      "</div>" +
                      "<div class='card-se'>" +
                        "<div class='se'>" + pieces[0] + "</div>" +
                        "<div class='se'>" + pieces[1] + "</div>" +
                        "<div class='se'>" + pieces[2] + "</div>" +
                      "</div>" +
                      "<div class='card-se2'>" +
                        "<div class='se'>" + pieces[3] + "</div>" +
                        "<div class='se'>" + pieces[4] + "</div>" +
                      "</div>" +
                    "</div>"
                  )
      },

      // Sélection de plusieurs jours
      select: function(start, end, event, view, resource) {
          $.getScript('/events/new', function() {
            // $('#event_date_range').val(moment(start).format("MM/DD/YYYY") + ' - ' + moment(end).format("MM/DD/YYYY"))
            // date_range_picker();
            console.log(resource.id)
            $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH'));
            $('.team_hidden').val(resource.id);
            // $('.end_hidden').val(moment(end).format('YYYY-MM-DD'));
          }),

        calendar.fullCalendar('unselect')
      },

      // Déplacement d'un event
      eventDrop: function(event) {
        event_data = { 
          event: {
            id: event.id,
            start: event.start.format(),
            end: event.end.format(),
            team_id: event.resourceId
          }
        };
        // Les données sont gérées en AJAX via json
        $.ajax({
          url: event.update_url,
          data: event_data,
          type: 'PATCH'
        });
      },
      
      // Resize via le bord d'un event
      eventResize: function(event) {
        // console.log(delta)
        // console.log(event.end.format("DD HH"))
        // console.log(event.start.format("DD HH"))
        event_data = { 
          event: {
            id: event.id,
            start: event.start.format(),
            end: event.end.format(),
          }
        };
        $.ajax({
          url: event.update_url,
          data: event_data,
          type: 'PATCH'
        });
      },

      // Click sur l'event
      eventClick: function(event) {
        // Fill les inputs du date_range_picker
        $.getScript(event.edit_url, function() {
          $('#event_date_range').val(moment(event.start).format("MM/DD/YYYY") + ' - ' + moment(event.end).format("MM/DD/YYYY"))
          date_range_picker();
          $('.start_hidden').val(moment(event.start).format('YYYY-MM-DD'));
          $('.end_hidden').val(moment(event.end).format('YYYY-MM-DD'));
        });
      },
    });
  })
};
$(document).on('turbolinks:load', initialize_calendar);

