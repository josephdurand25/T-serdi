[1mdiff --git a/app/Console/Commands/CreateViews.php b/app/Console/Commands/CreateViews.php[m
[1mindex b3c7365..6d3f869 100644[m
[1m--- a/app/Console/Commands/CreateViews.php[m
[1m+++ b/app/Console/Commands/CreateViews.php[m
[36m@@ -2,6 +2,7 @@[m
 [m
 namespace App\Console\Commands;[m
 [m
[32m+[m[32muse App\Models\Admin\Setting;[m
 use Illuminate\Console\Command;[m
 use Illuminate\Support\Facades\DB;[m
 [m
[36m@@ -30,6 +31,17 @@[m [mpublic function handle()[m
         //[m
         $directories = glob(resource_path('views/admin/pages/*'), GLOB_ONLYDIR);[m
 [m
[32m+[m[32m        // $setting = Setting::first();[m
[32m+[m[32m        // if($setting == null){[m
[32m+[m[32m        //     DB::table('settings')->insert([[m
[32m+[m[32m        //         'name' => 'Star Car Compnay',[m
[32m+[m[32m        //         'slogan' => 'Nous rencontrer, c\'est avancer !',[m
[32m+[m[32m        //         'email' => 'durandjosephadji25@gmail.com',[m
[32m+[m[32m        //         'address' => 'Bali carrefour kayéoli',[m
[32m+[m[32m        //         'logo' => 'storage/utilities/setting/icons8_question_mark.ico',[m
[32m+[m[32m        //         'galerie' => "storage/utilities/setting/icons8_questions_32px.png",[m
[32m+[m[32m        //     ]);[m
[32m+[m[32m        // }[m
         $icons = [[m
             'dashboard' => 'fa-tachometer-alt',[m
             'users' => 'fa-users',[m
[36m@@ -46,12 +58,14 @@[m [mpublic function handle()[m
             $icon = $icons[$viewFolder] ?? 'fa-solid fa-question'; // Utilisez une icône par défaut si aucune icône n'est définie pour cette vue[m
 [m
             DB::table('vues')->insert([[m
[31m-                'name_view' => $viewName,[m
[31m-                'ico_view' => $icon,[m
[31m-                'view_page' => $viewPage,[m
[31m-                'view_folder' => $viewFolder,[m
[32m+[m[32m                'name_view' => "$viewName",[m
[32m+[m[32m                'vue_id_gear' => 1,[m
[32m+[m[32m                'ico_view' => "$icon",[m
[32m+[m[32m                'view_page' => "$viewPage",[m
[32m+[m[32m                'view_folder' => "$viewFolder",[m
                 'published' => true,[m
             ]);[m
         }[m
[32m+[m
     }[m
 }[m
[1mdiff --git a/app/Http/Controllers/Admin/AboutController.php b/app/Http/Controllers/Admin/AboutController.php[m
[1mdeleted file mode 100644[m
[1mindex c8588db..0000000[m
[1m--- a/app/Http/Controllers/Admin/AboutController.php[m
[1m+++ /dev/null[m
[36m@@ -1,77 +0,0 @@[m
[31m-<?php[m
[31m-[m
[31m-namespace App\Http\Controllers\Admin;[m
[31m-[m
[31m-use App\Http\Controllers\Controller;[m
[31m-use App\Http\Requests\FormAboutRequest;[m
[31m-use Illuminate\Http\Request;[m
[31m-[m
[31m-class AboutController extends Controller[m
[31m-{[m
[31m-    /**[m
[31m-     * Display a listing of the resource.[m
[31m-     */[m
[31m-    public function index()[m
[31m-    {[m
[31m-        //[m
[31m-        return view('admin.pages.about.index');[m
[31m-    }[m
[31m-[m
[31m-    /**[m
[31m-     * Show the form for creating a new resource.[m
[31m-     */[m
[31m-    public function create()[m
[31m-    {[m
[31m-        //[m
[31m-    }[m
[31m-[m
[31m-    /**[m
[31m-     * Store a newly created resource in storage.[m
[31m-     */[m
[31m-    public function store(Request $request)[m
[31m-    {[m
[31m-        //[m
[31m-        // if (isset($request->input('image-about'))) {[m
[31m-        //     # code...[m
[31m-        // } else {[m
[31m-        //     # code...[m
[31m-        // }[m
[31m-        [m
[31m-        [m
[31m-        // $about = new About[m
[31m-        // dd($validateData);[m
[31m-        [m
[31m-    }[m
[31m-[m
[31m-    /**[m
[31m-     * Display the specified resource.[m
[31m-     */[m
[31m-    public function show(string $id)[m
[31m-    {[m
[31m-        //[m
[31m-    }[m
[31m-[m
[31m-    /**[m
[31m-     * Show the form for editing the specified resource.[m
[31m-     */[m
[31m-    public function edit(string $id)[m
[31m-    {[m
[31m-        //[m
[31m-    }[m
[31m-[m
[31m-    /**[m
[31m-     * Update the specified resource in storage.[m
[31m-     */[m
[31m-    public function update(Request $request, string $id)[m
[31m-    {[m
[31m-        //[m
[31m-    }[m
[31m-[m
[31m-    /**[m
[31m-     * Remove the specified resource from storage.[m
[31m-     */[m
[31m-    public function destroy(string $id)[m
[31m-    {[m
[31m-        //[m
[31m-    }[m
[31m-}[m
[1mdiff --git a/app/Http/Controllers/Admin/AboutsController.php b/app/Http/Controllers/Admin/AboutsController.php[m
[1mnew file mode 100644[m
[1mindex 0000000..31e05ad[m
[1m--- /dev/null[m
[1m+++ b/app/Http/Controllers/Admin/AboutsController.php[m
[36m@@ -0,0 +1,133 @@[m
[32m+[m[32m<?php[m
[32m+[m
[32m+[m[32mnamespace App\Http\Controllers\Admin;[m
[32m+[m
[32m+[m[32muse App\Http\Controllers\Controller;[m
[32m+[m[32muse App\Http\Requests\FormAboutRequest;[m
[32m+[m[32muse App\Models\Admin\About;[m
[32m+[m[32muse App\Models\Admin\Setting;[m
[32m+[m[32muse Illuminate\Http\Request;[m
[32m+[m
[32m+[m[32mclass AboutsController extends Controller[m
[32m+[m[32m{[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Display a listing of the resource.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function index()[m
[32m+[m[32m    {[m
[32m+[m[32m        //[m
[32m+[m[32m        // $about = About[m
[32m+[m[32m        return view('admin.pages.abouts.index');[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Show the form for creating a new resource.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function create()[m
[32m+[m[32m    {[m
[32m+[m[32m        //[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Store a newly created resource in storage.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function store(FormAboutRequest $request)[m
[32m+[m[32m    {[m
[32m+[m[32m        //[m
[32m+[m[32m        $setting = Setting::where('name','SERDI Cameroun')->first();[m
[32m+[m
[32m+[m[32m        $validateData = $request->validated();[m
[32m+[m[32m        $about_old = About::where('published',true)->first();[m
[32m+[m[32m        if (isset($about_old)) {[m
[32m+[m[32m            # code...[m
[32m+[m[32m            // $about = new About;[m
[32m+[m[32m            if ($validateData['description'] && $validateData['image-about'] ) {[m
[32m+[m[32m                # code...[m
[32m+[m[32m                $about_old->text_about = $validateData['description'];[m
[32m+[m[32m                $image=$image=$validateData['image-about'];[m
[32m+[m[32m                // format : titre-prenom.extention[m
[32m+[m[32m                $nameimage = 'about-img.'.$image->getClientOriginalExtension();[m
[32m+[m[32m                $image->move('storage/utilities/about', $nameimage);[m
[32m+[m[32m                $about_old->img_about = "storage/utilities/about/{$nameimage}";[m
[32m+[m[32m                $result = $about_old->save();[m
[32m+[m[32m                if($result){[m
[32m+[m[32m                    return redirect()->back()->with('success', 'La mise à jour de la section \'A propos \' effectuée avec succès.') ;[m
[32m+[m[32m                }else{[m
[32m+[m[32m                    return redirect()->back()->with('echec', 'La mise à jour de la section \'A propos \' a échoué.');[m
[32m+[m[32m                }[m
[32m+[m[32m            } elseif($validateData['description'] && !$validateData['image-about']) {[m
[32m+[m[32m                # code...[m
[32m+[m[32m                $about_old->text_about = $validateData['description'];[m
[32m+[m[32m                $result = $about_old->save();[m
[32m+[m[32m                if($result){[m
[32m+[m[32m                    return redirect()->back()->with('success', 'La description de la section \'A propos \' a été définie avec succès.') ;[m
[32m+[m[32m                }else{[m
[32m+[m[32m                    return redirect()->back()->with('echec', 'La mise à jour de la description de la section \'A propos \' a échoué.');[m
[32m+[m[32m                }[m
[32m+[m[32m            } else{[m
[32m+[m[32m                # code...[m
[32m+[m[32m                $image=$validateData['image-about'];[m
[32m+[m[32m                // format : titre-prenom.extention[m
[32m+[m[32m                $nameimage = 'about-img'.$image->getClientOriginalExtension();[m
[32m+[m[32m                $image->move('storage/utiilities/about', $nameimage);[m
[32m+[m[32m                $about_old->img_about = "storage/utiilities/about/{$nameimage}";[m
[32m+[m[32m                $result=$about_old->save();[m
[32m+[m[32m                if($result){[m
[32m+[m[32m                    return redirect()->back()->with('success', 'L\image de la section \'A propos \' a été définie avec succès.') ;[m
[32m+[m[32m                }else{[m
[32m+[m[32m                    return redirect()->back()->with('echec', 'La mise à jour de l\'image de la section \'A propos \' a échoué.');[m
[32m+[m[32m                }[m
[32m+[m[32m            }[m
[32m+[m[41m            [m
[32m+[m[32m        } else {[m
[32m+[m[32m        //     # code...[m
[32m+[m[32m        // dd($setting);[m
[32m+[m[32m            $about = new About;[m
[32m+[m[32m            $about->about_id_gear  = $setting->id_gear;[m
[32m+[m[32m            $about->text_about = $validateData['description'];[m
[32m+[m[32m            $image=$validateData['image-about'];[m
[32m+[m[32m            // format : titre-prenom.extention[m
[32m+[m[32m            $nameimage = 'about-img'.$image->getClientOriginalExtension();[m
[32m+[m[32m            $image->move('storage/utiilities/about', $nameimage);[m
[32m+[m[32m            $about->img_about = "storage/utiilities/about/{$nameimage}";[m
[32m+[m[32m           $result= $about->save();[m
[32m+[m[32m            if($result){[m
[32m+[m[32m                return redirect()->back()->with('success', 'La section \'A propos \' a été définie avec succès.') ;[m
[32m+[m[32m            }else{[m
[32m+[m[32m                return redirect()->back()->with('echec', 'La mise à jour de la section à propos a échoué.');[m
[32m+[m[32m            }[m
[32m+[m[32m        }[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Display the specified resource.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function show(string $id)[m
[32m+[m[32m    {[m
[32m+[m[32m        //[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Show the form for editing the specified resource.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function edit(string $id)[m
[32m+[m[32m    {[m
[32m+[m[32m        //[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Update the specified resource in storage.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function update(Request $request, string $id)[m
[32m+[m[32m    {[m
[32m+[m[32m        //[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Remove the specified resource from storage.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function destroy(string $id)[m
[32m+[m[32m    {[m
[32m+[m[32m        //[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
[1mdiff --git a/app/Http/Controllers/Admin/ServicesController.php b/app/Http/Controllers/Admin/ServicesController.php[m
[1mnew file mode 100644[m
[1mindex 0000000..6445997[m
[1m--- /dev/null[m
[1m+++ b/app/Http/Controllers/Admin/ServicesController.php[m
[36m@@ -0,0 +1,88 @@[m
[32m+[m[32m<?php[m
[32m+[m
[32m+[m[32mnamespace App\Http\Controllers\Admin;[m
[32m+[m
[32m+[m[32muse App\Http\Controllers\Controller;[m
[32m+[m[32muse App\Http\Requests\FormServicesRequest;[m
[32m+[m[32muse App\Models\Admin\Service;[m
[32m+[m[32muse App\Models\Admin\Setting;[m
[32m+[m[32muse Illuminate\Http\Request;[m
[32m+[m
[32m+[m[32mclass ServicesController extends Controller[m
[32m+[m[32m{[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Display a listing of the resource.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function index()[m
[32m+[m[32m    {[m
[32m+[m[32m        //[m
[32m+[m[32m        return view('admin.pages.services.index');[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Show the form for creating a new resource.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function create()[m
[32m+[m[32m    {[m
[32m+[m[32m        //[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Store a newly created resource in storage.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function store(FormServicesRequest $request)[m
[32m+[m[32m    {[m
[32m+[m[32m        //[m
[32m+[m[32m        $setting = Setting::where('name','SERDI Cameroun')->first();[m
[32m+[m
[32m+[m[32m        $validateData=$request->validated();[m
[32m+[m[32m        // dd($validateData);[m
[32m+[m[32m        $service = new Service;[m
[32m+[m[32m        $service->service_id_gear  = $setting->id_gear;[m
[32m+[m[32m        $service->intitule = $validateData['intitule'];[m
[32m+[m[32m        $service->description = $validateData['description'];[m
[32m+[m[32m        $image=$validateData['img_service'];[m
[32m+[m[32m        // format : titre-prenom.extention[m
[32m+[m[32m        $nameimage = $service->intitule.'.'.$image->getClientOriginalExtension();[m
[32m+[m[32m        $image->move('storage/utiilities/service', $nameimage);[m
[32m+[m[32m        $service->img_service = "storage/utiilities/service/{$nameimage}";[m
[32m+[m[32m       $result= $service->save();[m
[32m+[m[32m       if($result){[m
[32m+[m[32m        return redirect()->back()->with('success', "Service '$service->intitule' crée avec succès.") ;[m
[32m+[m[32m    }else{[m
[32m+[m[32m        return redirect()->back()->with('echec', "Le service '$service->intitule' n'a pas été crée.");[m
[32m+[m[32m    }[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Display the specified resource.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function show(string $id)[m
[32m+[m[32m    {[m
[32m+[m[32m        //[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Show the form for editing the specified resource.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function edit(string $id)[m
[32m+[m[32m    {[m
[32m+[m[32m        //[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Update the specified resource in storage.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function update(Request $request, string $id)[m
[32m+[m[32m    {[m
[32m+[m[32m        //[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Remove the specified resource from storage.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function destroy(string $id)[m
[32m+[m[32m    {[m
[32m+[m[32m        //[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
[1mdiff --git a/app/Http/Controllers/Admin/SettingsController.php b/app/Http/Controllers/Admin/SettingsController.php[m
[1mnew file mode 100644[m
[1mindex 0000000..f3640e6[m
[1m--- /dev/null[m
[1m+++ b/app/Http/Controllers/Admin/SettingsController.php[m
[36m@@ -0,0 +1,90 @@[m
[32m+[m[32m<?php[m
[32m+[m
[32m+[m[32mnamespace App\Http\Controllers\Admin;[m
[32m+[m
[32m+[m[32muse App\Http\Controllers\Controller;[m
[32m+[m[32muse App\Http\Requests\FormSettingsRequest;[m
[32m+[m[32muse App\Models\Admin\Setting;[m
[32m+[m[32muse Illuminate\Http\Request;[m
[32m+[m
[32m+[m[32mclass SettingsController extends Controller[m
[32m+[m[32m{[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Display a listing of the resource.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function index()[m
[32m+[m[32m    {[m
[32m+[m[32m        //[m
[32m+[m[32m        return view('admin.pages.settings.index');[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Show the form for creating a new resource.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function create()[m
[32m+[m[32m    {[m
[32m+[m[32m        //[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Store a newly created resource in storage.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function store(FormSettingsRequest $request)[m
[32m+[m[32m    {[m
[32m+[m[32m        //[m
[32m+[m[32m        $validateData = $request->validated();[m
[32m+[m[32m        $setting = new Setting;[m
[32m+[m[32m        $setting->name=$validateData['entreprise'];[m
[32m+[m[32m        $setting->slogan=$validateData['slogan'];[m
[32m+[m[32m        $setting->email=$validateData['email'];[m
[32m+[m[32m        $setting->address=$validateData['address'];[m
[32m+[m[41m        [m
[32m+[m[32m        $image1 = $validateData['logo'];[m
[32m+[m[32m        $nameimage1 ='logo-'.$validateData['entreprise'].'.'.$image1->getClientOriginalExtension();[m
[32m+[m[32m        $image1->move('storage/utilities/setting', $nameimage1);[m
[32m+[m[32m        $setting->logo = "storage/utilities/setting/{$nameimage1}";[m
[32m+[m[41m        [m
[32m+[m[32m        $image2 = $validateData['galerie'];[m
[32m+[m[32m        $nameimage2 =$validateData['entreprise'].'.'.$image2->getClientOriginalExtension();[m
[32m+[m[32m        $image2->move('storage/utilities/setting', $nameimage2);[m
[32m+[m[32m        $setting->galerie = "storage/utilities/setting/{$nameimage2}";[m
[32m+[m[32m        $put_in_db = $setting->save();[m
[32m+[m[32m        // dd($setting);[m
[32m+[m[32m        if ($put_in_db){[m
[32m+[m[32m            return to_route('admin.dashboard')->with('success','entreprise enregistrée avec succès.');[m
[32m+[m[32m        }else{[m
[32m+[m[32m            return to_route('dashboard')->with('error','infos d\'entreprise non enregistrées.');[m
[32m+[m[32m        }[m
[32m+[m[32m    }[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Display the specified resource.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function show(string $id)[m
[32m+[m[32m    {[m
[32m+[m[32m        //[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Show the form for editing the specified resource.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function edit(string $id)[m
[32m+[m[32m    {[m
[32m+[m[32m        //[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Update the specified resource in storage.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function update(Request $request, string $id)[m
[32m+[m[32m    {[m
[32m+[m[32m        //[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Remove the specified resource from storage.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function destroy(string $id)[m
[32m+[m[32m    {[m
[32m+[m[32m        //[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
[1mdiff --git a/app/Http/Controllers/WebController.php b/app/Http/Controllers/WebController.php[m
[1mnew file mode 100644[m
[1mindex 0000000..6bc3f55[m
[1m--- /dev/null[m
[1m+++ b/app/Http/Controllers/WebController.php[m
[36m@@ -0,0 +1,10 @@[m
[32m+[m[32m<?php[m
[32m+[m
[32m+[m[32mnamespace App\Http\Controllers;[m
[32m+[m
[32m+[m[32muse Illuminate\Http\Request;[m
[32m+[m
[32m+[m[32mclass WebController extends Controller[m
[32m+[m[32m{[m
[32m+[m[32m    //[m
[32m+[m[32m}[m
[1mdiff --git a/app/Http/Requests/FormServicesRequest.php b/app/Http/Requests/FormServicesRequest.php[m
[1mnew file mode 100644[m
[1mindex 0000000..0fa4369[m
[1m--- /dev/null[m
[1m+++ b/app/Http/Requests/FormServicesRequest.php[m
[36m@@ -0,0 +1,43 @@[m
[32m+[m[32m<?php[m
[32m+[m
[32m+[m[32mnamespace App\Http\Requests;[m
[32m+[m
[32m+[m[32muse Illuminate\Foundation\Http\FormRequest;[m
[32m+[m[32muse Illuminate\Validation\Rule;[m
[32m+[m
[32m+[m[32mclass FormServicesRequest extends FormRequest[m
[32m+[m[32m{[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Determine if the user is authorized to make this request.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function authorize(): bool[m
[32m+[m[32m    {[m
[32m+[m[32m        return true;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Get the validation rules that apply to the request.[m
[32m+[m[32m     *[m
[32m+[m[32m     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>[m
[32m+[m[32m     */[m
[32m+[m[32m    public function rules(): array[m
[32m+[m[32m    {[m
[32m+[m[32m        return [[m
[32m+[m[32m            //[m
[32m+[m[32m            'intitule' => ['required',Rule::unique('services')->ignore($this->route()->parameter('services'))],[m
[32m+[m[32m            'img_service' => ['required','file','max:1024'],[m
[32m+[m[32m            'description' => ['required'],[m
[32m+[m[32m        ];[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public function messages(){[m
[32m+[m[32m        return [[m
[32m+[m[32m            'intitule.required' => 'Nom du service requis.',[m
[32m+[m[32m            'intitule.unique' => 'Ce service existe déjà.',[m
[32m+[m[32m            'description.required' => 'Desctiption du service requise.',[m
[32m+[m[32m            'img_service.max' => 'Taille d\'image > 1 Mo.',[m
[32m+[m[32m            'img_service.required' => 'Image requise.',[m
[32m+[m[32m            'img_service.file' => 'Image non valide.',[m
[32m+[m[32m        ];[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
[1mdiff --git a/app/Http/Requests/FormSettingsRequest.php b/app/Http/Requests/FormSettingsRequest.php[m
[1mnew file mode 100644[m
[1mindex 0000000..13db8d6[m
[1m--- /dev/null[m
[1m+++ b/app/Http/Requests/FormSettingsRequest.php[m
[36m@@ -0,0 +1,45 @@[m
[32m+[m[32m<?php[m
[32m+[m
[32m+[m[32mnamespace App\Http\Requests;[m
[32m+[m
[32m+[m[32muse Illuminate\Foundation\Http\FormRequest;[m
[32m+[m
[32m+[m[32mclass FormSettingsRequest extends FormRequest[m
[32m+[m[32m{[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Determine if the user is authorized to make this request.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function authorize(): bool[m
[32m+[m[32m    {[m
[32m+[m[32m        return true;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Get the validation rules that apply to the request.[m
[32m+[m[32m     *[m
[32m+[m[32m     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>[m
[32m+[m[32m     */[m
[32m+[m[32m    public function rules(): array[m
[32m+[m[32m    {[m
[32m+[m[32m        return [[m
[32m+[m[32m            'entreprise' => ['required'],[m
[32m+[m[32m            'slogan' => ['required','max:50'],[m
[32m+[m[32m            'email' => ['required','email'],[m
[32m+[m[32m            'address' => ['required'],[m
[32m+[m[32m            'logo' => ['required','file'],[m
[32m+[m[32m            'galerie' => ['required','file'],[m
[32m+[m[32m        ];[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public function messages(){[m
[32m+[m[32m        return [[m
[32m+[m[32m            'entreprise.required' => '* Champ obligatoire .',[m
[32m+[m[32m            'slogan.required' => '* Champ obligatoire .',[m
[32m+[m[32m            'email.required' => '* Champ obligatoire .',[m
[32m+[m[32m            'address.required' => '* Champ obligatoire .',[m
[32m+[m[32m            'logo.required' => '* Champ obligatoire .',[m
[32m+[m[32m            'galerie.required' => '* Champ obligatoire .',[m
[32m+[m[41m            [m
[32m+[m[32m        ];[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
[1mdiff --git a/app/Models/Admin/About.php b/app/Models/Admin/About.php[m
[1mindex 1978456..cf6c410 100644[m
[1m--- a/app/Models/Admin/About.php[m
[1m+++ b/app/Models/Admin/About.php[m
[36m@@ -8,6 +8,11 @@[m
 class About extends Model[m
 {[m
     use HasFactory;[m
[32m+[m[32m    protected $primaryKey = 'id_about';[m
     protected $table = 'abouts';[m
     protected $guarded = [];[m
[32m+[m
[32m+[m[32m    public function abouts(){[m
[32m+[m[32m        return $this->belongsTo(Setting::class , 'id_gear');[m
[32m+[m[32m    }[m
 }[m
[1mdiff --git a/app/Models/Admin/Service.php b/app/Models/Admin/Service.php[m
[1mnew file mode 100644[m
[1mindex 0000000..3bc4254[m
[1m--- /dev/null[m
[1m+++ b/app/Models/Admin/Service.php[m
[36m@@ -0,0 +1,18 @@[m
[32m+[m[32m<?php[m
[32m+[m
[32m+[m[32mnamespace App\Models\Admin;[m
[32m+[m
[32m+[m[32muse Illuminate\Database\Eloquent\Factories\HasFactory;[m
[32m+[m[32muse Illuminate\Database\Eloquent\Model;[m
[32m+[m
[32m+[m[32mclass Service extends Model[m
[32m+[m[32m{[m
[32m+[m[32m    use HasFactory;[m
[32m+[m[32m    protected $primaryKey = 'id_service';[m
[32m+[m[32m    protected $table = 'services';[m
[32m+[m[32m    protected $guarded = [];[m
[32m+[m
[32m+[m[32m    public function services(){[m
[32m+[m[32m        return $this->belongsTo(Setting::class , 'id_gear');[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
[1mdiff --git a/app/Models/Admin/Setting.php b/app/Models/Admin/Setting.php[m
[1mnew file mode 100644[m
[1mindex 0000000..278076d[m
[1m--- /dev/null[m
[1m+++ b/app/Models/Admin/Setting.php[m
[36m@@ -0,0 +1,24 @@[m
[32m+[m[32m<?php[m
[32m+[m
[32m+[m[32mnamespace App\Models\Admin;[m
[32m+[m
[32m+[m[32muse Illuminate\Database\Eloquent\Factories\HasFactory;[m
[32m+[m[32muse Illuminate\Database\Eloquent\Model;[m
[32m+[m
[32m+[m[32mclass Setting extends Model[m
[32m+[m[32m{[m
[32m+[m[32m    use HasFactory;[m
[32m+[m[32m    protected $primaryKey = 'id_gear';[m
[32m+[m[32m    protected $table = 'settings';[m
[32m+[m[32m    protected $guarded = [];[m
[32m+[m
[32m+[m[32m    public function abouts(){[m
[32m+[m[32m        return $this->hasMany(About::class,'id_gear');[m
[32m+[m[32m    }[m
[32m+[m[32m    public function services(){[m
[32m+[m[32m        return $this->hasMany(About::class,'id_gear');[m
[32m+[m[32m    }[m
[32m+[m[32m    public function vues(){[m
[32m+[m[32m        return $this->hasMany(Vue::class,'id_gear');[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
[1mdiff --git a/database/migrations/2023_12_14_235843_create_vues_table.php b/database/migrations/2023_12_14_235843_create_vues_table.php[m
[1mindex ab73173..7aa8100 100644[m
[1m--- a/database/migrations/2023_12_14_235843_create_vues_table.php[m
[1m+++ b/database/migrations/2023_12_14_235843_create_vues_table.php[m
[36m@@ -13,12 +13,15 @@[m [mpublic function up(): void[m
     {[m
         Schema::create('vues', function (Blueprint $table) {[m
             $table->id();[m
[32m+[m[32m            $table->integer('vue_id_gear');[m
             $table->string('name_view', 40);[m
             $table->string('ico_view', 150);[m
             $table->string('view_page', 30);[m
             $table->string('view_folder', 30);[m
             $table->boolean('published')->default(true);[m
             $table->timestamps();[m
[32m+[m[32m            $table->foreign('vue_id_gear')->references('id_gear')->on('settings')->onDelete('cascade')->onUpdate('cascade');[m
[32m+[m
         });[m
     }[m
 [m
[1mdiff --git a/database/migrations/2023_12_23_134132_create_abouts_table.php b/database/migrations/2023_12_23_134132_create_abouts_table.php[m
[1mindex 43337f6..56aec57 100644[m
[1m--- a/database/migrations/2023_12_23_134132_create_abouts_table.php[m
[1m+++ b/database/migrations/2023_12_23_134132_create_abouts_table.php[m
[36m@@ -12,8 +12,13 @@[m
     public function up(): void[m
     {[m
         Schema::create('abouts', function (Blueprint $table) {[m
[31m-            $table->id();[m
[32m+[m[32m            $table->id('id_about');[m
[32m+[m[32m            $table->integer('about_id_gear');[m
[32m+[m[32m            $table->string('img_about');[m
[32m+[m[32m            $table->string('text_about');[m
[32m+[m[32m            $table->boolean('published')->default(true);[m
             $table->timestamps();[m
[32m+[m[32m            $table->foreign('about_id_gear')->references('id_gear')->on('settings')->onDelete('cascade')->onUpdate('cascade');[m
         });[m
     }[m
 [m
[1mdiff --git a/database/migrations/2023_12_26_175322_create_settings_table.php b/database/migrations/2023_12_26_175322_create_settings_table.php[m
[1mnew file mode 100644[m
[1mindex 0000000..4295211[m
[1m--- /dev/null[m
[1m+++ b/database/migrations/2023_12_26_175322_create_settings_table.php[m
[36m@@ -0,0 +1,33 @@[m
[32m+[m[32m<?php[m
[32m+[m
[32m+[m[32muse Illuminate\Database\Migrations\Migration;[m
[32m+[m[32muse Illuminate\Database\Schema\Blueprint;[m
[32m+[m[32muse Illuminate\Support\Facades\Schema;[m
[32m+[m
[32m+[m[32mreturn new class extends Migration[m
[32m+[m[32m{[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Run the migrations.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function up(): void[m
[32m+[m[32m    {[m
[32m+[m[32m        Schema::create('settings', function (Blueprint $table) {[m
[32m+[m[32m            $table->id('id_gear');[m
[32m+[m[32m            $table->string('name');[m
[32m+[m[32m            $table->string('slogan');[m
[32m+[m[32m            $table->string('email');[m
[32m+[m[32m            $table->string('address');[m
[32m+[m[32m            $table->string('logo');[m
[32m+[m[32m            $table->string('galerie');[m
[32m+[m[32m            $table->timestamps();[m
[32m+[m[32m        });[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Reverse the migrations.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function down(): void[m
[32m+[m[32m    {[m
[32m+[m[32m        Schema::dropIfExists('settings');[m
[32m+[m[32m    }[m
[32m+[m[32m};[m
[1mdiff --git a/database/migrations/2024_01_02_073057_create_services_table.php b/database/migrations/2024_01_02_073057_create_services_table.php[m
[1mnew file mode 100644[m
[1mindex 0000000..6b264c5[m
[1m--- /dev/null[m
[1m+++ b/database/migrations/2024_01_02_073057_create_services_table.php[m
[36m@@ -0,0 +1,33 @@[m
[32m+[m[32m<?php[m
[32m+[m
[32m+[m[32muse Illuminate\Database\Migrations\Migration;[m
[32m+[m[32muse Illuminate\Database\Schema\Blueprint;[m
[32m+[m[32muse Illuminate\Support\Facades\Schema;[m
[32m+[m
[32m+[m[32mreturn new class extends Migration[m
[32m+[m[32m{[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Run the migrations.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function up(): void[m
[32m+[m[32m    {[m
[32m+[m[32m        Schema::create('services', function (Blueprint $table) {[m
[32m+[m[32m            $table->id('id_service');[m
[32m+[m[32m            $table->integer('service_id_gear');[m
[32m+[m[32m            $table->string('intitule');[m
[32m+[m[32m            $table->string('description');[m
[32m+[m[32m            $table->string('img_service');[m
[32m+[m[32m            $table->boolean('published')->default(true);[m
[32m+[m[32m            $table->timestamps();[m
[32m+[m[32m            $table->foreign('service_id_gear')->references('id_gear')->on('settings')->onDelete('cascade')->onUpdate('cascade');[m
[32m+[m[32m        });[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Reverse the migrations.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function down(): void[m
[32m+[m[32m    {[m
[32m+[m[32m        Schema::dropIfExists('services');[m
[32m+[m[32m    }[m
[32m+[m[32m};[m
[1mdiff --git a/database/seeders/DatabaseSeeder.php b/database/seeders/DatabaseSeeder.php[m
[1mindex a9f4519..477c6fc 100644[m
[1m--- a/database/seeders/DatabaseSeeder.php[m
[1m+++ b/database/seeders/DatabaseSeeder.php[m
[36m@@ -3,6 +3,8 @@[m
 namespace Database\Seeders;[m
 [m
 // use Illuminate\Database\Console\Seeds\WithoutModelEvents;[m
[32m+[m
[32m+[m[32muse App\Models\Admin\Setting;[m
 use Illuminate\Database\Seeder;[m
 [m
 class DatabaseSeeder extends Seeder[m
[36m@@ -13,10 +15,16 @@[m [mclass DatabaseSeeder extends Seeder[m
     public function run(): void[m
     {[m
         // \App\Models\User::factory(10)->create();[m
[31m-[m
         // \App\Models\User::factory()->create([[m
[31m-        //     'name' => 'Test User',[m
[31m-        //     'email' => 'test@example.com',[m
[31m-        // ]);[m
[32m+[m[32m        // $setting = Setting::first();[m
[32m+[m[32m        // if(!isset($setting->id_gear)){[m
[32m+[m[32m        //     Setting::factory()->create([[m
[32m+[m[32m        //         'name' => 'Star Car Compnay',[m
[32m+[m[32m        //         'slogan' => 'Nous rencontrer, c\'est avancer !',[m
[32m+[m[32m        //         'email' => 'durandjosephadji25@gmail.com',[m
[32m+[m[32m        //         'logo' => 'storage/utilities/setting/icons8_question_mark.ico',[m
[32m+[m[32m        //         'galerie' => "storage/utilities/setting/icons8_questions_32px.png",[m
[32m+[m[32m        //     ]);[m
[32m+[m[32m        // }[m
     }[m
 }[m
[1mdiff --git a/resources/views/admin/layout/sidebar.blade.php b/resources/views/admin/layout/sidebar.blade.php[m
[1mindex 7c3cf11..23c1643 100644[m
[1m--- a/resources/views/admin/layout/sidebar.blade.php[m
[1m+++ b/resources/views/admin/layout/sidebar.blade.php[m
[36m@@ -6,7 +6,7 @@[m [mclass="absolute left-0 top-0 z-9999 flex h-screen w-72.5 flex-col overflow-y-hid[m
   <!-- SIDEBAR HEADER -->[m
   <div class="flex items-center justify-between gap-2 px-6 py-5.5 lg:py-6.5">[m
     <a href="index.html">[m
[31m-      <img src="./images/logo/logo.svg" alt="Logo" />[m
[32m+[m[32m      <img src="{{ asset($setting->logo) }}" alt="Logo" />[m
     </a>[m
 [m
     <button[m
[36m@@ -36,10 +36,8 @@[m [mclass="no-scrollbar flex flex-col overflow-y-auto duration-300 ease-linear"[m
     <nav[m
       class="mt-5 py-4 px-4 lg:mt-9 lg:px-6"[m
       x-data="{selected: 'Dashboard'}"[m
[31m-      x-init="[m
[31m-        selected = JSON.parse(localStorage.getItem('selected'));[m
[31m-        $watch('selected', value => localStorage.setItem('selected', JSON.stringify(value)))"[m
[31m-    >[m
[32m+[m[32m      x-init="selected = JSON.parse(localStorage.getItem('selected'));[m
[32m+[m[32m        $watch('selected', value => localStorage.setItem('selected', JSON.stringify(value)))" >[m
       <!-- Menu Group -->[m
       <div>[m
         <h3 class="mb-4 ml-4 text-sm font-medium text-bodydark2">MENU</h3>[m
[1mdiff --git a/resources/views/admin/pages/about/index.blade.php b/resources/views/admin/pages/about/index.blade.php[m
[1mdeleted file mode 100644[m
[1mindex 1750237..0000000[m
[1m--- a/resources/views/admin/pages/about/index.blade.php[m
[1m+++ /dev/null[m
[36m@@ -1,24 +0,0 @@[m
[31m-<x-Admin.app-layout>[m
[31m-    <div class="container  justify-between p-3">[m
[31m-        {{-- logo du site web --}}[m
[31m-            <form action="{{ route('admin.about.add') }}" class="mt-2" method="POST">[m
[31m-                @csrf[m
[31m-                <x-label class="">Image</x-label>[m
[31m-                <x-error-input input='image-about'></x-error-input>[m
[31m-                <x-image-input name="image-about"></x-image-input>[m
[31m-                <x-my-button class="capitalize my-3" >Edit</x-my-button>[m
[31m-            </form>[m
[31m-         {{--ajouter un lien de navigation  --}}[m
[31m-            <form action="{{ route('admin.about.add') }}" class="mt-2">[m
[31m-                <label class="mb-3 block font-medium text-sm  dark:text-slate-100 ">[m
[31m-                    Description[m
[31m-                </label>[m
[31m-                <textarea [m
[31m-                    name="description" id="" cols="30" rows="10"[m
[31m-                    class="w-full rounded border-[1.5px] border-stroke bg-transparent py-3 px-5 font-medium outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:focus:border-primary"[m
[31m-                    >[m
[31m-                </textarea>[m
[31m-                <x-my-button class="capitalize my-3" >save</x-my-button>[m
[31m-            </form>[m
[31m-        </div>[m
[31m-</x-Admin.app-layout>[m
\ No newline at end of file[m
[1mdiff --git a/resources/views/admin/pages/abouts/index.blade.php b/resources/views/admin/pages/abouts/index.blade.php[m
[1mnew file mode 100644[m
[1mindex 0000000..2c36010[m
[1m--- /dev/null[m
[1m+++ b/resources/views/admin/pages/abouts/index.blade.php[m
[36m@@ -0,0 +1,71 @@[m
[32m+[m[32m<x-Admin.app-layout>[m
[32m+[m[32m    <div class="flex">[m
[32m+[m[32m        @if(Session::get('echec'))[m
[32m+[m[32m            <div class="bg-red-100 p-5 w-full" id="message">[m
[32m+[m[32m                <div class="flex space-x-3">[m
[32m+[m[32m                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="flex-none fill-current text-red-500 h-4 w-4">[m
[32m+[m[32m                    <path d="M12 0c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm4.597 17.954l-4.591-4.55-4.555 4.596-1.405-1.405 4.547-4.592-4.593-4.552 1.405-1.405 4.588 4.543 4.545-4.589 1.416 1.403-4.546 4.587 4.592 4.548-1.403 1.416z" /></svg>[m
[32m+[m[32m                <div class="leading-tight flex flex-col space-y-2">[m
[32m+[m[32m                    <div class="text-sm font-medium text-red-700">[m
[32m+[m[32m                        Error[m[41m [m
[32m+[m[32m                    </div>[m
[32m+[m[32m                    <div class="flex-1 leading-snug text-sm text-red-600">{{ Session::get('echec') }}</div>[m
[32m+[m[32m                </div>[m
[32m+[m[32m                </div>[m
[32m+[m[32m            </div>[m
[32m+[m[32m            <script>[m
[32m+[m[32m                window.onload = function() {[m
[32m+[m[32m                    var element = document.getElementById('message');[m
[32m+[m[32m                    setTimeout(() => {[m
[32m+[m[32m                        element.remove();[m
[32m+[m[32m                    }, 4000);[m
[32m+[m[32m                }[m
[32m+[m[32m            </script>[m
[32m+[m[32m        @endif[m
[32m+[m[32m        @if(Session::get('success'))[m
[32m+[m[32m            <div class="bg-green-100 p-5 w-full m-1 rounded" id="message">[m
[32m+[m[32m                <div class="flex justify-between">[m
[32m+[m[32m                <div class="flex space-x-3">[m
[32m+[m[32m                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="flex-none fill-current text-green-500 h-4 w-4">[m
[32m+[m[32m                    <path d="M12 0c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm-1.25 16.518l-4.5-4.319 1.396-1.435 3.078 2.937 6.105-6.218 1.421 1.409-7.5 7.626z" /></svg>[m
[32m+[m[32m                    <div class="flex-1 leading-tight text-sm text-green-700 font-medium">[m
[32m+[m[32m                        {{ Session::get('success') }}[m
[32m+[m[32m                    </div>[m
[32m+[m[32m                </div>[m
[32m+[m[32m                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="flex-none fill-current text-green-600 h-3 w-3">[m
[32m+[m[32m                    <path d="M23.954 21.03l-9.184-9.095 9.092-9.174-2.832-2.807-9.09 9.179-9.176-9.088-2.81 2.81 9.186 9.105-9.095 9.184 2.81 2.81 9.112-9.192 9.18 9.1z" /></svg>[m
[32m+[m[32m                </div>[m
[32m+[m[32m            </div>[m
[32m+[m[32m            <script>[m
[32m+[m[32m                window.onload = function() {[m
[32m+[m[32m                    var element = document.getElementById('message');[m
[32m+[m[32m                    setTimeout(() => {[m
[32m+[m[32m                        element.remove();[m
[32m+[m[32m                    }, 4000);[m
[32m+[m[32m                }[m
[32m+[m[32m            </script>[m
[32m+[m[32m        @endif[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <div class="container  justify-between p-3">[m
[32m+[m[32m        {{-- logo du site web --}}[m
[32m+[m[32m            <form action="{{route('admin.abouts.add')}}"  class="mt-2" method="POST" enctype="multipart/form-data">[m
[32m+[m[32m                @csrf[m
[32m+[m[32m                <x-label class="">Image</x-label>[m
[32m+[m[32m                <x-error-input input='image-about'></x-error-input>[m
[32m+[m[32m                <x-image-input name="image-about"></x-image-input>[m
[32m+[m[32m                {{-- <x-my-button class="capitalize my-3" >Edit</x-my-button> --}}[m
[32m+[m[41m         [m
[32m+[m[32m         {{--ajouter un lien de navigation  --}}[m
[32m+[m[41m          [m
[32m+[m[32m                <label class="mb-3 block font-medium text-sm  dark:text-slate-100 ">[m
[32m+[m[32m                    Description[m
[32m+[m[32m                </label>[m
[32m+[m[32m                <textarea[m[41m [m
[32m+[m[32m                    name="description" id="" cols="30" rows="10"[m
[32m+[m[32m                    class="w-full rounded border-[1.5px] border-stroke bg-transparent py-3 px-5 font-medium outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:focus:border-primary"[m
[32m+[m[32m                    >[m
[32m+[m[32m                </textarea>[m
[32m+[m[32m                <x-my-button class="capitalize my-3" >save</x-my-button>[m
[32m+[m[32m            </form>[m
[32m+[m[32m        </div>[m
[32m+[m[32m</x-Admin.app-layout>[m
\ No newline at end of file[m
[1mdiff --git a/resources/views/admin/pages/services/index.blade.php b/resources/views/admin/pages/services/index.blade.php[m
[1mnew file mode 100644[m
[1mindex 0000000..3d9935d[m
[1m--- /dev/null[m
[1m+++ b/resources/views/admin/pages/services/index.blade.php[m
[36m@@ -0,0 +1,79 @@[m
[32m+[m[32m<x-Admin.app-layout>[m
[32m+[m[32m    <div class="flex">[m
[32m+[m[32m        @if(Session::get('echec'))[m
[32m+[m[32m            <div class="bg-red-100 p-5 w-full" id="message">[m
[32m+[m[32m                <div class="flex space-x-3">[m
[32m+[m[32m                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="flex-none fill-current text-red-500 h-4 w-4">[m
[32m+[m[32m                    <path d="M12 0c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm4.597 17.954l-4.591-4.55-4.555 4.596-1.405-1.405 4.547-4.592-4.593-4.552 1.405-1.405 4.588 4.543 4.545-4.589 1.416 1.403-4.546 4.587 4.592 4.548-1.403 1.416z" /></svg>[m
[32m+[m[32m                <div class="leading-tight flex flex-col space-y-2">[m
[32m+[m[32m                    <div class="text-sm font-medium text-red-700">[m
[32m+[m[32m                        Error[m[41m [m
[32m+[m[32m                    </div>[m
[32m+[m[32m                    <div class="flex-1 leading-snug text-sm text-red-600">{{ Session::get('echec') }}</div>[m
[32m+[m[32m                </div>[m
[32m+[m[32m                </div>[m
[32m+[m[32m            </div>[m
[32m+[m[32m            <script>[m
[32m+[m[32m                window.onload = function() {[m
[32m+[m[32m                    var element = document.getElementById('message');[m
[32m+[m[32m                    setTimeout(() => {[m
[32m+[m[32m                        element.remove();[m
[32m+[m[32m                    }, 4000);[m
[32m+[m[32m                }[m
[32m+[m[32m            </script>[m
[32m+[m[32m        @endif[m
[32m+[m[32m        @if(Session::get('success'))[m
[32m+[m[32m            <div class="bg-green-100 p-5 w-full m-1 rounded" id="message">[m
[32m+[m[32m                <div class="flex justify-between">[m
[32m+[m[32m                <div class="flex space-x-3">[m
[32m+[m[32m                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="flex-none fill-current text-green-500 h-4 w-4">[m
[32m+[m[32m                    <path d="M12 0c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm-1.25 16.518l-4.5-4.319 1.396-1.435 3.078 2.937 6.105-6.218 1.421 1.409-7.5 7.626z" /></svg>[m
[32m+[m[32m                    <div class="flex-1 leading-tight text-sm text-green-700 font-medium">[m
[32m+[m[32m                        {{ Session::get('success') }}[m
[32m+[m[32m                    </div>[m
[32m+[m[32m                </div>[m
[32m+[m[32m                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="flex-none fill-current text-green-600 h-3 w-3">[m
[32m+[m[32m                    <path d="M23.954 21.03l-9.184-9.095 9.092-9.174-2.832-2.807-9.09 9.179-9.176-9.088-2.81 2.81 9.186 9.105-9.095 9.184 2.81 2.81 9.112-9.192 9.18 9.1z" /></svg>[m
[32m+[m[32m                </div>[m
[32m+[m[32m            </div>[m
[32m+[m[32m            <script>[m
[32m+[m[32m                window.onload = function() {[m
[32m+[m[32m                    var element = document.getElementById('message');[m
[32m+[m[32m                    setTimeout(() => {[m
[32m+[m[32m                        element.remove();[m
[32m+[m[32m                    }, 4000);[m
[32m+[m[32m                }[m
[32m+[m[32m            </script>[m
[32m+[m[32m        @endif[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <div class="">[m
[32m+[m[32m        <form class="px-4" action="{{ route('admin.services.add') }}" method="POST" enctype="multipart/form-data">[m
[32m+[m[32m            @csrf[m
[32m+[m[32m            <h2>Nouveau service</h2>[m
[32m+[m[32m            <div class="flex justify-between items-center ">[m
[32m+[m[32m                <div class="mt-2 w-5/12">[m
[32m+[m[32m                    <div>[m
[32m+[m[32m                        <x-label class="capitalize mb-1">Intitutlé service</x-label>[m[41m [m
[32m+[m[32m                        <x-text-input class="py-2 px-5 font-normal" name="intitule" placeholder="Entrer le nom du lien" type="text"></x-text-input>[m
[32m+[m[32m                        <x-error-input input="intitule"></x-error-input>[m
[32m+[m[32m                    </div>[m
[32m+[m[32m                    <div class="">[m
[32m+[m[32m                        <x-label>Image service</x-label>[m
[32m+[m[32m                        <x-image-input name="img_service"></x-image-input>[m
[32m+[m[32m                        <x-error-input input="img_service"></x-error-input>[m
[32m+[m[32m                    </div>[m
[32m+[m[32m                </div>[m
[32m+[m[32m                <div class="mt-2 flex-1 px-4">[m
[32m+[m[32m                    <label class="mb-3 block font-medium text-sm text-black ">[m
[32m+[m[32m                        Description[m
[32m+[m[32m                    </label>[m
[32m+[m[32m                    <textarea[m[41m [m
[32m+[m[32m                        class="w-full rounded border-[1.5px] border-stroke bg-transparent py-3 px-5 font-medium outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:focus:border-primary"[m
[32m+[m[32m                        name="description" id="" cols="30" rows="10"></textarea>[m
[32m+[m[32m                        <x-error-input input="description"></x-error-input>[m
[32m+[m[32m                </div>[m
[32m+[m[32m            </div>[m
[32m+[m[32m            <x-my-button class="capitalize my-3" >save</x-my-button>[m
[32m+[m[32m        </form>[m[41m       [m
[32m+[m[32m    </div>[m
[32m+[m[32m</x-Admin.app-layout>[m
\ No newline at end of file[m
[1mdiff --git a/resources/views/admin/pages/settings/index.blade.php b/resources/views/admin/pages/settings/index.blade.php[m
[1mnew file mode 100644[m
[1mindex 0000000..be67e04[m
[1m--- /dev/null[m
[1m+++ b/resources/views/admin/pages/settings/index.blade.php[m
[36m@@ -0,0 +1,39 @@[m
[32m+[m[32m<x-Admin.app-layout>[m
[32m+[m[32m    <form action="{{ route('admin.settings.add') }}" class="" method="POST" enctype="multipart/form-data">[m
[32m+[m[32m      @csrf[m
[32m+[m[32m        <div class="grid grid-cols-2 p-6.5 gap-4">[m
[32m+[m[32m          <div class="mb-4.5">[m
[32m+[m[32m            <x-label>Entreprise</x-label>[m
[32m+[m[32m            <x-text-input name="entreprise" placeholder="Nom de l'Entreprise" class="my-2 p-2 bg-white w-full"></x-text-input>[m
[32m+[m[32m            <x-error-input input="entreprise"></x-error-input>[m
[32m+[m[32m          </div>[m
[32m+[m[32m          <div class="mb-4.5">[m
[32m+[m[32m            <x-label>Slogan</x-label>[m
[32m+[m[32m            <x-text-input name="slogan" placeholder="Slogan" class="my-2 p-2 bg-white w-full"></x-text-input>[m
[32m+[m[32m            <x-error-input input="slogan"></x-error-input>[m
[32m+[m[32m          </div>[m
[32m+[m[32m          <div class="mb-4.5">[m
[32m+[m[32m            <x-label>Email <span class="text-meta-1">*</span></x-label>[m
[32m+[m[32m            <x-email-input name="email" class="w-full my-2 p-2 bg-white"  placeholder="Enter your email address"></x-email-input>[m
[32m+[m[32m            <x-error-input input="email"></x-error-input>[m
[32m+[m[32m          </div>[m
[32m+[m[41m          [m
[32m+[m[32m          <div class="mb-4.5">[m
[32m+[m[32m            <x-label>Adresse</x-label>[m
[32m+[m[32m            <x-text-input name="address" placeholder="Enter address of entreprise" class="my-2 p-2 bg-white  w-full"></x-text-input>[m
[32m+[m[32m            <x-error-input input="address"></x-error-input>[m
[32m+[m[32m          </div>[m
[32m+[m[32m          <div class="mb-4.5">[m
[32m+[m[32m              <x-label>Logo</x-label>[m
[32m+[m[32m              <x-image-input name="logo"></x-image-input>[m
[32m+[m[32m              <x-error-input input="logo"></x-error-input>[m
[32m+[m[32m          </div>[m
[32m+[m[32m          <div class="mb-4.5">[m
[32m+[m[32m              <x-label>Galery</x-label>[m
[32m+[m[32m              <x-image-input name="galerie"></x-image-input>[m
[32m+[m[32m              <x-error-input input="galerie"></x-error-input>[m
[32m+[m[32m          </div>[m
[32m+[m[32m        </div>[m
[32m+[m[32m        <x-my-button class="capitalize my-3" >save</x-my-button>[m
[32m+[m[32m      </form>[m
[32m+[m[32m</x-Admin.app-layout>[m
\ No newline at end of file[m
[1mdiff --git a/resources/views/components/email-input.blade.php b/resources/views/components/email-input.blade.php[m
[1mnew file mode 100644[m
[1mindex 0000000..55d3ea6[m
[1m--- /dev/null[m
[1m+++ b/resources/views/components/email-input.blade.php[m
[36m@@ -0,0 +1,5 @@[m
[32m+[m[32m@props(['disabled' => false])[m
[32m+[m
[32m+[m[32m<input type="email"  {{ $attributes->merge([[m
[32m+[m[32m    'class' => 'w-full rounded-md shadow-sm border-[1.5px] border-stroke py-2 px-5 font-medium outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-gray-900 dark:focus:border-primary']) }}[m[41m [m
[32m+[m[32m    />[m
[1mdiff --git a/resources/views/components/error-input.blade.php b/resources/views/components/error-input.blade.php[m
[1mindex 917fed4..728062b 100644[m
[1m--- a/resources/views/components/error-input.blade.php[m
[1m+++ b/resources/views/components/error-input.blade.php[m
[36m@@ -1,6 +1,6 @@[m
 @props(['input'])[m
 @error($input)[m
[31m-    <p {{ $attributes->merge(['class' => 'text-xs italic text-red-500 my-2']) }} >[m
[32m+[m[32m    <p {{ $attributes->merge(['class' => 'text-xs italic text-red-500']) }} >[m
         {{ $message }}[m
     </p>[m
 @enderror[m
\ No newline at end of file[m
[1mdiff --git a/resources/views/components/text-input.blade.php b/resources/views/components/text-input.blade.php[m
[1mindex 909c68a..9ec5547 100644[m
[1m--- a/resources/views/components/text-input.blade.php[m
[1m+++ b/resources/views/components/text-input.blade.php[m
[36m@@ -1,5 +1,5 @@[m
 @props(['disabled' => false])[m
 [m
[31m-<input  {{ $attributes->merge([[m
[31m-    'class' => 'border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm']) }} [m
[32m+[m[32m<input type="text" {{ $attributes->merge([[m
[32m+[m[32m    'class' => 'border-gray-300 dark:border-gray-700 text-gray-700 dark:bg-gray-900  dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm']) }}[m[41m [m
     />[m
[1mdiff --git a/resources/views/web/layouts/app-layout.blade.php b/resources/views/web/layouts/app-layout.blade.php[m
[1mindex 772d7ce..80c3539 100644[m
[1m--- a/resources/views/web/layouts/app-layout.blade.php[m
[1m+++ b/resources/views/web/layouts/app-layout.blade.php[m
[36m@@ -13,6 +13,6 @@[m
     <div>[m
       {{ $slot }}[m
     </div>[m
[31m-    @include('web.layouts.footer')[m
[32m+[m[32m    {{-- @include('web.layouts.footer') --}}[m
 </body>[m
 </html>[m
\ No newline at end of file[m
[1mdiff --git a/resources/views/web/layouts/infos.blade.php b/resources/views/web/layouts/infos.blade.php[m
[1mindex 7557943..4968874 100644[m
[1m--- a/resources/views/web/layouts/infos.blade.php[m
[1m+++ b/resources/views/web/layouts/infos.blade.php[m
[36m@@ -1,9 +1,9 @@[m
[31m-<div class="hidden sm:block md:block border p-2 bg-indigo-700">[m
[32m+[m[32m<div class="hidden sm:block md:block border p-2 bg-green-700">[m
     <div class="flex flex-row justify-between  px-20">[m
[31m-        <div class="px-3 w-1/3 hidden md:flex justify-around items-center">[m
[32m+[m[32m        <div class="px-3 w-1/3 hidden md:flex items-center">[m
             <i class="fas fa-phone text-yellow-300 mx-2"></i>[m
             <a href="#" class="text-sm text-slate-200">  6 91 79 93 25</a>[m
[31m-            <div class="border border-yellow-300 h-full "></div>[m
[32m+[m[32m            <div class="border border-yellow-300 h-full mx-1"></div>[m
             <a href="#" class=" text-sm text-slate-200">  6 20 58 63 80</a>[m
         </div>[m
         <div class=" px-3 hidden md:flex justify-center items-center w-1/3">[m
[1mdiff --git a/resources/views/web/layouts/navbar.blade.php b/resources/views/web/layouts/navbar.blade.php[m
[1mindex 3b3c5f7..0e8e67b 100644[m
[1m--- a/resources/views/web/layouts/navbar.blade.php[m
[1m+++ b/resources/views/web/layouts/navbar.blade.php[m
[36m@@ -1,12 +1,13 @@[m
 <nav class="bg-gray-200 shadow shadow-gray-300 w-100 px-8 md:px-auto static">[m
 	<div class="relative md:h-16 h-28 mx-auto md:px-4 container flex items-center justify-between flex-wrap md:flex-nowrap">[m
 		<!-- Logo -->[m
[31m-		<div class="text-indigo-500 md:order-1 border flex h-full justify-around items-center  ">[m
[32m+[m		[32m{{-- {{ dd($setting->logo) }} --}}[m
[32m+[m		[32m<div class="text-green-500 md:order-1 border flex h-full justify-around items-center  ">[m
 			<!-- Heroicon - Chip Outline -->[m
 			<svg xmlns="http://www.w3.org/2000/svg" class="h-10 w-10 " fill="none" viewBox="0 0 15 24" stroke="currentColor">[m
[31m-                <img src="{{ asset("storage/utilities/logo1.png") }}" x="0" y="0" class="w-full  h-full rounded-full" alt="" />[m
[32m+[m[32m                <img src="{{ asset($setting->logo) }}" x="0" y="0" class="w-full  h-full rounded-full" alt="" />[m
 			</svg>[m
[31m-			<h3 class=" md:block mx-4 uppercase text-3xl">serdi</h3>[m
[32m+[m			[32m<h3 class=" md:block mx-4 capitalize text-xl">{{ $setting->name }}</h3>[m
 		</div>[m
 		<div class="hidden justify-end sm:block md:block text-gray-500 order-3 w-full md:w-auto md:order-2">[m
 			<ul class="flex font-semibold justify-between">[m
[36m@@ -19,7 +20,7 @@[m
 				<li class="md:px-4 md:py-2 hover:text-slate-400 hover:border-b hover:border-blue-600 capitalize"><a href="{{ route('home') }}">Contact</a></li>[m
 			</ul>[m
 		</div>[m
[31m-		<div class="hidden sm:flex md:flex order-2 md:order-3 gap-2">[m
[32m+[m		[32m{{-- <div class="hidden sm:flex md:flex order-2 md:order-3 gap-2">[m
 			<a [m
 				href="{{ route('home') }}"[m
 				class="px-4 py-2 outline outline-indigo-500 hover:bg-indigo-600  hover:text-white text-slate-500 rounded-xl flex items-center gap-2">[m
[36m@@ -36,6 +37,6 @@[m [mclass="px-4 py-2 bg-indigo-500 hover:bg-indigo-600 text-gray-50 rounded-xl flex[m
                 </svg>[m
                 <span>Connexion</span>[m
             </a>[m
[31m-		</div>[m
[32m+[m		[32m</div> --}}[m
 	</div>[m
 </nav>[m
\ No newline at end of file[m
[1mdiff --git a/resources/views/web/pages/accueil.blade.php b/resources/views/web/pages/accueil.blade.php[m
[1mindex fae9b16..6a820a5 100644[m
[1m--- a/resources/views/web/pages/accueil.blade.php[m
[1m+++ b/resources/views/web/pages/accueil.blade.php[m
[36m@@ -1,3 +1,176 @@[m
 <x-Web.app-layout>[m
[31m-Acceuil[m
[31m-</x-Web.app-layout>[m
\ No newline at end of file[m
[32m+[m[32m    {{-- <div class="h-72 w-screen relative">[m
[32m+[m[32m        <div class="absolute inset-0 bg-cover bg-center" style="background-image: url('{{ asset("storage/utilities/theme1.jpeg") }}'); filter: brightness(70%);">[m
[32m+[m[32m            <div class="relative max-w-xl mx-auto h-full flex items-center justify-center">[m
[32m+[m[41m              [m
[32m+[m[32m              <div class="text-center text-white bg-black/5 bg-opacity-30 p-4 rounded">[m
[32m+[m[32m                <h2 class="text-3xl leading-9 font-extrabold tracking-tight sm:text-4xl sm:leading-10">[m
[32m+[m[32m                  Bienvenue à notre entreprise[m
[32m+[m[32m                </h2>[m
[32m+[m[32m                <p class="mt-4 text-lg leading-6">[m
[32m+[m[32m                  Nous sommes ravis de vous avoir parmi nous. Explorez nos services et découvrez comment[m[41m [m
[32m+[m[32m                  nous pouvons vous aider à atteindre vos objectifs.[m
[32m+[m[32m                </p>[m
[32m+[m[32m              </div>[m
[32m+[m[32m            </div>[m
[32m+[m[32m        </div>[m
[32m+[m[32m    </div> --}}[m
[32m+[m
[32m+[m[32m    <div class="w-full mx-auto">[m
[32m+[m[32m        <div id="default-carousel" class="relative" data-carousel="static">[m
[32m+[m[32m            <!-- Carousel wrapper -->[m
[32m+[m[32m            <div class="overflow-hidden relative  h-56 sm:h-64 xl:h-[470px] 2xl:h-96">[m
[32m+[m[32m                <!-- Item 1 -->[m[41m [m
[32m+[m[32m                <div class="hidden duration-700 ease-in-out" data-carousel-item>[m
[32m+[m[32m                    <span class="absolute top-1/2 left-1/2 text-2xl font-semibold text-white -translate-x-1/2 -translate-y-1/2 sm:text-3xl">First Slide</span>[m
[32m+[m[32m                    <img src="{{ asset("storage/utilities/theme1.jpeg") }}" class="block absolute top-1/2 left-1/2 w-full -translate-x-1/2 -translate-y-1/2 filter brightness-50 object-cover" alt="...">[m
[32m+[m[32m                </div>[m
[32m+[m[32m                <!-- Item 2 -->[m
[32m+[m[32m                <div class="hidden duration-700 ease-in-out" data-carousel-item>[m
[32m+[m[32m                    <span class="absolute top-1/2 left-1/2 text-2xl font-semibold text-white -translate-x-1/2 -translate-y-1/2 sm:text-3xl">Second Slide</span>[m
[32m+[m[32m                    <img src="{{ asset("storage/utilities/theme2.jpeg") }}" class="block absolute top-1/2 left-1/2 w-full -translate-x-1/2 -translate-y-1/2 filter brightness-50 object-cover" alt="...">[m
[32m+[m[32m                </div>[m
[32m+[m[32m                <!-- Item 3 -->[m
[32m+[m[32m                <div class="hidden duration-700 ease-in-out" data-carousel-item>[m
[32m+[m[32m                    <span class="absolute top-1/2 left-1/2 text-2xl font-semibold text-white -translate-x-1/2 -translate-y-1/2 sm:text-3xl">Third Slide</span>[m
[32m+[m[32m                    <img src="{{ asset("storage/utilities/theme3.jpeg") }}" class="block absolute top-1/2 left-1/2 w-full -translate-x-1/2 -translate-y-1/2 filter brightness-50 object-cover" alt="...">[m
[32m+[m[32m                </div>[m
[32m+[m[32m            </div>[m
[32m+[m[32m            <!-- Slider indicators -->[m
[32m+[m[32m            <div class="flex absolute bottom-5 left-1/2 z-30 space-x-3 -translate-x-1/2">[m
[32m+[m[32m                <button type="button" class="w-3 h-3 rounded-full" aria-current="false" aria-label="Slide 1" data-carousel-slide-to="0"></button>[m
[32m+[m[32m                <button type="button" class="w-3 h-3 rounded-full" aria-current="false" aria-label="Slide 2" data-carousel-slide-to="1"></button>[m
[32m+[m[32m                <button type="button" class="w-3 h-3 rounded-full" aria-current="false" aria-label="Slide 3" data-carousel-slide-to="2"></button>[m
[32m+[m[32m            </div>[m
[32m+[m[32m            <!-- Slider controls -->[m
[32m+[m[32m            <button type="button" class="flex absolute top-0 left-0 z-30 justify-center items-center px-4 h-full cursor-pointer group focus:outline-none" data-carousel-prev>[m
[32m+[m[32m                <span class="inline-flex justify-center items-center w-8 h-8 rounded-full sm:w-10 sm:h-10 bg-white/30 dark:bg-gray-800/30 group-hover:bg-white/50 dark:group-hover:bg-gray-800/60 group-focus:ring-4 group-focus:ring-white dark:group-focus:ring-gray-800/70 group-focus:outline-none">[m
[32m+[m[32m                    <svg class="w-5 h-5 text-white sm:w-6 sm:h-6 dark:text-gray-800" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path></svg>[m
[32m+[m[32m                    <span class="hidden">Previous</span>[m
[32m+[m[32m                </span>[m
[32m+[m[32m            </button>[m
[32m+[m[32m            <button type="button" class="flex absolute top-0 right-0 z-30 justify-center items-center px-4 h-full cursor-pointer group focus:outline-none" data-carousel-next>[m
[32m+[m[32m                <span class="inline-flex justify-center items-center w-8 h-8 rounded-full sm:w-10 sm:h-10 bg-white/30 dark:bg-gray-800/30 group-hover:bg-white/50 dark:group-hover:bg-gray-800/60 group-focus:ring-4 group-focus:ring-white dark:group-focus:ring-gray-800/70 group-focus:outline-none">[m
[32m+[m[32m                    <svg class="w-5 h-5 text-white sm:w-6 sm:h-6 dark:text-gray-800" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path></svg>[m
[32m+[m[32m                    <span class="hidden">Next</span>[m
[32m+[m[32m                </span>[m
[32m+[m[32m            </button>[m
[32m+[m[32m        </div>[m
[32m+[m[32m    </div>[m
[32m+[m
[32m+[m[32m    {{-- a propos --}}[m
[32m+[m[32m    <div id="services" class="section relative pt-20 pb-8 md:pt-16 md:pb-0">[m
[32m+[m[32m        <div class="flex flex-col justify-center items-center mt-1">[m
[32m+[m[32m            <header class="text-center mx-auto mb-5 lg:px-20">[m
[32m+[m[32m                <h2 class="text-4xl leading-normal mb-2 font-bold text-black">A propos</h2>[m
[32m+[m[32m                {{-- <p class="text-green-500 leading-relaxed font-light text-xl mx-auto pb-2">Save time managing advertising &amp; Content for your business.</p> --}}[m
[32m+[m[32m            </header>[m
[32m+[m[32m            <div class="py-16 bg-white w-[90%]">[m[41m  [m
[32m+[m[32m                <div class="container m-auto px-6 text-gray-600 md:px-12 xl:px-6">[m
[32m+[m[32m                    <div class="space-y-6 md:space-y-0 md:flex md:gap-6 lg:items-center lg:gap-12">[m
[32m+[m[32m                    <div class="md:5/12 lg:w-5/12">[m
[32m+[m[32m                        <img src="{{ asset($about->img_about) }}" alt="image" loading="lazy" width="" height="">[m
[32m+[m[32m                    </div>[m
[32m+[m[32m                    <div class="md:7/12 lg:w-6/12">[m
[32m+[m[32m                        <h2 class="text-2xl text-gray-900 font-bold md:text-4xl">Ce que vous devez savoir</h2>[m
[32m+[m[32m                        <p class="mt-6 text-gray-600">{{ $about->text_about }} </p>[m
[32m+[m[32m                        <div[m
[32m+[m[32m                            class=" mt-4 lg:min-w-max flex items-center sm:w-max w-full pb-6 lg:pb-0 border-b border-gray-100   lg:border-0 px-6 lg:px-0">[m
[32m+[m[32m                            <a href="#"[m
[32m+[m[32m                                class="flex justify-center items-center w-full sm:w-max px-6 h-12 rounded-full outline-none relative overflow-hidden border duration-300 ease-linear[m
[32m+[m[32m                            after:absolute after:inset-x-0 after:aspect-square after:scale-0 after:opacity-70 after:origin-center after:duration-300 after:ease-linear after:rounded-full after:top-0 after:left-0 after:bg-green-800 hover:after:opacity-100 hover:after:scale-[2.5] bg-blue-600 border-transparent hover:border-[#172554]">[m
[32m+[m[32m                                <span class="relative z-10 text-white flex justify-center items-center">[m
[32m+[m[32m                                    En savoir plus <i class="fas fa-plus mx-3"></i>[m
[32m+[m[32m                                </span>[m
[32m+[m[32m                            </a>[m
[32m+[m[32m                        </div>[m
[32m+[m[32m                    </div>[m
[32m+[m[32m                    </div>[m
[32m+[m[32m                </div>[m
[32m+[m[32m            </div>[m
[32m+[m[32m        </div>[m
[32m+[m[32m    </div>[m
[32m+[m[32m    {{-- fin apropos --}}[m
[32m+[m
[32m+[m[32m     {{-- ====== Services Section Start  --}}[m
[32m+[m[32m        <section class="pt-20 lg:pt-[120px] pb-12 lg:pb-[90px]">[m
[32m+[m[32m            <div class="container">[m
[32m+[m[32m            <div class="flex flex-wrap -mx-4">[m
[32m+[m[32m                <div class="w-full px-4">[m
[32m+[m[32m                    <div class="text-center mx-auto mb-12 lg:mb-20 max-w-[510px]">[m
[32m+[m[32m                        <span class="font-semibold text-lg text-primary mb-2 block">[m
[32m+[m[32m                        Our Services[m
[32m+[m[32m                        </span>[m
[32m+[m[32m                        <h2 class=" font-bold text-3xl sm:text-4xl md:text-[40px] text-dark mb-4 " >[m
[32m+[m[32m                        What We Offer[m
[32m+[m[32m                        </h2>[m
[32m+[m[32m                        <p class="text-base text-body-color">[m
[32m+[m[32m                        There are many variations of passages of Lorem Ipsum available[m
[32m+[m[32m                        but the majority have suffered alteration in some form.[m
[32m+[m[32m                        </p>[m
[32m+[m[32m                    </div>[m
[32m+[m[32m                </div>[m
[32m+[m[32m            </div>[m
[32m+[m[32m            <div class="flex flex-wrap -mx-4">[m
[32m+[m[32m                <div class="w-full md:w-1/2 lg:w-1/3 px-4">[m
[32m+[m[32m                    <div[m
[32m+[m[32m                        class="p-10 md:px-7 xl:px-10 rounded-[20px] bg-green-300 shadow-md hover:shadow-lg mb-8">[m
[32m+[m[32m                        {{-- <div class="  w-[70px]  h-[70px] flex items-center justify-center bg-primary rounded-2xl mb-8 " >[m
[32m+[m[32m                        <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg" >[m
[32m+[m[32m                            <path[m
[32m+[m[32m                                d="M18.6746 0.26779C10.0637 -1.33065 1.86522 4.39279 0.266779 13.0037C-0.506658 17.1803 0.421467 21.3568 2.79334 24.8631C5.21678 28.3693 8.82615 30.6897 12.9512 31.4631C13.9308 31.6178 14.859 31.7209 15.7871 31.7209C23.2637 31.7209 29.9668 26.3584 31.359 18.6756C32.9574 10.0647 27.234 1.81466 18.6746 0.26779ZM29.6574 18.3662C29.5543 18.8819 29.4512 19.449 29.2965 19.9131L16.7668 15.2209V1.81466C17.2824 1.86623 17.8496 1.91779 18.3652 2.02091C25.9449 3.4131 30.998 10.735 29.6574 18.3662ZM14.9105 1.81466V14.9115H1.86522C1.91678 14.3959 1.96834 13.8287 2.07147 13.3131C3.20584 6.86779 8.67147 2.22716 14.9105 1.81466ZM13.3121 29.6584C9.65115 28.9881 6.45428 26.9256 4.28865 23.8318C2.79334 21.7178 1.96834 19.2428 1.81365 16.7678H15.6324L28.5746 21.6147C26.048 27.3381 19.7574 30.8443 13.3121 29.6584Z"[m
[32m+[m[32m                                fill="white"[m
[32m+[m[32m                                />[m
[32m+[m[32m                        </svg>[m
[32m+[m[32m                        </div> --}}[m
[32m+[m[32m                        <h4 class="font-semibold text-xl text-dark mb-3">[m
[32m+[m[32m                        Développement logiciels spécifiques[m
[32m+[m[32m                        </h4>[m
[32m+[m[32m                        <p class="text-body-color">[m
[32m+[m[32m                        We dejoy working with discerning clients, people for whom[m
[32m+[m[32m                        qualuty, service, integrity & aesthetics.[m
[32m+[m[32m                        </p>[m
[32m+[m[32m                    </div>[m
[32m+[m[32m                </div>[m
[32m+[m[32m                <div class="w-full md:w-1/2 lg:w-1/3 px-4">[m
[32m+[m[32m                    <div class=" p-10 md:px-7 xl:px-10 rounded-[20px] bg-white shadow-md hover:shadow-lg mb-8 " >[m
[32m+[m[32m                        <div class=" w-[70px] h-[70px] flex items-center justify-center bg-primary rounded-2xl mb-8 " >[m
[32m+[m[32m                        <svg width="39" height="22" viewBox="0 0 39 22" fill="none" xmlns="http://www.w3.org/2000/svg" >[m
[32m+[m[32m                            <!-- <mask id="path-1-inside-1" fill="white"> -->[m
[32m+[m[32m                            <path fill-rule="evenodd" clip-rule="evenodd" d="M19.5004 0C14.6345 0 11.4767 2.14015 10.0251 6.42044C9.95552 6.62552 10.2264 6.7705 10.3756 6.61355C12.182 4.7134 14.2484 4.03687 16.575 4.58345C18.0583 4.93186 19.119 5.94382 20.2921 7.0642C22.2042 8.88862 24.4173 11 29.2502 11C34.1152 11 37.2736 8.85997 38.7247 4.58049C38.7943 4.3754 38.5234 4.23044 38.3742 4.38741C36.5684 6.28738 34.502 6.96375 32.1756 6.41655C30.6915 6.06814 29.6308 5.05618 28.4577 3.93652C26.5456 2.11066 24.3333 0 19.5004 0ZM-nan -nanL9.74981 11C4.88456 11 1.72609 13.1402 0.275037 17.4207C0.205519 17.6258 0.476365 17.7707 0.62555 17.6138C2.43196 15.7135 4.49843 15.0368 6.82441 15.5835C8.30851 15.9319 9.36923 16.9438 10.5423 18.0642C12.4544 19.8886 14.6667 22 19.5004 22C24.3656 22 27.5241 19.8604 28.9752 15.58C29.0447 15.3749 28.7738 15.23 28.6246 15.3869C26.8182 17.2873 24.7517 17.9639 22.425 17.4173C20.9417 17.0681 19.881 16.0562 18.7079 14.9365C16.7958 13.1121 14.5827 11 9.74981 11L-nan -nanL-nan -nanZ" />[m
[32m+[m[32m                            <!-- </mask> -->[m
[32m+[m[32m                            <path d="M16.575 4.58345L16.3463 5.55695L16.3463 5.55696L16.575 4.58345ZM20.2921 7.0642L19.6014 7.78736L19.6018 7.78769L20.2921 7.0642ZM32.1756 6.41655L32.4046 5.44311L32.4041 5.44301L32.1756 6.41655ZM28.4577 3.93652L27.7671 4.65974L27.7673 4.6599L28.4577 3.93652ZM6.82441 15.5835L6.59564 16.5569L6.59586 16.557L6.82441 15.5835ZM10.5423 18.0642L9.85161 18.7874L9.85196 18.7877L10.5423 18.0642ZM22.425 17.4173L22.1959 18.3907L22.1963 18.3908L22.425 17.4173ZM18.7079 14.9365L19.3983 14.2131L19.3982 14.213L18.7079 14.9365ZM0.275037 17.4207L-0.672026 17.0997L0.275037 17.4207ZM0.62555 17.6138L-0.0992438 16.9248L0.62555 17.6138ZM28.9752 15.58L29.9222 15.901L28.9752 15.58ZM28.6246 15.3869L27.8998 14.6979L28.6246 15.3869ZM38.7247 4.58049L37.7777 4.25936L38.7247 4.58049ZM38.3742 4.38741L39.099 5.07632L38.3742 4.38741ZM10.0251 6.42044L9.07806 6.09926L10.0251 6.42044ZM10.3756 6.61355L11.1004 7.30255L10.3756 6.61355ZM19.5004 -1C16.9224 -1 14.7064 -0.432275 12.9214 0.777273C11.1301 1.99111 9.86051 3.79212 9.07806 6.09926L10.9721 6.74162C11.6413 4.76847 12.6764 3.35925 14.0434 2.43295C15.4167 1.50235 17.2126 1 19.5004 1V-1ZM11.1004 7.30255C12.6907 5.62967 14.4042 5.10069 16.3463 5.55695L16.8037 3.60996C14.0926 2.97305 11.6733 3.79712 9.65083 5.92456L11.1004 7.30255ZM16.3463 5.55696C17.5202 5.83268 18.3899 6.63023 19.6014 7.78736L20.9828 6.34104C19.8482 5.25741 18.5964 4.03104 16.8036 3.60995L16.3463 5.55696ZM19.6018 7.78769C20.5507 8.69312 21.6704 9.7678 23.1998 10.5957C24.7495 11.4346 26.6758 12 29.2502 12V10C26.9917 10 25.395 9.50973 24.1519 8.83684C22.8885 8.15292 21.9456 7.2597 20.9824 6.34071L19.6018 7.78769ZM29.2502 12C31.8278 12 34.0437 11.4323 35.8286 10.2229C37.6199 9.00923 38.8895 7.20846 39.6718 4.90163L37.7777 4.25936C37.1088 6.23199 36.0737 7.64098 34.7067 8.56718C33.3334 9.49769 31.5376 10 29.2502 10V12ZM37.6493 3.6985C36.0597 5.37104 34.3464 5.89986 32.4046 5.44311L31.9466 7.38998C34.6577 8.02765 37.0771 7.20371 39.099 5.07632L37.6493 3.6985ZM32.4041 5.44301C31.2295 5.16725 30.3598 4.36966 29.1482 3.21314L27.7673 4.6599C28.9017 5.74271 30.1535 6.96904 31.947 7.39008L32.4041 5.44301ZM29.1483 3.2133C28.1993 2.30704 27.0797 1.23211 25.5504 0.404169C24.0008 -0.434783 22.0747 -1 19.5004 -1V1C21.7589 1 23.3554 1.49011 24.5983 2.16296C25.8614 2.84681 26.8041 3.74014 27.7671 4.65974L29.1483 3.2133ZM9.74981 10C7.17206 10 4.95609 10.5678 3.17112 11.7774C1.3798 12.9913 0.110142 14.7924 -0.672026 17.0997L1.2221 17.7418C1.89099 15.7686 2.92609 14.3594 4.29308 13.433C5.66642 12.5024 7.46231 12 9.74981 12V10ZM1.35034 18.3028C2.94075 16.6297 4.65428 16.1007 6.59564 16.5569L7.05318 14.61C4.34259 13.973 1.92317 14.7973 -0.0992438 16.9248L1.35034 18.3028ZM6.59586 16.557C7.77045 16.8327 8.64013 17.6303 9.85161 18.7874L11.233 17.341C10.0983 16.2573 8.84657 15.031 7.05295 14.6099L6.59586 16.557ZM9.85196 18.7877C10.8008 19.6931 11.9204 20.7678 13.4497 21.5957C14.9993 22.4346 16.9257 23 19.5004 23V21C17.2415 21 15.6448 20.5097 14.4018 19.8368C13.1385 19.1529 12.1958 18.2598 11.2326 17.3407L9.85196 18.7877ZM19.5004 23C22.0781 23 24.294 22.4324 26.079 21.223C27.8704 20.0093 29.14 18.2084 29.9222 15.901L28.0281 15.2589C27.3592 17.232 26.3241 18.6411 24.9572 19.5673C23.5838 20.4978 21.7879 21 19.5004 21V23ZM27.8998 14.6979C26.3095 16.371 24.5959 16.9 22.6537 16.4438L22.1963 18.3908C24.9075 19.0277 27.327 18.2035 29.3494 16.0759L27.8998 14.6979ZM22.6541 16.4439C21.4798 16.1675 20.61 15.3697 19.3983 14.2131L18.0174 15.6599C19.1519 16.7427 20.4035 17.9688 22.1959 18.3907L22.6541 16.4439ZM19.3982 14.213C18.4494 13.3077 17.3296 12.2328 15.8003 11.4047C14.2506 10.5656 12.3242 10 9.74981 10V12C12.0083 12 13.6049 12.4904 14.848 13.1635C16.1115 13.8476 17.0544 14.741 18.0176 15.66L19.3982 14.213ZM-0.672026 17.0997C-0.889639 17.7416 -0.537234 18.2988 -0.109577 18.5315C0.304715 18.7568 0.918575 18.757 1.35034 18.3028L-0.0992438 16.9248C0.18334 16.6276 0.587185 16.6337 0.846137 16.7746C1.11845 16.9227 1.3702 17.3049 1.2221 17.7418L-0.672026 17.0997ZM29.9222 15.901C30.1398 15.2591 29.7874 14.7019 29.3598 14.4693C28.9455 14.2439 28.3316 14.2437 27.8998 14.6979L29.3494 16.0759C29.0669 16.3732 28.663 16.367 28.4041 16.2261C28.1317 16.078 27.88 15.6958 28.0281 15.2589L29.9222 15.901ZM39.6718 4.90163C39.8895 4.25959 39.537 3.70235 39.1093 3.46973C38.695 3.24438 38.0811 3.24419 37.6493 3.6985L39.099 5.07632C38.8164 5.37366 38.4126 5.36747 38.1537 5.22663C37.8814 5.07852 37.6295 4.69631 37.7777 4.25936L39.6718 4.90163ZM9.07806 6.09926C8.86033 6.74124 9.21275 7.29849 9.64037 7.53115C10.0546 7.75655 10.6685 7.7568 11.1004 7.30255L9.65083 5.92456C9.93346 5.62726 10.3373 5.63349 10.5962 5.77436C10.8685 5.9225 11.1203 6.30472 10.9721 6.74162L9.07806 6.09926Z" fill="white" mask="url(#path-1-inside-1)" />[m
[32m+[m[32m                        </svg>[m
[32m+[m[32m                        </div>[m
[32m+[m[32m                        <h4 class="font-semibold text-xl text-dark mb-3">[m
[32m+[m[32m                        Infogérance & hébergement web[m
[32m+[m[32m                        </h4>[m
[32m+[m[32m                        <p class="text-body-color">[m
[32m+[m[32m                        We dejoy working with discerning clients, people for whom[m
[32m+[m[32m                        qualuty, service, integrity & aesthetics.[m
[32m+[m[32m                        </p>[m
[32m+[m[32m                    </div>[m
[32m+[m[32m                </div>[m
[32m+[m[32m                <div class="w-full md:w-1/2 lg:w-1/3 px-4">[m
[32m+[m[32m                    <div class=" p-10 md:px-7 xl:px-10 rounded-[20px] bg-white shadow-md hover:shadow-lg mb-8 " >[m
[32m+[m[32m                        <div class=" w-[70px] h-[70px] flex items-center justify-center bg-primary rounded-2xl mb-8 " >[m
[32m+[m[32m                        <svg width="35" height="35" viewBox="0 0 35 35" fill="none" xmlns="http://www.w3.org/2000/svg" >[m
[32m+[m[32m                            <path d="M10.7734 14.3281H3.82813C2.07813 14.3281 0.65625 12.9062 0.65625 11.1562V4.21094C0.65625 2.46094 2.07813 1.03906 3.82813 1.03906H10.7734C12.5234 1.03906 13.9453 2.46094 13.9453 4.21094V11.1562C13.9453 12.9062 12.5234 14.3281 10.7734 14.3281ZM3.82813 2.95312C3.17188 2.95312 2.57031 3.5 2.57031 4.21094V11.1562C2.57031 11.8125 3.11719 12.4141 3.82813 12.4141H10.7734C11.4297 12.4141 12.0313 11.8672 12.0313 11.1562V4.21094C12.0313 3.55469 11.4844 2.95312 10.7734 2.95312H3.82813Z" fill="white" />[m
[32m+[m[32m                            <path d="M31.1719 14.3281H24.2266C22.4766 14.3281 21.0547 12.9062 21.0547 11.1562V4.21094C21.0547 2.46094 22.4766 1.03906 24.2266 1.03906H31.1719C32.9219 1.03906 34.3438 2.46094 34.3438 4.21094V11.1562C34.3438 12.9062 32.9219 14.3281 31.1719 14.3281ZM24.2266 2.95312C23.5703 2.95312 22.9688 3.5 22.9688 4.21094V11.1562C22.9688 11.8125 23.5156 12.4141 24.2266 12.4141H31.1719C31.8281 12.4141 32.4297 11.8672 32.4297 11.1562V4.21094C32.4297 3.55469 31.8828 2.95312 31.1719 2.95312H24.2266Z" fill="white" />[m
[32m+[m[32m                            <path d="M10.7734 33.9609H3.82813C2.07813 33.9609 0.65625 32.5391 0.65625 30.7891V23.8438C0.65625 22.0938 2.07813 20.6719 3.82813 20.6719H10.7734C12.5234 20.6719 13.9453 22.0938 13.9453 23.8438V30.7891C13.9453 32.5391 12.5234 33.9609 10.7734 33.9609ZM3.82813 22.5859C3.17188 22.5859 2.57031 23.1328 2.57031 23.8438V30.7891C2.57031 31.4453 3.11719 32.0469 3.82813 32.0469H10.7734C11.4297 32.0469 12.0313 31.5 12.0313 30.7891V23.8438C12.0313 23.1875 11.4844 22.5859 10.7734 22.5859H3.82813Z" fill="white" />[m
[32m+[m[32m                            <path d="M31.1719 33.9609H24.2266C22.4766 33.9609 21.0547 32.5391 21.0547 30.7891V23.8438C21.0547 22.0938 22.4766 20.6719 24.2266 20.6719H31.1719C32.9219 20.6719 34.3438 22.0938 34.3438 23.8438V30.7891C34.3438 32.5391 32.9219 33.9609 31.1719 33.9609ZM24.2266 22.5859C23.5703 22.5859 22.9688 23.1328 22.9688 23.8438V30.7891C22.9688 31.4453 23.5156 32.0469 24.2266 32.0469H31.1719C31.8281 32.0469 32.4297 31.5 32.4297 30.7891V23.8438C32.4297 23.1875 31.8828 22.5859 31.1719 22.5859H24.2266Z" fill="white" />[m
[32m+[m[32m                        </svg>[m
[32m+[m[32m                        </div>[m
[32m+[m[32m                        <h4 class="font-semibold text-xl text-dark mb-3">[m
[32m+[m[32m                        Formations personnalisées conseils[m
[32m+[m[32m                        </h4>[m
[32m+[m[32m                        <p class="text-body-color">[m
[32m+[m[32m                        We dejoy working with discerning clients, people for whom[m
[32m+[m[32m                        qualuty, service, integrity & aesthetics.[m
[32m+[m[32m                        </p>[m
[32m+[m[32m                    </div>[m
[32m+[m[32m            </div>[m
[32m+[m[32m            </div>[m
[32m+[m[32m        </section>[m
[32m+[m[32m    {{-- ====== Services Section End  --}}[m
[32m+[m[32m</x-Web.app-layout>[m
[1mdiff --git a/routes/web.php b/routes/web.php[m
[1mindex 759ffdb..a5c27a3 100644[m
[1m--- a/routes/web.php[m
[1m+++ b/routes/web.php[m
[36m@@ -1,15 +1,53 @@[m
 <?php[m
 [m
[32m+[m[32muse App\Models\Admin\About;[m
[32m+[m[32muse App\Models\Admin\Setting;[m
 use App\Models\Admin\Vue;[m
 use Illuminate\Support\Facades\File;[m
 use Illuminate\Support\Facades\Route;[m
 use Illuminate\Support\Facades\View;[m
 [m
 [m
[31m-/* version 2[m
[31m-    Route::namespace('Admin')->prefix('admin/')->name('admin.')->group(function (){[m
[32m+[m[32m// $settings = Setting::where('name','Star Car Compnay')->get();[m
[32m+[m[32m$setting = Setting::where('name','SERDI Cameroun')->first();[m
[32m+[m[32mView::share('setting', $setting);[m
 [m
[31m-        foreach (File::directories(resource_path('views/admin/pages')) as $directory) {[m
[32m+[m[32mRoute::prefix('admin')->name('admin.')->group(function () {[m[41m    [m
[32m+[m[32m    $vues = Vue::where('published', true)->where('vue_id_gear',1)->get();[m
[32m+[m[32m    View::share('vues', $vues);[m
[32m+[m[32m    // dd($settings);[m
[32m+[m[32m    Route::view('/','admin.dashboard')->name('dashboard');[m
[32m+[m[32m    foreach (File::directories(resource_path('views/admin/pages')) as $directory) {[m
[32m+[m[32m        $prefix = basename($directory).'/';[m
[32m+[m[32m        $controller = 'App\\Http\\Controllers\\Admin\\' . ucfirst(basename($directory)) . 'Controller';[m
[32m+[m[32m        Route::prefix($prefix)->name(basename($directory))->group(function () use ($controller, $prefix) {[m
[32m+[m[32m            Route::resource('/', $controller)->names([[m
[32m+[m[32m                'index' => '.index',[m
[32m+[m[32m                'create' => '.create',[m
[32m+[m[32m                'store' => '.add',[m
[32m+[m[32m                // 'show' => 'admin.'.$prefix.'show',[m
[32m+[m[32m                'edit' => '.edit',[m
[32m+[m[32m                'update' => '.update',[m[41m [m
[32m+[m[32m                'destroy' => '.destroy',[m
[32m+[m[32m            ]);[m
[32m+[m[32m        });[m
[32m+[m[32m    }[m
[32m+[m[32m});[m
[32m+[m
[32m+[m[32mRoute::get('accueil',function(){[m
[32m+[m[32m    $setting = Setting::where('name','SERDI Cameroun')->first();[m
[32m+[m[32m    $about = About::where('published',true)->where('about_id_gear',$setting->id_gear)->first();[m
[32m+[m[32m    // dd($about);[m
[32m+[m[32m    return view('web.pages.accueil',compact('about'));[m
[32m+[m[32m})->name('home');[m
[32m+[m[32m// Route::view('accueil','web.pages.accueil');[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m[32m/* version 2[m
[32m+[m[32mRoute::namespace('Admin')->prefix('admin/')->name('admin.')->group(function (){[m
[32m+[m[41m    [m
[32m+[m[32m    foreach (File::directories(resource_path('views/admin/pages')) as $directory) {[m
             $controller = 'App\\Http\\Controllers\\Admin\\' . ucfirst(basename($directory)) . 'Controller';[m
         }[m
         [m
[36m@@ -19,7 +57,7 @@[m
         foreach (File::directories(resource_path('views/admin/pages')) as $directory) {[m
             $prefix = basename($directory).'/';[m
             $controller = ucfirst(basename($directory)).'Controller';[m
[31m-        // dd($controller);[m
[32m+[m[32m            // dd($controller);[m
             Route::prefix($prefix)->name(basename($directory))->group(function () use ($controller, $prefix) {[m
                 Route::resource('/', $controller)->names([[m
                     'index' => '.index',[m
[36m@@ -32,16 +70,16 @@[m
                 ]);[m
             });[m
         }[m
[31m-[m
[32m+[m[41m        [m
     }); [m
[31m-*/[m
[31m-/* version 3[m
[31m- Route::prefix('admin/')->name('admin.')->group(function (){[m
[31m-    foreach (File::directories(resource_path('views/admin/pages')) as $directory) {[m
[31m-        $controller = 'App\\Http\\Controllers\\Admin\\' . ucfirst(basename($directory)) . 'Controller';[m
[31m-        // Utilisez $controller ici[m
[31m-    }[m
[31m-      [m
[32m+[m[32m    */[m
[32m+[m[32m    /* version 3[m
[32m+[m[32m    Route::prefix('admin/')->name('admin.')->group(function (){[m
[32m+[m[32m        foreach (File::directories(resource_path('views/admin/pages')) as $directory) {[m
[32m+[m[32m            $controller = 'App\\Http\\Controllers\\Admin\\' . ucfirst(basename($directory)) . 'Controller';[m
[32m+[m[32m            // Utilisez $controller ici[m
[32m+[m[32m        }[m
[32m+[m[41m        [m
     $vues = Vues::where('published', true)->get();[m
     View::share('vues', $vues);[m
     Route::view('/','admin.dashboard')->name('dashboard');[m
[36m@@ -61,25 +99,6 @@[m
         });[m
     }[m
 }); */[m
[31m-Route::prefix('admin')->name('admin.')->group(function () {    [m
[31m-    $vues = Vue::where('published', true)->get();[m
[31m-    View::share('vues', $vues);[m
[31m-    Route::view('/','admin.dashboard')->name('dashboard');[m
[31m-    foreach (File::directories(resource_path('views/admin/pages')) as $directory) {[m
[31m-        $prefix = basename($directory).'/';[m
[31m-        $controller = 'App\\Http\\Controllers\\Admin\\' . ucfirst(basename($directory)) . 'Controller';[m
[31m-        Route::prefix($prefix)->name(basename($directory))->group(function () use ($controller, $prefix) {[m
[31m-            Route::resource('/', $controller)->names([[m
[31m-                'index' => '.index',[m
[31m-                'create' => '.create',[m
[31m-                'store' => '.add',[m
[31m-                // 'show' => 'admin.'.$prefix.'show',[m
[31m-                'edit' => '.edit',[m
[31m-                'update' => '.update', [m
[31m-                'destroy' => '.destroy',[m
[31m-            ]);[m
[31m-        });[m
[31m-    }[m
[31m-});[m
 [m
[31m-Route::view('accueil','web.pages.accueil')->name('home');[m
\ No newline at end of file[m
[41m+[m
[41m+[m
