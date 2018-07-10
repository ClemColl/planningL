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
        right: 'customWeek, customWeek2'
      },

      buttonText: {
        today: "Aujourd'hui"
      },

      // PARAMETRES
      // se référer à la doc - https://fullcalendar.io/docs
      locale: 'fr',
      schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
      defaultView: 'customWeek',
      weekends: false,
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
        customWeek2: {
          type: 'timeline',
          duration: { days: 14 },
          buttonText: '2 semaines'
        },
        customWeek: {
          type: 'timeline',
          duration: { days: 21 },
          buttonText: '3 semaines'
        }
      },

      //CALLBACKS
      resourceRender: function(resourceObj, labelTds) {
        // Lien Best_in_place (in-place editing)
        // Permet de modifier au click la team / le user
        labelTds[0].children[0].children[0].innerHTML = resourceObj.link + "<br>" + "<br>" +
                                                        resourceObj.delete
        labelTds[1].children[0].innerHTML = resourceObj.user1 + "<br>" +
                                            resourceObj.user2 + "<br>" +
                                            resourceObj.user3
      },

      dayRender: function(date, cell) {
        var cellDate = date.format('YYYY-MM-DD')
          if (cellDate < today) {
            cell[0].className += " before-date";
          }
          // cell[0].style.border = '2px solid black';
      },

      eventRender: function(event, element) { 
        var card = element.find('.fc-content')
          card.html("<div class='card'>" +
                      "<div class='card-header'>" +
                        "<div class='card-title'>" +
                          event.title +
                        "</div>" +
                        "<div class='card-gamme'>" +
                          event.gamme +
                        "</div>" +
                      "</div>" +
                      "<div class='card-se'>" +
                        "<div class='se'>" + event.pieces[0] + "</div>" +
                        "<div class='se'>" + event.pieces[1] + "</div>" +
                        "<div class='se'>" + event.pieces[2] + "</div>" +
                      "</div>" +
                      "<div class='card-se2'>" +
                        "<div class='se'>" + event.pieces[3] + "</div>" +
                        "<div class='se'>" + event.pieces[4] + "</div>" +
                        "<div class='se'>" + event.texte + "</div>" +
                      "</div>" +
                    "</div>"
                  )
      },

      // Sélection de plusieurs jours
      select: function(start, end, event, view, resource) {
          $.getScript('/events/new', function() {
            $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
            $('.team_hidden').val(resource.id);
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
          $('.start_hidden').val(moment(event.start).format('YYYY-MM-DD HH:mm'));
          $('.end_hidden').val(moment(event.end).format('YYYY-MM-DD HH:mm'));
        });
      },
    });
  })
};
$(document).on('turbolinks:load', initialize_calendar);