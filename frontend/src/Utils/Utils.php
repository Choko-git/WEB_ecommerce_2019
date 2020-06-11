<?php

namespace App\Utils;

use Symfony\Component\Intl\Scripts;

class Utils {
    public static function merge_page_body(String $src)
    {
        return (
            preg_replace ("/>[\s]{1,}</", "><", #remove spaces between divs
                preg_replace( "/\r|\n/", "", #remove new lines
                    file_get_contents("../src/vues/header.html").
                    file_get_contents("../src/scripts/".$src)."</head>".
                    file_get_contents("../src/vues/body.html").
                    file_get_contents("../src/vues/".$src).
                    file_get_contents("../src/vues/footer.html")
                )
            )
        );
    }
}
?>