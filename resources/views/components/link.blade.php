@props(['icon','route'])

<a {{ $attributes->merge(['class' => "group  relative flex items-center gap-2.5 rounded-sm py-2 px-4 font-medium text-bodydark1 duration-300 ease-in-out hover:bg-graydark dark:hover:bg-meta-4"]) }}  href="{{ route($route) }}" >
    <i class="fa-solid {{ $icon }} w-[18px] h-[18px]"></i>
    {{ $slot }}
</a>