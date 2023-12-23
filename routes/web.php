<?php

use App\Models\Admin\Vues;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\View;


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
Route::prefix('admin')->name('admin.')->group(function () {    
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
                'store' => '.add',
                // 'show' => 'admin.'.$prefix.'show',
                'edit' => '.edit',
                'update' => '.update', 
                'destroy' => '.destroy',
            ]);
        });
    }
});