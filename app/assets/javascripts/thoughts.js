var ready
ready=function(){
  // if ($('.label-info').length) {}
  //  else {$(".bootstrap-tagsinput").find("input").attr({placeholder: "Add to thoughts...", style: "width: 10em ! important;"});}
  $(".bootstrap-tagsinput").hide();
  $('.thought-respond').click(function(){
      // var thoughtid= 2 ;
      $(".bootstrap-tagsinput").show();
      SelectElement("Add");
      var thoughtid= $(this).attr("data-id");
      // var thoughtid= $(this).data('id');
      // alert(thoughtid) ;
      // $(".bootstrap-tagsinput").find("input").removeAttr("placeholder");
      // $("input[placeholder='Respond to thoughts']").val("")
      $('#thought_tag_list').tagsinput('add', thoughtid);
    });
  var c=0;
  function postVisible(){
    if ($('#visibility-point').visible())
     { }
   else{
    c=c+1;
  // alert("2");
  $('#thought_content').css("height", "-=50");
  // $('#thought_content').animate({height: "-=50"},0);
  if (c>4)
  {}
else
  { postVisible();}
}}
postVisible();

};


$(document).ready(ready);
$(document).on('page:load', ready);
