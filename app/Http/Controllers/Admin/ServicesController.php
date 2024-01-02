<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\FormServicesRequest;
use App\Models\Admin\Service;
use App\Models\Admin\Setting;
use Illuminate\Http\Request;

class ServicesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        return view('admin.pages.services.index');
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
    public function store(FormServicesRequest $request)
    {
        //
        $setting = Setting::where('name','SERDI Cameroun')->first();

        $validateData=$request->validated();
        // dd($validateData);
        $service = new Service;
        $service->service_id_gear  = $setting->id_gear;
        $service->intitule = $validateData['intitule'];
        $service->description = $validateData['description'];
        $image=$validateData['img_service'];
        // format : titre-prenom.extention
        $nameimage = $service->intitule.'.'.$image->getClientOriginalExtension();
        $image->move('storage/utiilities/service', $nameimage);
        $service->img_service = "storage/utiilities/service/{$nameimage}";
       $result= $service->save();
       if($result){
        return redirect()->back()->with('success', "Service '$service->intitule' crée avec succès.") ;
    }else{
        return redirect()->back()->with('echec', "Le service '$service->intitule' n'a pas été crée.");
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
