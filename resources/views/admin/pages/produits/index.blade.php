<x-Admin.app-layout>
    <x-message></x-message> 
    <form class="bg-transparent shadow px-3 py-3 " method="POST" enctype="multipart/form-data" action="{{ route("admin.produits.add") }}" >
        @csrf
        <h2 class="font-medium text-primary text-xl mb-5 border-b border-blue-500"> Nouveau Produit</h2>
        <div class="m-2">
            <x-label class="capitalize mb-1">Intitule du produit</x-label> 
            <x-text-input class="py-2 px-5 font-normal" name="intitule" placeholder="Entrer le nom du produit" type="text"></x-text-input>
            <x-error-input input="intitule"></x-error-input>
        </div>
        <div class="m-2">
            <x-label class="capitalize mb-1">Image produit</x-label>
            <x-image-input name="img_produit"></x-image-input>
            <x-error-input input="img_produit"></x-error-input>
        </div>
        <div class="m-2 flex-1 px-4">
            <x-label class="capitalize mb-1">Description</x-label>
            <textarea 
                class="w-full rounded border-[1.5px] border-stroke bg-transparent py-3 px-5 font-medium outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:focus:border-primary"
                name="description" id="" cols="30" rows="10"></textarea>
                <x-error-input input="description"></x-error-input>
        </div>
        <x-my-button class="capitalize my-3" >save</x-my-button>
    </form>  
</x-Admin.app-layout>