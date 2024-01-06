<nav class="sticky bg-white/90 shadow shadow-gray-300 w-100 px-8 md:px-auto static">
	<div class="relative md:h-16 h-28 mx-auto md:px-4 container flex items-center justify-between flex-wrap md:flex-nowrap">
		<!-- Logo -->
		{{-- {{ dd($setting->logo) }} --}}
		<div class="text-green-500 md:order-1  flex h-full justify-around items-center  ">
			<!-- Heroicon - Chip Outline -->
			<svg xmlns="http://www.w3.org/2000/svg" class="h-10 w-6 " fill="none" viewBox="0 0 15 24" stroke="currentColor">
                {{-- <img src="{{ asset($setting->logo) }}" x="0" y="0" class="w-full  h-full rounded-full" alt="" /> --}}
                <img src="{{ asset('storage/utilities/logo1.png') }}" x="0" y="0" class="w-full  h-full rounded-full" alt="" />
			</svg>
			<h3 class=" md:block mx-4 capitalize font-bold text-xl">{{ $setting->name }}</h3>
		</div>
		<div class="hidden justify-end sm:block md:block text-gray-500 order-3 w-full md:w-auto md:order-2">
			<ul class="flex font-semibold justify-between">
                <!-- Active Link = text-indigo-500
                Inactive Link = hover:text-indigo-500 -->
				<li class="text-green-500 md:px-4 md:py-2 hover:text-green-700 hover:border-b hover:border-green-600 capitalize"><a href="{{ route('home') }}">Accueil</a></li>
				<li class="text-green-500 md:px-4 md:py-2 hover:text-green-700 hover:border-b hover:border-green-600 capitalize"><a href="{{ route('home') }}">A propos</a></li>
				<li class="text-green-500 md:px-4 md:py-2 hover:text-green-700 hover:border-b hover:border-green-600 capitalize"><a href="{{ route('home') }}">Nos services</a></li>
				<li class="text-green-500 md:px-4 md:py-2 hover:text-green-700 hover:border-b hover:border-green-600 capitalize"><a href="{{ route('home') }}">nos produits</a></li>
				{{-- <li class="text-green-500 md:px-4 md:py-2 hover:text-green-700 hover:border-b hover:border-green-600 capitalize"><a href="{{ route('home') }}">Contact</a></li> --}}
			</ul>
		</div>
		<div class="hidden sm:flex md:flex order-2 md:order-3 gap-2">
			{{-- <a 
				href="{{ route('home') }}"
				class="px-4 py-2 outline outline-indigo-500 hover:bg-indigo-600  hover:text-white text-slate-500 rounded-xl flex items-center gap-2">
				<!-- Heroicons - Login Solid -->
				<i class="fa-solid fa-user-plus"></i>
				<span>S'inscrire </span>
			</a> --}}
			<a 
				href="{{ route('home')}}"
				class="px-4 py-2 bg-green-600 hover:bg-green-800 text-gray-50 rounded-xl flex items-center gap-2">
                <!-- Heroicons - Login Solid -->
				<i class="fa-solid fa-phone"></i>
                <span>Contactez-nous</span>
            </a>
		</div>
	</div>
</nav>