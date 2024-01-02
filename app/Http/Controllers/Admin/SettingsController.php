<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\FormSettingsRequest;
use App\Models\Admin\Setting;
use Illuminate\Http\Request;

class SettingsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        return view('admin.pages.settings.index');
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
    public function store(FormSettingsRequest $request)
    {
        //
        $validateData = $request->validated();
        $setting = new Setting;
        $setting->name=$validateData['entreprise'];
        $setting->slogan=$validateData['slogan'];
        $setting->email=$validateData['email'];
        $setting->address=$validateData['address'];
        
        $image1 = $validateData['logo'];
        $nameimage1 ='logo-'.$validateData['entreprise'].'.'.$image1->getClientOriginalExtension();
        $image1->move('storage/utilities/setting', $nameimage1);
        $setting->logo = "storage/utilities/setting/{$nameimage1}";
        
        $image2 = $validateData['galerie'];
        $nameimage2 =$validateData['entreprise'].'.'.$image2->getClientOriginalExtension();
        $image2->move('storage/utilities/setting', $nameimage2);
        $setting->galerie = "storage/utilities/setting/{$nameimage2}";
        $put_in_db = $setting->save();
        // dd($setting);
        if ($put_in_db){
            return to_route('admin.dashboard')->with('success','entreprise enregistrée avec succès.');
        }else{
            return to_route('dashboard')->with('error','infos d\'entreprise non enregistrées.');
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
