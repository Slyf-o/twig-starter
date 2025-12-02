<?php

// Définir la racine du projet
define('ROOT_PATH', dirname(__DIR__));

include(ROOT_PATH . '/src/database/connexion.php');
include(ROOT_PATH . '/include/twig.php');

$twig = init_twig();

$page = $_GET['page'] ?? "";
$action = $_GET['action'] ?? "read";
$id = $_GET['id'] ?? 0;

// Routeur - Dirige vers le bon contrôleur
switch ($page) {
  case 'read':
    break;

  default:
    $view = 'accueil.html.twig';
    $data = [];
    break;
}

echo $twig->render($view, $data);