<ul>
    @foreach($views as $view)
        <li>
            <x-link active=true route={{ $view->name_view }}>
                <i class="fill-current fa-solid {{ $view->ico_view }} w-[18px] h-[18px]"></i>
                ok
            </x-link>
        </li>
        @empty
        <h3 class="text-medium">Aucun lien publié</h3>
        @endforelse
        
    </ul>
        
        