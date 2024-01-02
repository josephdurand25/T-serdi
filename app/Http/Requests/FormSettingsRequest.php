<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class FormSettingsRequest extends FormRequest
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
            'entreprise' => ['required'],
            'slogan' => ['required','max:50'],
            'email' => ['required','email'],
            'address' => ['required'],
            'logo' => ['required','file'],
            'galerie' => ['required','file'],
        ];
    }

    public function messages(){
        return [
            'entreprise.required' => '* Champ obligatoire .',
            'slogan.required' => '* Champ obligatoire .',
            'email.required' => '* Champ obligatoire .',
            'address.required' => '* Champ obligatoire .',
            'logo.required' => '* Champ obligatoire .',
            'galerie.required' => '* Champ obligatoire .',
            
        ];
    }
}
