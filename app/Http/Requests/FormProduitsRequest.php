<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class FormProduitsRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            //
            'intitule' => ['required',Rule::unique('produits')->ignore($this->route()->parameter('produits'))],
            'img_produit' => ['required','file','max:1024'],
            'description' => ['required'],
        ];
    }

    public function messages(){
        return [
            'intitule.required' => 'Nom du produit requis.',
            'intitule.unique' => 'Ce produit existe déjà.',
            'description.required' => 'Desctiption du Produit requise.',
            'img_produit.max' => 'Taille d\'image > 1 Mo.',
            'img_produit.required' => 'Image requise.',
            'img_produit.file' => 'Image non valide.',
        ];
    }
}
