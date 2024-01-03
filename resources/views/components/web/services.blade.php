<section class="py-10 bg-w sm:py-16 lg:py-24 z-40 relative">
    <div class="container mx-auto">
       
        <div class="flex flex-wrap -mx-4">
            <div class="w-full px-4">
                
                
                <div class="text-center mx-auto mb-12 lg:mb-20 max-w-[750px]">
                    <span class="font-semibold text-3xl mb-2 text-black/90 py-3 border-b border-green-600 border-3 ">
                        Nos <span class="text-green-800 capitalize">services</span>
                    </span>
                    <div class=" text-center  border-black space-y-12 mt-4">
                        <div class="text-center flex text-5xl font-bold   text-black sm:text-4xl lg:text-6xl">
                          
                          <div class="relative inline-grid grid-cols-1 grid-rows-1 gap-12 overflow-hidden">
                            @forelse ($services as $service)
                                <span class="animate-word-delay-{{ $loop->iteration }} text-4xl col-span-full row-span-full  text-transparent bg-clip-text bg-gradient-to-r from-green-600 to-green-700">{{ $service->intitule }}</span>
                            @empty
                                <h2>...</h2>
                            @endforelse
                          </div>
                      </div>
                    </div>
                    <p class="text-lg my-1  text-gray-900">
                    There are many variations of passages of Lorem Ipsum available
                    but the majority have suffered alteration in some form.
                    </p>
                </div>
            </div>
        </div>

        <div class="grid grid-cols-1 gap-6   lg:grid-cols-3 ">
            {{-- {{ dd($services) }} --}}
            @forelse ($services as $service)
                <a href="#" class=" shadow-2xl relative ">
                    <div class="  h-full relative shadow-2xl shadow-green-900 overflow-hidden group ">
                        <div class=" absolute -bottom-4 group-hover:top-0 left-0 w-full h-full group-hover:bg-green-900 transition-all ease-in-out duration-500  ">
                            <div class="w-full h-full  p-5 relative">
                                <div class="absolute top-48 p-2  group-hover:top-16 text-white  text-left   transition-all ease-in-out duration-500 ">
                                    <h2 class="text-2xl  font-bold  text-white mb-4 pb-1">
                                       {{$service->intitule}}
                                    </h2>
                                    <p class="text-lg  font-light text-white max-h-[200px] overflow-hidden">
                                        {{$service->description}}
                                </div>
                            </div>
                        </div>
                        <img src="{{ asset($service->img_service) }}" class="w-full z-0  h-full    object-fill example ">
                    </div>
                </a>
            @empty
                <h2>Aucun service publié pour le moment!</h2>
            @endforelse

        </div>

    </div>
</section>