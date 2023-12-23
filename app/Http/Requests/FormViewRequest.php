<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class FormViewRequest extends FormRequest
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
            'name_view' => ['required','max:20'],
            'view_page' => ['required','max:50', Rule::unique('vues')->ignore($this->route()->parameter('vues'))],
            'view_folder' => ['required','max:30'],
            'icon_view' => ['required','max:150'],
           
        ];
    }

    public function messages()
    {
        return [
            'name_view.required' => 'Veuillez saisir le nom du lien.',
            'name_view.max' => 'Le nom du lien ne doit pas dépasser 20 caractères.',
            'view_page.required' => 'Veuillez saisir le nom du fichier de vue.',
            'view_page.max' => 'Le nom de la page ne doit pas dépasser 30 caractères.',
            'view_folder.required' => 'Veuillez saisir le dossier conteneur de la vue.',
            'view_folder.max' => 'Dossier conteneur trop long ( 30 caractères ).',
            'view_page.unique' => 'Le nom de la page doit être unique.',
            'icon_view.required' => 'Le champ iconlink est requis.',
            'icon_view.max' => 'Le code de l\'icone ne doit pas dépasser 15 caractères.',
            
        ];
    }
}