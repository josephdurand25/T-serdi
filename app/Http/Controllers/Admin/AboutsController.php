<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\FormAboutRequest;
use App\Models\Admin\About;
use App\Models\Admin\Setting;
use Illuminate\Http\Request;

class AboutsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        // $about = About
        return view('admin.pages.abouts.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(FormAboutRequest $request)
    {
        //
        $setting = Setting::where('name','SERDI Cameroun')->first();

        $validateData = $request->validated();
        $about_old = About::where('published',true)->first();
        if (isset($about_old)) {
            # code...
            // $about = new About;
            if ($validateData['description'] && $validateData['image-about'] ) {
                # code...
                $about_old->text_about = $validateData['description'];
                $image=$image=$validateData['image-about'];
                // format : titre-prenom.extention
                $nameimage = 'about-img.'.$image->getClientOriginalExtension();
                $image->move('storage/utilities/about', $nameimage);
                $about_old->img_about = "storage/utilities/about/{$nameimage}";
                $result = $about_old->save();
                if($result){
                    return redirect()->back()->with('success', 'La mise à jour de la section \'A propos \' effectuée avec succès.') ;
                }else{
                    return redirect()->back()->with('echec', 'La mise à jour de la section \'A propos \' a échoué.');
                }
            } elseif($validateData['description'] && !$validateData['image-about']) {
                # code...
                $about_old->text_about = $validateData['description'];
                $result = $about_old->save();
                if($result){
                    return redirect()->back()->with('success', 'La description de la section \'A propos \' a été définie avec succès.') ;
                }else{
                    return redirect()->back()->with('echec', 'La mise à jour de la description de la section \'A propos \' a échoué.');
                }
            } else{
                # code...
                $image=$validateData['image-about'];
                // format : titre-prenom.extention
                $nameimage = 'about-img'.$image->getClientOriginalExtension();
                $image->move('storage/utiilities/about', $nameimage);
                $about_old->img_about = "storage/utiilities/about/{$nameimage}";
                $result=$about_old->save();
                if($result){
                    return redirect()->back()->with('success', 'L\image de la section \'A propos \' a été définie avec succès.') ;
                }else{
                    return redirect()->back()->with('echec', 'La mise à jour de l\'image de la section \'A propos \' a échoué.');
                }
            }
            
        } else {
        //     # code...
        // dd($setting);
            $about = new About;
            $about->about_id_gear  = $setting->id_gear;
            $about->text_about = $validateData['description'];
            $image=$validateData['image-about'];
            // format : titre-prenom.extention
            $nameimage = 'about-img'.$image->getClientOriginalExtension();
            $image->move('storage/utiilities/about', $nameimage);
            $about->img_about = "storage/utiilities/about/{$nameimage}";
           $result= $about->save();
            if($result){
                return redirect()->back()->with('success', 'La section \'A propos \' a été définie avec succès.') ;
            }else{
                return redirect()->back()->with('echec', 'La mise à jour de la section à propos a échoué.');
            }
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
