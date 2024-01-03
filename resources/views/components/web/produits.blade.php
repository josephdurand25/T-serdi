<section class="pt-20 lg:pt-[20px] pb-12 lg:pb-[90px]">
    <div class="container">
        <div class="flex flex-wrap -mx-4">
            
            <div class="w-full px-4">
                
                <div class="text-center mx-auto mb-12 lg:mb-20 max-w-[510px]">
                    <h2 class="text-3xl font-light   text-black sm:text-4xl lg:text-5xl">
                        Discover our <span class="block w-full font-light text-transparent bg-clip-text bg-gradient-to-r from-green-500 to-green-500 lg:inline">products
                        </span> .
                    </h2>
                    <p class="mb-20 text-lg text-gray-900">Comes directly from the desk of our engineers, creators of sofware solutions.
                    </p>
                </div>
            </div>
        </div>
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-5 px-10">
            @forelse ($produits as $produit)     
            <div class="overflow-hidden border group relative rounded-lg p-[1px] flex justify-center items-center">
                <div class="rounded-lg hidden group-hover:block animate-gradient w-[250%] h-[500%] absolute -top-[60%] -left-[50%] bg-gradient-to-r from-zinc-900 via-gray-200/40 to-zinc-700 shadow-xl"></div>
                    <a class="block w-full relative z-10 rounded-xl bg-white p-6 sm:p-8" href="">
                        <div class="w-[70px] h-[70px] flex items-center justify-center bg-primary rounded-2xl mb-8">
                            <svg class="w-full h-full" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <image href="{{ asset($produit->img_produit) }}" x="0" y="0" width="100%" height="100%"/>
                            </svg>
                        </div>
                        <h4 class="font-semibold text-xl text-dark mb-3">
                            {{ $produit->intitule }}
                       </h4>
                       <p class="text-body-color">
                            {{ $produit->description }}
                        </p>
                    </a>
            </div>
            @empty
            <h2>Aucun produit publié pour le moment!</h2>
            @endforelse
        </div>
    </div>
</section> 