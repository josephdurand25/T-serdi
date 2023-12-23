<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class FormAboutRequest extends FormRequest
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
            
            'description' => ['required'],
            'image-about' => ['required','file','max:1024']
        ];
    }
    public function messages(){
        return [
            'description.required' => 'Desctiption de la section about requise.',
            'image-about.max' => 'Taille d\'image > 1 Mo.',
            'image-about.required' => 'Image requise.',
            'image-about.file' => 'Image non valide.',
        ];
    }
}
