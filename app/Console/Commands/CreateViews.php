<?php

namespace App\Console\Commands;

use App\Models\Admin\Setting;
use App\Models\Admin\Vue;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Symfony\Component\Console\Output\ConsoleOutput;

class CreateViews extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:create-views';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Create views for all directories in views/admin/pages';

    /**
     * Execute the console command.
     */
    
    public function handle()
    {
        //
        $out = new ConsoleOutput;
        $directories = glob(resource_path('views/admin/pages/*'), GLOB_ONLYDIR);
        $gear = Setting::where('name','SERDI Cameroun')->first();
        $icons = [
            'dashboard' => 'fa-tachometer-alt',
            'abouts' => 'fa-circle-info',
            'users' => 'fa-users',
            'services' => 'fa-service-stack',
            'settings' => 'fa-cogs',
            'produits' => 'fa-product-hunt',
            'sujets'=>"fa-kiwi-bird",
            'vues'=>"fa-link"
            // Ajoutez plus d'icônes ici
        ];
        foreach ($directories as $directory) {

            $viewName = basename($directory);
            $viewFolder = basename($directory);
            $viewPage = 'index'; // Supposons que chaque vue a une page 'index'
            $icon = $icons[$viewFolder] ?? 'fa-question'; // Utilisez une icône par défaut si aucune icône n'est définie pour cette vue
            
            $vues = Vue::where('published', true)->pluck('name_view');
            if (!$vues->contains($viewName)) {
                // La valeur n'est pas dans la collection
                DB::table('vues')->insert([
                    'name_view' => "$viewName",
                    'vue_id_gear' => $gear->id_gear,
                    'ico_view' => "$icon",
                    'view_page' => "$viewPage",
                    'view_folder' => "$viewFolder",
                    'published' => true,
                ]);
                
                $out->writeln("Vue $viewName crée avec succès.");
            }else{
                $out->writeln("La vue $viewName exist déjà.");
            }
        }

    }
}
