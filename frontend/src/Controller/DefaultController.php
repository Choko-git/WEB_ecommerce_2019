<?php

namespace App\Controller;
use \PDO;
use App\Service\MarkdownHelper;
use Symfony\Component\HttpFoundation\Response;
use Psr\Log\LoggerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Twig\Environment;
use Symfony\Component\Config\Definition\Exception\Exception;

use App\Utils\Database_ecommerce;
use App\Utils\Utils;

class DefaultController {

    private $db;

    function __construct(bool $isDebug) {
        $this->db = new Database_ecommerce;
    }

    public function index(bool $isDebug) {

        $response = new Response(
            Utils::merge_page_body("index.html"),
            Response::HTTP_OK,
            ['content-type' => 'text/html']
        );
        return ($response);
    }


    public function article(bool $isDebug) {
        $response = new Response(
            Utils::merge_page_body("article.html"),
            Response::HTTP_OK,
            ['content-type' => 'text/html']
        );
        return ($response);
    }

    public function pannier(bool $isDebug) {
        return (new Response(Utils::merge_page_body("pannier.html")));
    }
}

?>