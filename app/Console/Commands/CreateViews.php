<?php

namespace App\Console\Commands;

use App\Models\Admin\Setting;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

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
        $directories = glob(resource_path('views/admin/pages/*'), GLOB_ONLYDIR);

        // $setting = Setting::first();
        // if($setting == null){
        //     DB::table('settings')->insert([
        //         'name' => 'Star Car Compnay',
        //         'slogan' => 'Nous rencontrer, c\'est avancer !',
        //         'email' => 'durandjosephadji25@gmail.com',
        //         'address' => 'Bali carrefour kayéoli',
        //         'logo' => 'storage/utilities/setting/icons8_question_mark.ico',
        //         'galerie' => "storage/utilities/setting/icons8_questions_32px.png",
        //     ]);
        // }
        $icons = [
            'dashboard' => 'fa-tachometer-alt',
            'users' => 'fa-users',
            'settings' => 'fa-cogs',
            'sujets'=>"fa-kiwi-bird",
            'vues'=>"fa-link"
            // Ajoutez plus d'icônes ici
        ];
        // <i class="fa-solid fa-question"></i>
        foreach ($directories as $directory) {
            $viewName = basename($directory);
            $viewFolder = basename($directory);
            $viewPage = 'index'; // Supposons que chaque vue a une page 'index'
            $icon = $icons[$viewFolder] ?? 'fa-solid fa-question'; // Utilisez une icône par défaut si aucune icône n'est définie pour cette vue

            DB::table('vues')->insert([
                'name_view' => "$viewName",
                'vue_id_gear' => 1,
                'ico_view' => "$icon",
                'view_page' => "$viewPage",
                'view_folder' => "$viewFolder",
                'published' => true,
            ]);
        }

    }
}
