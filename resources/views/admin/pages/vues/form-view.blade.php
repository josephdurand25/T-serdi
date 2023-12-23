<form  {{ $attributes->merge(['class'=>"bg-transparent shadow px-3 py-3 w-1/2"]) }} method="POST" action="{{ route($route) }}" >
    @csrf
    {{-- @method('post') --}}
    <h2 class="font-medium text-primary text-xl border-b border-blue-500"> Nouveau lien</h2>
    <div class="mt-2">
        <x-label class="capitalize mb-1">name view</x-label> 
        <x-text-input class="py-2 px-5 font-normal" name="name_view" placeholder="Entrer le nom du lien" type="text"></x-text-input>
        @error('name_view')
            <p class="text-xs italic text-red-500 my-2">
                {{ $message }}
            </p>
        @enderror
    </div>
    <div class="mt-2">
        <x-label class=" capitalize mb-1">View file</x-label> 
        <x-text-input class="py-2 px-5 font-normal" name="view_page"  placeholder="Fichier de vue" type="link"></x-text-input>
        @error('view_page')
            <p class="text-xs italic text-red-500 my-2">
                {{ $message }}
            </p>
        @enderror
    </div>
    <div class="mt-2">
        <x-label class=" capitalize mb-1">Folder</x-label> 
        <x-text-input class="py-2 px-5 font-normal" name="view_folder"  placeholder="Dossier cible" type="text"></x-text-input>
        @error('view_folder')
            <p class="text-xs italic text-red-500 my-2">
                {{ $message }}
            </p>
        @enderror
    </div>
    <div class="mt-2">
        <x-label class=" capitalize mb-1">Icon</x-label> 
        <x-text-input class="py-2 px-5 font-normal" name="icon_view"  placeholder="Choose icon" type="text"></x-text-input>
        @error('icon_view')
            <p class="text-xs italic text-red-500 my-2">
                {{ $message }}
            </p>
        @enderror
    </div>
    <x-my-button class="capitalize my-3" >save</x-my-button>
</form>  