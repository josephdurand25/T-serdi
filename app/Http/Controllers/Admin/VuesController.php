<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\FormViewRequest;
use App\Models\Admin\Vues;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;

class VuesController extends Controller
{
    public function index()
    {
        //
        return view('admin.pages.vues.index');
    }

    // public function store(FormViewRequest $request)
    // {
    //     $validateData = $request->validated();
    //     // dd($validateData);
    //     //
    //     $vue = new Vues;
    //     $vue->name_view = $validateData['name_view'];
    //     $vue->ico_view = $validateData['icon_view'];
    //     $vue->view_page = $validateData['view_page'];
    //     // Obtenez le nom du champ de formulaire
    //     $nomDuFichier = $vue->view_page; 
    //     // Remplacez 'nomDuChamp' par le nom de votre champ de formulaire
    //     $nomDuFichier .= '.blade.php'; // Ajoutez l'extension de votre choix
    //     $path = "views/admin/pages/".$validateData['view_folder']."/". $nomDuFichier;
    //     // dd($path);
    //     $cheminDuFichier = resource_path($path);
    //     // Vérifiez si le répertoire existe
    //     if (!is_dir(dirname($cheminDuFichier))) {
    //         mkdir("views/admin/pages/".$validateData['view_folder'], 0777, true);
    //         $fichier = fopen($cheminDuFichier, 'w');
    //         if($fichier)
    //         {
    //             $result = $vue->save();
    //             return ($result) ?  redirect()->back()->with('success','La vue a été enregistrée et créée avec success.') : redirect()->back()->with('echec','La vue n\'a pas été enregistrée.') ;
    //         }else{
    //            return redirect()->back()->with('echec','La vue n\'a pas été créée.');
    //         }
    //     } else {
    //         $fichier = fopen($cheminDuFichier, 'w');
    //         // ...
    //         if($fichier)
    //         {
    //             $result = $vue->save();
    //             return ($result) ?  redirect()->back()->with('success','La vue a été enregistrée et créée avec success.') : redirect()->back()->with('echec','La vue n\'a pas été enregistrée.') ;
    //         }else{
    //            return redirect()->back()->with('echec','La vue n\'a pas été créée.');
    //         }
    //     }

    // }
    public function store(FormViewRequest $request)
    {
        $validateData = $request->validated();
        $vue = new Vues;
        $vue->name_view = $validateData['name_view'];
        $vue->ico_view = $validateData['icon_view'];
        $vue->view_page = $validateData['view_page'].'.';
        $vue->view_folder = $validateData['view_folder'];

        $nomDuFichier = $vue->view_page . '.blade.php';
        $cheminDuDossier = resource_path('views/admin/pages/' . $validateData['view_folder']);

        // Vérifiez si le répertoire existe et est accessible en écriture
        if (!is_dir($cheminDuDossier) || !is_writable($cheminDuDossier)) {
            // Créez le répertoire s'il n'existe pas et donnez-lui des permissions d'écriture
            mkdir($cheminDuDossier, 0777, true);
        }
            $cheminDuFichier = $cheminDuDossier . '/' . $nomDuFichier;

        // Créez le fichier
            $fichier = fopen($cheminDuFichier, 'w');

        if ($fichier) {
            fclose($fichier);
            $result = $vue->save();
            if($result){
                Artisan::call('app:create-controllers');
                Artisan::call('app:create-models');
                return redirect()->back()->with('success', 'La vue a été enregistrée et créée avec succès.') ;
            }else{
                return redirect()->back()->with('echec', 'La vue n\'a pas été enregistrée.');
            }
        } else {
            return redirect()->back()->with('echec', 'La vue n\'a pas été créée.');
        }
    }

    public function destroy(string $id)
    {
        //
    }
}
