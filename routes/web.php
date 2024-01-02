<?php

use App\Models\Admin\About;
use App\Models\Admin\Setting;
use App\Models\Admin\Vue;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\View;


// $settings = Setting::where('name','Star Car Compnay')->get();
$setting = Setting::where('name','SERDI Cameroun')->first();
View::share('setting', $setting);

Route::prefix('admin')->name('admin.')->group(function () {    
    $vues = Vue::where('published', true)->where('vue_id_gear',1)->get();
    View::share('vues', $vues);
    // dd($settings);
    Route::view('/','admin.dashboard')->name('dashboard');
    foreach (File::directories(resource_path('views/admin/pages')) as $directory) {
        $prefix = basename($directory).'/';
        $controller = 'App\\Http\\Controllers\\Admin\\' . ucfirst(basename($directory)) . 'Controller';
        Route::prefix($prefix)->name(basename($directory))->group(function () use ($controller, $prefix) {
            Route::resource('/', $controller)->names([
                'index' => '.index',
                'create' => '.create',
                'store' => '.add',
                // 'show' => 'admin.'.$prefix.'show',
                'edit' => '.edit',
                'update' => '.update', 
                'destroy' => '.destroy',
            ]);
        });
    }
});

Route::get('accueil',function(){
    $setting = Setting::where('name','SERDI Cameroun')->first();
    $about = About::where('published',true)->where('about_id_gear',$setting->id_gear)->first();
    // dd($about);
    return view('web.pages.accueil',compact('about'));
})->name('home');
// Route::view('accueil','web.pages.accueil');



/* version 2
Route::namespace('Admin')->prefix('admin/')->name('admin.')->group(function (){
    
    foreach (File::directories(resource_path('views/admin/pages')) as $directory) {
            $controller = 'App\\Http\\Controllers\\Admin\\' . ucfirst(basename($directory)) . 'Controller';
        }
        
        $vues = Vues::where('published', true)->get();
        View::share('vues', $vues);
        Route::view('/','admin.dashboard')->name('dashboard');
        foreach (File::directories(resource_path('views/admin/pages')) as $directory) {
            $prefix = basename($directory).'/';
            $controller = ucfirst(basename($directory)).'Controller';
            // dd($controller);
            Route::prefix($prefix)->name(basename($directory))->group(function () use ($controller, $prefix) {
                Route::resource('/', $controller)->names([
                    'index' => '.index',
                    'create' => '.create',
                    'store' => '.store',
                    // 'show' => 'admin.'.$prefix.'show',
                    'edit' => '.edit',
                    'update' => '.update', 
                    'destroy' => '.destroy',
                ]);
            });
        }
        
    }); 
    */
    /* version 3
    Route::prefix('admin/')->name('admin.')->group(function (){
        foreach (File::directories(resource_path('views/admin/pages')) as $directory) {
            $controller = 'App\\Http\\Controllers\\Admin\\' . ucfirst(basename($directory)) . 'Controller';
            // Utilisez $controller ici
        }
        
    $vues = Vues::where('published', true)->get();
    View::share('vues', $vues);
    Route::view('/','admin.dashboard')->name('dashboard');
    foreach (File::directories(resource_path('views/admin/pages')) as $directory) {
        $prefix = basename($directory).'/';
        $controller = 'App\\Http\\Controllers\\Admin\\' . ucfirst(basename($directory)) . 'Controller';
        Route::prefix($prefix)->name(basename($directory))->group(function () use ($controller, $prefix) {
            Route::resource('/', $controller)->names([
                'index' => '.index',
                'create' => '.create',
                'store' => '.store',
                // 'show' => 'admin.'.$prefix.'show',
                'edit' => '.edit',
                'update' => '.update', 
                'destroy' => '.destroy',
            ]);
        });
    }
}); */



