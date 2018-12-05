<?php
/**
 * Created by PhpStorm.
 * User: jean-le-grandbokassa
 * Date: 04/12/2018
 * Time: 09:18
 */

if(isset($_GET['page']) && !empty($_GET['page']))
{
    $page = strtolower(trim($_GET['page']));
}
else
{
    $page = 'home';
}


// Tableau contenant toutes les pages
$dir = 'frontend/controllers/';
$allPages = scandir($dir, SCANDIR_SORT_NONE);

var_dump($allPages);


// Vérification de l'existence de la page
if (in_array($page . '_controller.php',$allPages,true))
{

    // Inclusion de la page
    include_once 'frontend/models/'.$page.'_model.php';
    include_once 'frontend/controllers/'.$page.'_controller.php';
    include_once 'frontend/views/'.$page.'_view.php';
    echo 'ok';
}
else {
    // Inclusion de la page erreur
    echo 'no';
}
