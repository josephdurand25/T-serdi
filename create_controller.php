<?php

$directories = glob(resource_path('views/admin/pages/*'), GLOB_ONLYDIR);

foreach ($directories as $directory) {
    $controllerName = ucfirst(basename($directory)) . 'Controller';
    shell_exec('php artisan make:controller Admin/'. $controllerName);
}

?>
