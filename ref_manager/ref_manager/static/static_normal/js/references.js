$(document).ready(function() {
var $TABLE = $('#table');
var $BTN = $('#export-btn');
var $EXPORT = $('#export');

$('.table-add').click(function () {
  var $clone = $TABLE.find('tr.hide').clone(true).removeClass('hide table-line');
  $TABLE.find('table').append($clone);
});

$('.table-remove').click(function () {
  $(this).parents('tr').detach();
});

$('.table-up').click(function () {
  var $row = $(this).parents('tr');
  if ($row.index() === 1) return; // Don't go above the header
  $row.prev().before($row.get(0));
});

$('.table-down').click(function () {
  var $row = $(this).parents('tr');
  $row.next().after($row.get(0));
});

// A few jQuery helpers for exporting only
jQuery.fn.pop = [].pop;
jQuery.fn.shift = [].shift;

$BTN.click(function () {
  var $rows = $TABLE.find('tr:not(:hidden)');
  var headers = [];
  var data = [];
  
  // Get the headers (add special header logic here)
  $($rows.shift()).find('th:not(:empty)').each(function () {
    headers.push($(this).text().toLowerCase());
  });
  
  // Turn all existing rows into a loopable array
  $rows.each(function () {
    var $td = $(this).find('td');
    var h = {};
    
    // Use the headers from earlier to name our hash keys
    headers.forEach(function (header, i) {
      h[header] = $td.eq(i).text();   
    });
    
    data.push(h);
  });
  
  // Output the result
  $EXPORT.text(JSON.stringify(data));
});


  function getReferences(success, error) {
    $.get( "/references/", function(rawData) {
      if(rawData.error && rawData.error != null) {
        error(rawData.error);
      } else {
        success(rawData.data);
      }
    })
    .fail(error);
  }

  function overwriteReferences(referenceData) {
    clearAllReferences();
    for(int i = 0; i < referenceData.length; i++) {
      var reference = referenceData[i];
      addReferenceToUI(reference);
    }
  }

  function clearAllReferences(){
    console.log("References cleared!");
    //we don't have the DOM done yet, so just simulate htis
  }

  function addReferenceToUI(reference) {
    console.log(JSON.stringify(reference));
    //we don't have the DOM done yet, so just print elements
  }

  getReferences(overwriteReferences, console.log);
});
