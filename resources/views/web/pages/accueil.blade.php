<x-Web.app-layout>

{{-- caroussel --}}
<section class="relative  bg-blueGray-50">
    <div class="relative pt-16 pb-32 flex content-center items-center justify-center min-h-screen-75">
            <div class="absolute top-0 w-full h-full bg-center bg-cover" style="
                background-image: url('{{ asset('storage/utilities/accompagnement.jpeg') }}');
              ">
              <span id="blackOverlay" class="w-full h-full absolute opacity-75 bg-black"></span>
            </div>
            <div class="container relative mx-auto">
              <div class="items-center flex flex-wrap">
                <div class="w-full lg:w-6/12 px-4 ml-auto mr-auto text-center">
                  <div class="pr-12">
                    <h1 class="text-white font-semibold text-5xl">
                      slogan.
                    </h1>
                    <p class="mt-4 text-lg text-white/90">
                      This is a simple example of a Landing Page you can build using
                      Notus JS. It features multiple CSS components based on the
                      Tailwind CSS design system.
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <div class="top-auto bottom-0 left-0 right-0 w-full absolute pointer-events-none overflow-hidden h-70-px" style="transform: translateZ(0px)">
              <svg class="absolute bottom-0 overflow-hidden" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none" version="1.1" viewBox="0 0 2560 100" x="0" y="0">
                <polygon class="text-blueGray-200 fill-current" points="2560 0 2560 100 0 100"></polygon>
              </svg>
            </div>
          </div>
          <section class="pb-10 bg-blueGray-200 -mt-24">
            <div class="container mx-auto px-4">
              <div class="flex flex-wrap">
                <div class="lg:pt-12 pt-6 w-full md:w-4/12 px-4 text-center">
                  <div class="relative flex flex-col min-w-0 break-words bg-white w-full mb-8 shadow-lg rounded-lg">
                    <div class="px-4 py-5 flex-auto">
                      <div class="text-white p-3 text-center inline-flex items-center justify-center w-12 h-12 mb-5 shadow-lg rounded-full bg-red-400">
                        <i class="fas fa-award"></i>
                      </div>
                      <h6 class="text-xl font-semibold">Awarded Agency</h6>
                      <p class="mt-2 mb-4 text-blueGray-500">
                        Divide details about your product or agency work into parts.
                        A paragraph describing a feature will be enough.
                      </p>
                    </div>
                  </div>
                </div>
                <div class="w-full md:w-4/12 px-4 text-center">
                  <div class="relative flex flex-col min-w-0 break-words bg-white w-full mb-8 shadow-lg rounded-lg">
                    <div class="px-4 py-5 flex-auto">
                      <div class="text-white p-3 text-center inline-flex items-center justify-center w-12 h-12 mb-5 shadow-lg rounded-full bg-lightBlue-400">
                        <i class="fas fa-retweet"></i>
                      </div>
                      <h6 class="text-xl font-semibold">Free Revisions</h6>
                      <p class="mt-2 mb-4 text-blueGray-500">
                        Keep you user engaged by providing meaningful information.
                        Remember that by this time, the user is curious.
                      </p>
                    </div>
                  </div>
                </div>
                <div class="pt-6 w-full md:w-4/12 px-4 text-center">
                  <div class="relative flex flex-col min-w-0 break-words bg-white w-full mb-8 shadow-lg rounded-lg">
                    <div class="px-4 py-5 flex-auto">
                      <div class="text-white p-3 text-center inline-flex items-center justify-center w-12 h-12 mb-5 shadow-lg rounded-full bg-emerald-400">
                        <i class="fas fa-fingerprint"></i>
                      </div>
                      <h6 class="text-xl font-semibold">Verified Company</h6>
                      <p class="mt-2 mb-4 text-blueGray-500">
                        Write a few lines about each one. A paragraph describing a
                        feature will be enough. Keep you user engaged!
                      </p>
                    </div>
                  </div>
                </div>
              </div>
               
          </section>
          </section>
{{-- end --}}
    {{-- a propos --}}
  
    <section class="relative pt-12 bg-blueGray-50">
      <div class="items-center flex flex-wrap">
        <div class="w-full md:w-4/12 ml-auto mr-auto px-4">
          <img alt="..." class="max-w-full rounded-lg shadow-lg" src="{{ asset('storage/utilities/03.png') }}">
        </div>
        <div class="w-full md:w-5/12 ml-auto mr-auto px-4">
          <header class="text-center mx-auto mb-5 lg:px-20">
            <h2 class="text-5xl leading-normal mb-2 font-bold text-black">Qui somme nous ?</h2>
        </header>
          <div class="md:pr-12">
            <div class="text-green-600 p-3 text-center inline-flex items-center justify-center w-16 h-16 mb-6 shadow-lg rounded-full bg-green-300 mt-8">
              <i class="fas fa-rocket text-xl"></i>
            </div>
            <h3 class="text-3xl font-semibold">Une entreprise en pleine croissance</h3>
            <p class="mt-4 text-lg leading-relaxed text-blueGray-500">
              Système qui permet l'identification des opérateurs de cette activité(opérateurs, conducteur, moto, ...)
               et la sécurité des activités de transport par moto-taxi des usagers. 
               Sort l'activité de l'informel vers le formel.
            </p>
            <ul class="list-none mt-6">
              <li class="py-2">
                <div class="flex items-center">
                  <div>
                    <span class="text-xs font-semibold inline-block py-1 px-2 uppercase rounded-full text-green-600 bg-green-200 mr-3"><i class="fas fa-fingerprint"></i></span>
                  </div>
                  <div>
                    <h4 class="text-blueGray-500">
                      Carefully crafted components
                    </h4>
                  </div>
                </div>
              </li>
              <li class="py-2">
                <div class="flex items-center">
                  <div>
                    <span class="text-xs font-semibold inline-block py-1 px-2 uppercase rounded-full text-green-600 bg-green-200 mr-3"><i class="fab fa-html5"></i></span>
                  </div>
                  <div>
                    <h4 class="text-blueGray-500">Amazing page examples</h4>
                  </div>
                </div>
              </li>
              <li class="py-2">
                <div class="flex items-center">
                  <div>
                    <span class="text-xs font-semibold inline-block py-1 px-2 uppercase rounded-full text-green-600 bg-green-200 mr-3"><i class="far fa-paper-plane"></i></span>
                  </div>
                  <div>
                    <h4 class="text-blueGray-500">Dynamic components</h4>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
      </section>
    {{-- fin apropos --}}

    {{-- Section service --}}
        <x-Web.services></x-Web.services>
    {{-- end --}}
    {{-- Section produit --}}
        <x-Web.produits></x-Web.produits>
    {{-- end --}}
    {{-- footer --}}
        <x-Web.footer></x-Web.footer>
    {{-- end --}}
</x-Web.app-layout>
