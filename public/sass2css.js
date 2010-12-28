$(document).ready(function(){
  // Add event handler to render button.
  $("#render").click(function(event){
    var selectedSyntax = document.form1.syntax[document.form1.syntax.selectedIndex].value;
    var selectedStyle = document.form1.style[document.form1.style.selectedIndex].value;
    $("#dest").load("/convert", {
      src: document.form1.src.value
      , syntax: selectedSyntax
      , style: selectedStyle
    });
  });
});
