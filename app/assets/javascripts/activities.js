$(document).on('turbolinks:load', graphMe);

function graphMe() {
  new Morris.Line({
    // ID of the element in which to draw the chart.
    element: 'activities_chart',
    // Chart data records -- each entry in this array corresponds to a point on
    // the chart.
    data: $('#activities_chart').data('activities'),
    // The name of the data record attribute that contains x-values.
    xkey: 'date',
    // A list of names of data record attributes that contain y-values.
    ykeys: ['calorie_burn', 'calorie_intake'],
    // Labels for the ykeys -- will be displayed when you hover over the
    // chart.
    labels: ['Calorie burn', 'Calorie intake']
  });

}
