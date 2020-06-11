$(document).ready(function($){
    var id = window.location.href.substring(window.location.href.lastIndexOf('/') + 1);
    var req = $.ajax({
        url: "http://127.0.0.1:8001/api/articles/" + id,
        context: document.body,
        async: false,
        success : function(text) {
            var ref = $("#miniatures img");
            var contener = $("#miniatures");
            var big_image;
            if (text["primaryImage"] != "")
                big_image = "/images/"+text["primaryImage"];
            else
                big_image = "/images/placeholder.png";
            $("#big_image").attr("src", big_image);
            ref.attr("src", big_image);
            ref.mouseenter(function() {
                $("#big_image").attr("src", $(this).attr("src"));
            });
            text["images"].forEach(Element => 
                $.ajax({
                    url: "http://127.0.0.1:8001"+Element,
                    success: function(text) {
                        var clone = ref.clone();
                        clone.attr("src", "/images/"+text["url"]);
                        clone.mouseenter(function() {
                            $("#big_image").attr("src", $(this).attr("src"));
                        });
                        contener.append(clone);
                    }
                })
            );
            $('#name').html(text["nom"]);
            $('#desc').html(text["description"]);
            $('#prix').html(text["prix"] + " €");
        }
    });
});