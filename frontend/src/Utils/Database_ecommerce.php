<?php

namespace App\Utils;
use \PDO;

class Database_ecommerce {

    private $pdo;

    function __construct() {
        $host = "127.0.0.1";
        $db_user = "ecommerce";
        $db_name = "ecommerce";
        $db_passwd = "ecommerce";
        $charset = 'utf8mb4';
        $dsn = "mysql:host=$host;dbname=$db_name;charset=$charset";
        $options = [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES   => false,
        ];
        try {
            $this->pdo = new PDO($dsn, $db_user, $db_passwd, $options);
        } catch (\PDOException $e) {
            throw new \PDOException($e->getMessage(), (int)$e->getCode());
        }
    }

    public function get_db() { return ($this->pdo); }

}

?>