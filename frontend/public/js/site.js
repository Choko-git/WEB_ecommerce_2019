$(document).ready(function($){
    var copie = $('#voiture1').clone();

    var req = $.ajax({
        url: "http://127.0.0.1:8001/api/articles",
        context: document.body,
        success : function(text) {
            var row_count = 0
            var total_items = 0
            var row = $(".row");
            var copie = $("#box .row .col");
            text["hydra:member"].forEach(element => {
                if (element["primaryImage"] != "")
                    copie.find('img').attr("src", "images/" + element["primaryImage"]);
                else
                    copie.find('img').attr("src", "images/placeholder.png");
                copie.find('.lien').attr("href", "article/"+element["id"]);
                copie.find('.name').html(element["nom"]);
                copie.find('.desc').html(element["prix"] + " €");
                row.append(copie);
                copie = copie.clone();
                total_items += 1;
                if (total_items >= 3) {
                    total_items = 0;
                    row_count += 1;
                    row = row.clone();
                    row.html("");
                    $("#box").append(row);
                }
            });
            if (!total_items && !row_count) {
                $("#box .row .col").html("No items found");
            }
        }
    });
});