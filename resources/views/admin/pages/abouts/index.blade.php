<x-Admin.app-layout>
    <x-message></x-message> 
    <div class="container  justify-between p-3">
        {{-- logo du site web --}}
            <form action="{{route('admin.abouts.add')}}"  class="mt-2" method="POST" enctype="multipart/form-data">
                @csrf
                <x-label class="">Image</x-label>
                <x-error-input input='image-about'></x-error-input>
                <x-image-input name="image-about"></x-image-input>
                {{-- <x-my-button class="capitalize my-3" >Edit</x-my-button> --}}
         
         {{--ajouter un lien de navigation  --}}
          
                <label class="mb-3 block font-medium text-sm  dark:text-slate-100 ">
                    Description
                </label>
                <textarea 
                    name="description" id="" cols="30" rows="10"
                    class="w-full rounded border-[1.5px] border-stroke bg-transparent py-3 px-5 font-medium outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:focus:border-primary"
                    >
                </textarea>
                <x-my-button class="capitalize my-3" >save</x-my-button>
            </form>
        </div>
</x-Admin.app-layout>