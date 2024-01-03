<x-Admin.app-layout>
    <x-message></x-message> 
    <div class="">
        <form class="px-4" action="{{ route('admin.services.add') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <h2>Nouveau service</h2>
            <div class="flex justify-between items-center ">
                <div class="mt-2 w-5/12">
                    <div>
                        <x-label class="capitalize mb-1">Intitutlé service</x-label> 
                        <x-text-input class="py-2 px-5 font-normal" name="intitule" placeholder="Entrer le nom du lien" type="text"></x-text-input>
                        <x-error-input input="intitule"></x-error-input>
                    </div>
                    <div class="">
                        <x-label>Image service</x-label>
                        <x-image-input name="img_service"></x-image-input>
                        <x-error-input input="img_service"></x-error-input>
                    </div>
                </div>
                <div class="mt-2 flex-1 px-4">
                    <label class="mb-3 block font-medium text-sm text-black ">
                        Description
                    </label>
                    <textarea 
                        class="w-full rounded border-[1.5px] border-stroke bg-transparent py-3 px-5 font-medium outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:focus:border-primary"
                        name="description" id="" cols="30" rows="10"></textarea>
                        <x-error-input input="description"></x-error-input>
                </div>
            </div>
            <x-my-button class="capitalize my-3" >save</x-my-button>
        </form>       
    </div>
</x-Admin.app-layout>