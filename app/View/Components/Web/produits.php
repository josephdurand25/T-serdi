<?php

namespace App\View\Components\Web;

use App\Models\Admin\Produit;
use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\View\Component;

class produits extends Component
{
    /**
     * Create a new component instance.
     */
    public function __construct(public Collection $produits)
    {
        //
        $this->produits = Produit::where('published',1)->get();
    }

    /**
     * Get the view / contents that represent the component.
     */
    public function render(): View|Closure|string
    {
        return view('components.web.produits',['produits' => $this->produits]);
    }
}
