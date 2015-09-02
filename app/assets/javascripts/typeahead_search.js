$(document).ready(function(){

  var names = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace('name'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {url: "users?search=%QUERY" , wildcard: '%QUERY'
        }
      });

  names.initialize();

  $('.typeahead').typeahead({
    hint: true,
    highlight: true,
    minLength: 1
  },
  {
    name: 'users',
    displayKey: 'name' ,
    source: names.ttAdapter()
  });


});
