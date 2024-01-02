<x-Admin.app-layout>
    <div class="flex">
        @if(Session::get('echec'))
            <div class="bg-red-100 p-5 w-full" id="message">
                <div class="flex space-x-3">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="flex-none fill-current text-red-500 h-4 w-4">
                    <path d="M12 0c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm4.597 17.954l-4.591-4.55-4.555 4.596-1.405-1.405 4.547-4.592-4.593-4.552 1.405-1.405 4.588 4.543 4.545-4.589 1.416 1.403-4.546 4.587 4.592 4.548-1.403 1.416z" /></svg>
                <div class="leading-tight flex flex-col space-y-2">
                    <div class="text-sm font-medium text-red-700">
                        Error 
                    </div>
                    <div class="flex-1 leading-snug text-sm text-red-600">{{ Session::get('echec') }}</div>
                </div>
                </div>
            </div>
            <script>
                window.onload = function() {
                    var element = document.getElementById('message');
                    setTimeout(() => {
                        element.remove();
                    }, 4000);
                }
            </script>
        @endif
        @if(Session::get('success'))
            <div class="bg-green-100 p-5 w-full m-1 rounded" id="message">
                <div class="flex justify-between">
                <div class="flex space-x-3">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="flex-none fill-current text-green-500 h-4 w-4">
                    <path d="M12 0c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm-1.25 16.518l-4.5-4.319 1.396-1.435 3.078 2.937 6.105-6.218 1.421 1.409-7.5 7.626z" /></svg>
                    <div class="flex-1 leading-tight text-sm text-green-700 font-medium">
                        {{ Session::get('success') }}
                    </div>
                </div>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="flex-none fill-current text-green-600 h-3 w-3">
                    <path d="M23.954 21.03l-9.184-9.095 9.092-9.174-2.832-2.807-9.09 9.179-9.176-9.088-2.81 2.81 9.186 9.105-9.095 9.184 2.81 2.81 9.112-9.192 9.18 9.1z" /></svg>
                </div>
            </div>
            <script>
                window.onload = function() {
                    var element = document.getElementById('message');
                    setTimeout(() => {
                        element.remove();
                    }, 4000);
                }
            </script>
        @endif
    </div>
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