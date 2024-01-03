<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>{{ config('app.name') }}</title>

        <!-- Fonts -->
        @vite(['resources/css/app.css','resources/css/style.css','resources/js/bundle.js','resources/js/utilities1.js','resources/js/app.js'])
    </head>
    <body   x-data="{ page: 'analytics', 'loaded': true, 'darkMode': true, 'stickyMenu': false, 'sidebarToggle': false, 'scrollTop': false }"
            x-init="darkMode = JSON.parse(localStorage.getItem('darkMode'));$watch('darkMode', value => localStorage.setItem('darkMode', JSON.stringify(value)))"
            :class="{'dark text-bodydark bg-boxdark-2': darkMode === true}">
            @include('admin.layout.preloader')
            <div class="flex h-screen overflow-hidde">
                @include('admin.layout.sidebar')
                <div class="relative flex flex-1 flex-col overflow-y-auto overflow-x-hidden">
                    @include('admin.layout.header')

                    <main>
                        <div class="mx-auto container bg-white/95 w-full h-screen p-4 md:p-6 2xl:p-0">
                            {{ $slot }}
                        </div>
                    </main>
                    <footer class="sticky bottom-0 flex border-top border-slate-100 w-full p-3 justify-center items-center"> Copyright 2024 SERDI All right reserved.</footer>
                </div>
            </div>
    </body>
</html>
