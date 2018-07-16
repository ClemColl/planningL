module ApplicationHelper

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
      fields = f.fields_for(association, new_object, child_index: id) do |builder|
        render(association.to_s.singularize + "_fields", f: builder)
      end
    link_to(name, '#', class: " add_fields btn btn-default", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def backlog_charts(isHidden, nb_semaine)
    backlog = Backlog.where(quart: ((Date.today-1.week).month / 3.0).ceil, created_at: (Date.today-4.months)..(Date.today+1.week))
    backlog_mac = []
    backlog_mfc = []
    backlog_mfcl = []

    backlog_ytd = []
    backlog_ytdl = []

    backlog_mb = []
    backlog_ob = []
    
    nb_semaine.times do |x|
      if backlog[x]
        backlog_mac << backlog[x].mac
        backlog_mfc << backlog[x].mfc
        backlog_mfcl << backlog[x].mfcl

        backlog_ytd << backlog[x].ytd
        backlog_ytdl << backlog[x].ytdl

        backlog_mb << backlog[x].mb
        backlog_ob << backlog[x].ob
      end
    end

    visible = []
    
    if isHidden == true
      visible[0] = "$('#backlog').css('visibility', 'hidden');"
      visible[1] = "$('#ytd').css('visibility', 'hidden');"
    else
      visible[0] = ""
      visible[1] = ""
    end
    #Backlog
    "<script>
    var ctx = document.getElementById('backlog').getContext('2d');
    var backlog = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: [#{@range}],
            datasets: [
            {
            label: 'Montant attendu à fin de mois courant',
            yAxisID: 'A',
            type: 'line',
            data: [#{backlog_mac.join(", ")}],
            borderColor: '#4674C1',
            backgroundColor: '#4674C1',
            fill: false
            },
            {
            label: 'Montant facturation courante',
            yAxisID: 'A',
            data: [#{backlog_mfc.join(", ")}],
            borderColor: '#EB7D3C',
            backgroundColor: '#EB7D3C'
            },
            {
            label: 'Montant facturation courante - année précédente',
            yAxisID: 'A',
            data: [#{backlog_mfcl.join(", ")}],
            borderColor: '#FDBF2D',
            backgroundColor: '#FDBF2D'
            },
            {
            label: 'Montant backlog en K€',
            yAxisID: 'B',
            type: 'line',
            data: [#{backlog_mb.join(", ")}],
            borderColor: '#000000',
            backgroundColor: '#000000',
            fill: false        
            },
            {
            label: 'Objectif backlog en K€',
            yAxisID: 'B',
            type: 'line',
            data: [#{backlog_ob.join(", ")}],
            borderColor: '#A5A5A5',
            backgroundColor: '#A5A5A5',
            fill: false
            }]
        },
        options: {
            scaleShowVerticalLines: false,
            spanGaps: true,
            animation: { duration: 0 },
            responsive: false,
            maintainAspectRatio: false,
            onAnimationComplete: setTimeout( function() {
                var dataURL = backlog.toBase64Image();
                $('#backlog_base64').val(dataURL);
                },1000),
            scales: {
                yAxes: [{
                    id: 'A',
                    type: 'linear',
                    position: 'left',
                    scaleLabel: { display: true, labelString: 'Facturation' },
                    ticks: { max: 5, min: 0 }
                }, {
                    id: 'B',
                    type: 'linear',
                    position: 'right',
                    scaleLabel: { display: true, labelString: 'Backlog' },
                    ticks: { beginAtZero: true, stepSize: 20}}],
                xAxes: [{ barThickness: 5, gridLines: { offsetGridLines: true, display: false }}],
                },
            elements: { line: { tension: 0 }, point: { radius: 3 }},
            title: { display: true, text: 'Consommables et pièces', fontSize: 30 }
            }
        });
    #{visible[0]}
    </script>
    <script>
    var htx = document.getElementById('ytd').getContext('2d');
    var ytd = new Chart(htx, {
    type: 'line',
    data: {
        labels: [#{@range}],
        datasets: [{
            label: 'Year-to-date N',
            //yAxisID: 'A',
            data: [#{backlog_ytd.join(", ")}],
            borderColor: '#EB7D3C',
            backgroundColor: '#EB7D3C',
            fill: false
        },
        {
            label: 'Year-to-date N-1',
            //yAxisID: 'A',
            data: [#{backlog_ytdl.join(", ")}],
            borderColor: '#4674C1',
            backgroundColor: '#4674C1',
            fill: false
        }
    ]
    },
    options: {
        scaleShowVerticalLines: false,
        spanGaps: true,
        animation: { duration: 0 },
        responsive: false,
        maintainAspectRatio: false,
        onAnimationComplete: setTimeout( function() {
            var dataURL = ytd.toBase64Image();
            $('#ytd_base64').val(dataURL);
            },1000),
        scales: {
            yAxes: [{
                type: 'linear',
                position: 'left',
                scaleLabel: { display: false, labelString: 'Facturation' }
                }
            ],
             xAxes: [{ barThickness: 5, gridLines: { offsetGridLines: true, display: false }}],
            },
        elements: { line: { tension: 0 }, point: { radius: 3 }},
        title: { display: true, text: 'Year-To-Date Conso. pièces', fontSize: 30 }}});
    #{visible[1]}
    </script>".html_safe

  end

  def stock_chart(isHidden, nb_semaine)
    stock = Stock.where(quart: ((Date.today-1.week).month / 3.0).ceil, created_at: (Date.today-4.months)..(Date.today+1.week))
    stock_smc = []
    stock_rmc = []
    stock_sma = []
    stock_rma = []

    nb_semaine.times do |x|
      if stock[x]
        stock_smc << stock[x].smc
        stock_rmc << stock[x].rmc
        stock_sma << stock[x].sma
        stock_rma << stock[x].rma
      end
    end

    if isHidden == true
      visible = "$('#stock').css('visibility', 'hidden');"
    else
      visible = ""
    end

    "<script>
    var ctx = document.getElementById('stock').getContext('2d');
    var stock = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: [#{@range}],
        datasets: [{
          label: 'Stock: Montant courant',
          data: [#{stock_smc.join(", ")}],
          borderColor: '#EB7D3C',
          backgroundColor: '#EB7D3C'
        },
        {
          label: 'Réception: Montant courant',
          data: [#{stock_rmc.join(", ")}],
          borderColor: '#4674C1',
          backgroundColor: '#4674C1'
        },
        {
          label: 'Stock: Montant attendu',
          type: 'line',
          data: [#{stock_sma.join(", ")}],
          borderColor: '#000000',
          backgroundColor: '#000000',
          fill: false
        },
        {
          label: 'Réception: Montant attendu',
          type: 'line',
          data: [#{stock_rma.join(", ")}],
          borderColor: '#A5A5A5',
          backgroundColor: '#A5A5A5',
          fill: false
        }]
    },
    options: {
        scaleShowVerticalLines: false,
        spanGaps: true,
        animation: {
            duration: 0
        },
        responsive: false,
        maintainAspectRatio: false,
        onAnimationComplete: setTimeout( function() {
            var dataURL = stock.toBase64Image();
            $('#stock_base64').val(dataURL);
            },1000),
        scales: {
            yAxes: [{
                ticks: { beginAtZero: true, stepSize: 5 }
            }],
            xAxes: [{
                barThickness: 5,
                gridLines: { offsetGridLines: true, display: false }
            }],
        },
        elements: {
            line: { tension: 0 },
            point: { radius: 3 }
        },
        title: { display: true, text: 'État du Stock', fontSize: 30}
    }
    });
    #{visible}
    </script>".html_safe
  end

end
