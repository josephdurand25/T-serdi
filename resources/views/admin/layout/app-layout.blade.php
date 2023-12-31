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
                        <div class="mx-auto container p-4 md:p-6 2xl:p-0">
                            <div class=" ">
                                {{ $slot }}
                            </div>
                        </div>
                    </main>

                </div>
            </div>
    </body>
</html>
