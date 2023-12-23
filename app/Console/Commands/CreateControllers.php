<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Symfony\Component\Console\Output\ConsoleOutput;

class CreateControllers extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:create-controllers';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Create controllers for all directories in views/admin/pages';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $out = new ConsoleOutput;
        $directories = glob(resource_path('views/admin/pages/*'), GLOB_ONLYDIR);

        foreach ($directories as $directory) {
            $controllerName = ucfirst(basename($directory)) . 'Controller';
            $controllerPath = app_path('Http/Controllers/Admin/' . $controllerName . '.php');
        
            if (!file_exists($controllerPath)) {
                shell_exec('php artisan make:controller Admin/'. $controllerName.' --resource');
                $out->writeln("Controller $controllerName crée avec succès.");
            }else{
                $out->writeln("Controller $controllerName existe déjà.");
            }
        }
    }
}
