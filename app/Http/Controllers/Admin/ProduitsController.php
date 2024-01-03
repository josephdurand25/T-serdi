<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\FormProduitsRequest;
use App\Models\Admin\Produit;
use App\Models\Admin\Setting;
use Illuminate\Http\Request;

class ProduitsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $setting = Setting::where('name','SERDI Cameroun')->first();
        $produits = Produit::where('published',true)->where('produit_id_gear',$setting->id_gear);
        if (isset($produits)) {
            # code...
            return view('admin.pages.produits.index',compact('produits'));
        } else {
            # code...
            return view('admin.pages.produits.index');
        }
        
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
    public function store(FormProduitsRequest $request)
    {
        //
        $validateData=$request->validated();
        $setting = Setting::where('name','SERDI Cameroun')->first();
        $produit = new Produit;
        $produit->produit_id_gear  = $setting->id_gear;
        $produit->intitule = $validateData['intitule'];
        $produit->description = $validateData['description'];
        $image=$validateData['img_produit'];
        $nameimage = $produit->intitule.'.'.$image->getClientOriginalExtension();
        $image->move('storage/utilities/produit', $nameimage);
        $produit->img_produit = "storage/utilities/produit/{$nameimage}";
       $result= $produit->save();
       if($result){
            return redirect()->back()->with('success', "Produit '$produit->intitule' crée avec succès.") ;
        }else{
            return redirect()->back()->with('echec', "Le produit '$produit->intitule' n'a pas été enregistré.");
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
