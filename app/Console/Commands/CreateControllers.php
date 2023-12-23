<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

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
        $directories = glob(resource_path('views/admin/pages/*'), GLOB_ONLYDIR);

        foreach ($directories as $directory) {
            $controllerName = ucfirst(basename($directory)) . 'Controller';
            $controllerPath = app_path('Http/Controllers/Admin/' . $controllerName . '.php');
        
            if (!file_exists($controllerPath)) {
                shell_exec('php artisan make:controller Admin/'. $controllerName.' --resource');
            }
        }
    }
}
