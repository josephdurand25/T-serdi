<x-Admin.app-layout>
  <x-message></x-message> 
    <form action="{{ route('admin.settings.add') }}" class="" method="POST" enctype="multipart/form-data">
      @csrf
        <div class="grid grid-cols-2 p-6.5 gap-4">
          <div class="mb-4.5">
            <x-label>Entreprise</x-label>
            <x-text-input name="entreprise" placeholder="Nom de l'Entreprise" class="my-2 p-2 bg-white w-full"></x-text-input>
            <x-error-input input="entreprise"></x-error-input>
          </div>
          <div class="mb-4.5">
            <x-label>Slogan</x-label>
            <x-text-input name="slogan" placeholder="Slogan" class="my-2 p-2 bg-white w-full"></x-text-input>
            <x-error-input input="slogan"></x-error-input>
          </div>
          <div class="mb-4.5">
            <x-label>Email <span class="text-meta-1">*</span></x-label>
            <x-email-input name="email" class="w-full my-2 p-2 bg-white"  placeholder="Enter your email address"></x-email-input>
            <x-error-input input="email"></x-error-input>
          </div>
          
          <div class="mb-4.5">
            <x-label>Adresse</x-label>
            <x-text-input name="address" placeholder="Enter address of entreprise" class="my-2 p-2 bg-white  w-full"></x-text-input>
            <x-error-input input="address"></x-error-input>
          </div>
          <div class="mb-4.5">
              <x-label>Logo</x-label>
              <x-image-input name="logo"></x-image-input>
              <x-error-input input="logo"></x-error-input>
          </div>
          <div class="mb-4.5">
              <x-label>Galery</x-label>
              <x-image-input name="galerie"></x-image-input>
              <x-error-input input="galerie"></x-error-input>
          </div>
        </div>
        <x-my-button class="capitalize my-3" >save</x-my-button>
      </form>
</x-Admin.app-layout>