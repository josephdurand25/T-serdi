<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class FormServicesRequest extends FormRequest
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
            'intitule' => ['required',Rule::unique('services')->ignore($this->route()->parameter('services'))],
            'img_service' => ['required','file','max:1024'],
            'description' => ['required'],
        ];
    }

    public function messages(){
        return [
            'intitule.required' => 'Nom du service requis.',
            'intitule.unique' => 'Ce service existe déjà.',
            'description.required' => 'Desctiption du service requise.',
            'img_service.max' => 'Taille d\'image > 1 Mo.',
            'img_service.required' => 'Image requise.',
            'img_service.file' => 'Image non valide.',
        ];
    }
}
