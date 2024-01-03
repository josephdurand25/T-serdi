<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Symfony\Component\Console\Output\ConsoleOutput;

class CreateModels extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:create-models';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Create models for all directories in views/admin/pages';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        //
        $out = new ConsoleOutput;
        $directories = glob(resource_path('views/admin/pages/*'), GLOB_ONLYDIR);

        foreach ($directories as $directory) {
            $modelName = rtrim(ucfirst(basename($directory)), "s");
            $modelPath = app_path('Models/Admin/' . $modelName . '.php');

            if (!file_exists($modelPath)) {
                shell_exec('php artisan make:model Admin/'. $modelName.' -m');
                $out->writeln("Model $modelName crée avec succès.");
            }else{
                $out->writeln("Model $modelName déjà present.");
            }
        }
        $out->writeln("Génération des modelès terminé !");
        shell_exec('php artisan migrate');
        $out->writeln("Migration terminée !");
    }
}
